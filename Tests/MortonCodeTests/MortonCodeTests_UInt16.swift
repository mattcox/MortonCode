//
//  MortonCodeTests_UInt16.swift
//  MortonCode
//
//  Created by Matt Cox on 31/03/2025.
//  Copyright © 2025 Matt Cox. All rights reserved.
//

import Testing
@testable import MortonCode

@Suite("MortonCode<UInt16>")
struct MortonCode_UInt16 {
	@Test("[UInt8] -> UInt16", arguments: [
		(coordinates: [121, 162], value: UInt16(40265)),
		(coordinates: [7, 1, 7], value: UInt16(367)),
		(coordinates: [15, 12, 2, 5], value: UInt16(15193)),
		(coordinates: [4, 0, 3, 0, 5], value: UInt16(17556)),
		(coordinates: [1, 0, 2, 2, 3, 1], value: UInt16(1841)),
		(coordinates: [0, 3, 2, 0, 0, 3, 3], value: UInt16(13154)),
		(coordinates: [0, 2, 3, 0, 1, 1, 3, 1], value: UInt16(18164))
	])
	func decodeEncode_UInt16(arguments: (coordinates: [UInt8], value: UInt16)) throws {
		let morton = try MortonCode<UInt16>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}

	@Test("[UInt16] -> UInt16", arguments: [
		(coordinates: [49499], value: UInt16(49499)),
		(coordinates: [181, 145], value: UInt16(50963)),
		(coordinates: [17, 24, 10], value: UInt16(15393)),
		(coordinates: [3, 12, 12, 9], value: UInt16(58905)),
		(coordinates: [7, 2, 5, 6, 2], value: UInt16(14181)),
		(coordinates: [1, 3, 2, 2, 2, 0], value: UInt16(1923)),
		(coordinates: [0, 0, 0, 0, 1, 1, 2], value: UInt16(8240)),
		(coordinates: [0, 3, 1, 3, 3, 1, 1, 1], value: UInt16(6910))
	])
	func decodeEncode_UInt16(arguments: (coordinates: [UInt16], value: UInt16)) throws {
		let morton = try MortonCode<UInt16>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}

	@Test("[UInt32] -> UInt16", arguments: [
		(coordinates: [21726], value: UInt16(21726)),
		(coordinates: [44, 203], value: UInt16(42202)),
		(coordinates: [5, 22, 22], value: UInt16(25073)),
		(coordinates: [2, 1, 9, 9], value: UInt16(49182)),
		(coordinates: [4, 6, 2, 0, 2], value: UInt16(3776)),
		(coordinates: [1, 2, 2, 2, 0, 3], value: UInt16(2977)),
		(coordinates: [0, 2, 3, 3, 0, 2, 1], value: UInt16(5964)),
		(coordinates: [2, 2, 0, 0, 2, 0, 1, 1], value: UInt16(5056))
	])
	func decodeEncode_UInt16(arguments: (coordinates: [UInt32], value: UInt16)) throws {
		let morton = try MortonCode<UInt16>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}

	@Test("[UInt64] -> UInt16", arguments: [
		(coordinates: [7502], value: UInt16(7502)),
		(coordinates: [210, 50], value: UInt16(23308)),
		(coordinates: [3, 2, 20], value: UInt16(16665)),
		(coordinates: [1, 3, 14, 9], value: UInt16(50283)),
		(coordinates: [2, 7, 5, 0, 3], value: UInt16(6774)),
		(coordinates: [1, 1, 2, 2, 3, 1], value: UInt16(1843)),
		(coordinates: [1, 3, 3, 2, 0, 1, 0], value: UInt16(1831)),
		(coordinates: [3, 1, 1, 3, 3, 1, 3, 2], value: UInt16(55679))
	])
	func decodeEncode_UInt16(arguments: (coordinates: [UInt64], value: UInt16)) throws {
		let morton = try MortonCode<UInt16>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
}
