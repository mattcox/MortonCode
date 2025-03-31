//
//  MortonCode.swift
//  MortonCode
//
//  Created by Matt Cox on 27/03/2025.
//  Copyright © 2025 Matt Cox. All rights reserved.
//

/// A structure representing a Morton code (Z-order curve), which interleaves
/// bits of two or more coordinates to produce a single integer value that
/// preserves spatial locality.
///
public struct MortonCode<T: UnsignedInteger & FixedWidthInteger> {
/// The value for the encoded Morton Code.
///
	public var value: T
	
/// Initialize the Morton Code with a single value.
///
	public init(value: T) {
		self.value = value
	}
	
/// Returns an array containing the coordinates that the Morton Code
/// represents.
///
/// Because a Morton Code can be decoded into any number of coordinate
/// components, the number of components must be specified.
///
/// - Parameters:
///   - numberOfDimensions: The number of coordinate components to decode
///   the Morton Code into.
///
/// - Returns: An array containing the coordinates that the Morton Code
/// rerpesents.
///
	public func coordinates(count numberOfDimensions: Int) -> [T] {
		guard numberOfDimensions > 0 else {
			return []
		}
	
		// The Morton Code interleaves N bits based on available space. As the
		// maximum number of bits is the same as the bit width of the generic
		// type, the number of bits per component is the bit width of the
		// generic type divided by the number of dimensions.
		//
		// For example if the Morton Code represents a 2D value and the generic
		// type is 64 bits wide, the return values will each represent a number
		// that fits into 32 bits. However, the return type will always use the
		// full size of the generic type, even if most bits will go unused.
		//
		// The only case where all bits on the return type will be used is when
		// the Morton Code represents a single coordinate, which isn't really a
		// valid use case.
		//
		let maximumBitsPerCoordinate = T.bitWidth / numberOfDimensions
		
		// Deinterleave the bits.
		//
		var coordinates = Array(repeating: T.zero, count: numberOfDimensions)
		for bit in 0..<maximumBitsPerCoordinate {
			for dimension in 0..<numberOfDimensions {
				let bitIndex = bit * numberOfDimensions + dimension
				let bitMask = T(1) << T(bitIndex)
				let bitValue = (value & bitMask) >> bitIndex
				coordinates[dimension] |= bitValue << bit
			}
		}
		
		return coordinates
	}
}

extension MortonCode {
/// Initialize the Morton Code with the specified coordinate values.
///
/// - Parameters:
///   - coordinates: The coordinates to encode into the Morton Code.
///
/// - Note: The values stored in the coordinates must be able to be
/// represented by the available number of bits provided for each
/// coordinate. For example a 2D morton code encoded into a UInt64 only
/// supports coordinate values between 0 and 4294967295, as 32 bits will be
/// reserved per coordinate.
///
	public init<C: UnsignedInteger & FixedWidthInteger>(_ coordinates: C...) throws {
		self = try MortonCode(coordinates.map { $0 })
	}
	
/// Initialize the Morton Code with the specified coordinate values.
///
/// - Parameters:
///   - coordinates: The coordinates to encode into the Morton Code.
///
/// - Note: The values stored in the coordinates must be able to be
/// represented by the available number of bits provided for each
/// coordinate. For example a 2D morton code encoded into a UInt64 only
/// supports coordinate values between 0 and 4294967295, as 32 bits will be
/// reserved per coordinate.
///
	public init<C: UnsignedInteger & FixedWidthInteger>(_ coordinates: [C]) throws {
		let numberOfDimensions = coordinates.count
		guard numberOfDimensions > 0, numberOfDimensions <= T.bitWidth else {
			throw Error.invalidNumberOfCoordinates
		}
		
		// The Morton Code interleaves N bits based on available space. As the
		// maximum number of bits is the same as the bit width of the generic
		// type, the number of bits per component is the bit width of the
		// generic type divided by the number of dimensions.
		//
		// For example if the Morton Code represents a 2D value and the generic
		// type is 64 bits wide, the return values will each represent a number
		// that fits into 32 bits. However, the return type will always use the
		// full size of the generic type, even if most bits will go unused.
		//
		// The only case where all bits on the return type will be used is when
		// the Morton Code represents a single coordinate, which isn't really a
		// valid use case.
		//
		let maximumBitsPerCoordinate = T.bitWidth / numberOfDimensions
		if C.bitWidth > maximumBitsPerCoordinate {
			// Check if the values stored in the coordinates is greater than the
			// allowed value.
			//
			for coordinate in coordinates {
				if coordinate >= (1 << maximumBitsPerCoordinate) {
					throw Error.coordinateTooLarge
				}
			}
		}
		
		// Only read the number of bits from the coordinate that will fit. This
		// is either the number of bits in the coordinate, or the maximum number
		// of bits that will fit into the available space. Whichever is smaller.
		//
		let bitsPerCooordinate = min(maximumBitsPerCoordinate, C.bitWidth)
		
		// Interleave the coordinate bits.
		//
		var mortonCode: T = .zero
		for bit in 0..<bitsPerCooordinate {
			for (dimension, value) in coordinates.enumerated() {
				let bitValue = (T(value >> C(bit))) & 1
				mortonCode |= bitValue << T(bit * numberOfDimensions + dimension)
			}
		}

		self.value = mortonCode
	}
}

