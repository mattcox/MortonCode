//
//  MortonCodeTests_UInt8.swift
//  MortonCode
//
//  Created by Matt Cox on 31/03/2025.
//  Copyright © 2025 Matt Cox. All rights reserved.
//

import Testing
@testable import MortonCode

@Suite("MortonCode<UInt8>")
struct MortonCode_UInt8 {
	@Test("[UInt8] -> UInt8", arguments: [
		(coordinates: [104], value: UInt8(104)),
		(coordinates: [7, 2], value: UInt8(29)),
		(coordinates: [0, 0, 1], value: UInt8(4)),
		(coordinates: [3, 3, 3, 1], value: UInt8(127))
	])
	func decodeEncode_UInt8(arguments: (coordinates: [UInt8], value: UInt8)) throws {
		let morton = try MortonCode<UInt8>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}

	@Test("[UInt16] -> UInt8", arguments: [
		(coordinates: [26], value: UInt8(26)),
		(coordinates: [14, 9], value: UInt8(214)),
		(coordinates: [1, 1, 2], value: UInt8(35)),
		(coordinates: [0, 0, 0, 3], value: UInt8(136))
	])
	func decodeEncode_UInt8(arguments: (coordinates: [UInt16], value: UInt8)) throws {
		let morton = try MortonCode<UInt8>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}

	@Test("[UInt32] -> UInt8", arguments: [
		(coordinates: [7], value: UInt8(7)),
		(coordinates: [13, 3], value: UInt8(91)),
		(coordinates: [1, 0, 3], value: UInt8(37)),
		(coordinates: [0, 1, 3, 1], value: UInt8(78))
	])
	func decodeEncode_UInt8(arguments: (coordinates: [UInt32], value: UInt8)) throws {
		let morton = try MortonCode<UInt8>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}

	@Test("[UInt64] -> UInt8", arguments: [
		(coordinates: [251], value: UInt8(251)),
		(coordinates: [12, 4], value: UInt8(112)),
		(coordinates: [3, 2, 3], value: UInt8(61)),
		(coordinates: [2, 2, 0, 3], value: UInt8(184))
	])
	func decodeEncode_UInt8(arguments: (coordinates: [UInt64], value: UInt8)) throws {
		let morton = try MortonCode<UInt8>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
}
