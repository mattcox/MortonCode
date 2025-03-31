//
//  MortonCode+simd.swift
//  MortonCode
//
//  Created by Matt Cox on 30/03/2025.
//  Copyright © 2025 Matt Cox. All rights reserved.
//

#if canImport(simd)
import simd

extension MortonCode {
/// Initialize the Morton Code with the specified coordinate values.
///
/// This can be useful for storing coordinates within a bounding box for
/// example, where the coordinate is a position, and the range is the limits
/// of the bounding box.
///
/// - Parameters:
///   - coordinates: The coordinates to encode into the Morton Code.
///   - minimum: The minimum bounds for the coordinates.
///   - maximum: The maximum bounds for the coordinates.
///
	public init<S: SIMD>(coordinates: S, minimum: S = .zero, maximum: S) throws where S.Scalar: Comparable & BinaryFloatingPoint {
		self = try MortonCode((0..<S.scalarCount).map {
			(coordinate: coordinates[$0], range: min(minimum[$0], maximum[$0])...max(minimum[$0], maximum[$0]))
		})
	}
}
#endif