extension MortonCode where T: BinaryInteger {
/// Initialize the Morton Code with the specified coordinate values.
///
/// This can be useful for storing coordinates within a bounding box for
/// example, where the coordinate is a position, and the range is the limits
/// of the bounding box.
///
/// - Parameters:
///   - coordinates: The coordinates to encode into the Morton Code, as well
///   as minimum and maximum values for the coordinate.
///
	public init<C: BinaryFloatingPoint>(_ coordinates: (coordinate: C, range: ClosedRange<C>)...) throws {
		self = try MortonCode(coordinates.map { $0 })
	}
	
/// Initialize the Morton Code with the specified coordinate values.
///
/// This can be useful for storing coordinates within a bounding box for
/// example, where the coordinate is a position, and the range is the limits
/// of the bounding box.
///
/// - Parameters:
///   - coordinates: The coordinates to encode into the Morton Code, as well
///   as minimum and maximum values for the coordinate.
///
	public init<C: BinaryFloatingPoint>(_ coordinates: [(coordinate: C, range: ClosedRange<C>)]) throws {
		// Determine the maximum value that can fit into the Morton Code. For
		// example, if the Morton Code is 64 bits, and there are three values
		// provided, then each coordinate can use 21 bits, or have a maximum
		// value of 2097151.
		//
		let numberOfDimensions = coordinates.count
		guard numberOfDimensions > 0, numberOfDimensions <= T.bitWidth else {
			throw Error.invalidNumberOfCoordinates
		}
		
		let maximumBitsPerCoordinate = T.bitWidth / numberOfDimensions
		let maximumValue = T(numberOfDimensions == 1 ? T.bitWidth : ((1 << maximumBitsPerCoordinate) - 1))
		
		// Remap each coordinate into the range 0.0...1.0, and then multiply it
		// by the maximum value. Finally, case it to the generic type T, which
		// is the integer coordinate to store in the Morton Code.
		//
		let coordinateValues: [T] = try coordinates.map { coordinate in
			let remapped = min(max(coordinate.coordinate, coordinate.range.lowerBound), coordinate.range.upperBound)

			let divider = coordinate.range.upperBound - coordinate.range.lowerBound
			guard divider != .zero else {
				throw Error.rangeIsZero
			}
			
			return T((remapped - coordinate.range.lowerBound) / divider * C(maximumValue))
		}
		
		// Encode the morton code as usual.
		//
		self = try MortonCode(coordinateValues)
	}
}

extension MortonCode: Comparable where T: Comparable {
	public static func <(lhs: MortonCode, rhs: MortonCode) -> Bool {
		lhs.value < rhs.value
	}
}

extension MortonCode: Decodable where T: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		self.value = try container.decode(T.self)
	}
}

extension MortonCode: Encodable where T: Encodable {
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(self.value)
	}
}

extension MortonCode: Equatable {
	
}

extension MortonCode: Hashable where T: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(self.value)
	}
}

extension MortonCode {
/// A set of errors related to Morton Code generation.
///
	public enum Error: Swift.Error {
	/// An error indicating that the provided coordinate is numerically too
	/// large.
	///
		case coordinateTooLarge
		
	/// An error indicating that the provided number of coordinates is
	/// either too small (less than one), or larger than can be encoded into
	/// the available space of the Morton Code.
	///
		case invalidNumberOfCoordinates
		
	/// An error indicating if the provided range for encoding a Morton
	/// Code from a floating point value is zero.
	///
		case rangeIsZero
	}
}
