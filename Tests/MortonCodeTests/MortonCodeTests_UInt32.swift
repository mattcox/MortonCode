//
//  MortonCodeTests_UInt32.swift
//  MortonCode
//
//  Created by Matt Cox on 31/03/2025.
//  Copyright © 2025 Matt Cox. All rights reserved.
//

import Testing
@testable import MortonCode

@Suite("MortonCode<UInt32>")
struct MortonCode_UInt32 {
	@Test("[UInt8] -> UInt32 #1", arguments: [
		(coordinates: [175, 229, 112, 156], value: UInt32(3061619475)),
		(coordinates: [42, 32, 16, 9, 29], value: UInt32(122470456)),
		(coordinates: [9, 31, 12, 30, 28, 17], value: UInt32(981328547)),
		(coordinates: [15, 8, 8, 11, 2, 0, 4], value: UInt32(32525449)),
		(coordinates: [14, 11, 9, 4, 2, 10, 14, 5], value: UInt32(1741255558)),
		(coordinates: [7, 6, 1, 6, 1, 4, 3, 6, 6], value: UInt32(112170581))
	])
	func decodeEncode_UInt32_1(arguments: (coordinates: [UInt8], value: UInt32)) throws {
		let morton = try MortonCode<UInt32>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
	
	@Test("[UInt8] -> UInt32 #2", arguments: [
		(coordinates: [5, 3, 0, 7, 7, 3, 2, 0, 2, 0], value: UInt32(26601531)),
		(coordinates: [3, 3, 1, 3, 3, 1, 0, 0, 0, 2, 0], value: UInt32(1103935)),
		(coordinates: [0, 3, 2, 2, 2, 2, 0, 3, 3, 0, 3, 1], value: UInt32(6024578)),
		(coordinates: [3, 2, 1, 3, 0, 2, 3, 0, 1, 1, 3, 1, 3], value: UInt32(42827597)),
		(coordinates: [2, 3, 2, 1, 2, 0, 0, 2, 0, 2, 0, 3, 3, 1], value: UInt32(111540234)),
		(coordinates: [1, 3, 0, 1, 1, 1, 3, 3, 3, 0, 1, 0, 0, 1, 1], value: UInt32(14771707)),
		(coordinates: [2, 0, 3, 0, 0, 0, 0, 2, 3, 1, 0, 0, 0, 0, 1, 3], value: UInt32(2173027076))
	])
	func decodeEncode_UInt32_2(arguments: (coordinates: [UInt8], value: UInt32)) throws {
		let morton = try MortonCode<UInt32>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}

	@Test("[UInt16] -> UInt32 #1", arguments: [
		(coordinates: [12061, 31418], value: UInt32(786271193)),
		(coordinates: [304, 500, 489], value: UInt32(131840132)),
		(coordinates: [122, 94, 146, 115], value: UInt32(1268724472)),
		(coordinates: [24, 36, 39, 25, 39], value: UInt32(747952796)),
		(coordinates: [0, 12, 1, 2, 8, 22], value: UInt32(541731332)),
		(coordinates: [5, 1, 3, 14, 13, 14, 3], value: UInt32(118388311)),
		(coordinates: [8, 4, 12, 8, 6, 11, 10, 0], value: UInt32(1830187040))
	])
	func decodeEncode_UInt32_1(arguments: (coordinates: [UInt16], value: UInt32)) throws {
		let morton = try MortonCode<UInt32>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
	
	@Test("[UInt16] -> UInt32 #2", arguments: [
		(coordinates: [2, 4, 7, 7, 7, 1, 0, 0, 3], value: UInt32(8010556)),
		(coordinates: [2, 4, 2, 0, 0, 0, 1, 4, 6, 3], value: UInt32(405542464)),
		(coordinates: [0, 3, 0, 0, 3, 1, 3, 0, 1, 0, 3], value: UInt32(2266482)),
		(coordinates: [2, 3, 0, 2, 0, 3, 1, 2, 3, 3, 1, 0], value: UInt32(3848034)),
		(coordinates: [3, 1, 3, 2, 2, 0, 2, 3, 2, 0, 3, 1, 2], value: UInt32(45853831)),
		(coordinates: [3, 3, 3, 2, 2, 1, 1, 2, 1, 0, 2, 2, 0, 0], value: UInt32(52937063)),
		(coordinates: [0, 1, 2, 2, 3, 2, 1, 2, 0, 2, 3, 2, 0, 0, 0], value: UInt32(123602002)),
		(coordinates: [3, 1, 2, 1, 0, 0, 3, 3, 0, 3, 2, 3, 0, 1, 1, 0], value: UInt32(247818955))
	])
	func decodeEncode_UInt32_2(arguments: (coordinates: [UInt16], value: UInt32)) throws {
		let morton = try MortonCode<UInt32>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}

	@Test("[UInt32] -> UInt32 #1", arguments: [
		(coordinates: [4129369749], value: UInt32(4129369749)),
		(coordinates: [38977, 46157], value: UInt32(3412078755)),
		(coordinates: [419, 357, 69], value: UInt32(54100367)),
		(coordinates: [104, 23, 51, 101], value: UInt32(165026414)),
		(coordinates: [22, 48, 30, 13, 10], value: UInt32(75380392)),
		(coordinates: [25, 7, 23, 3, 1, 7], value: UInt32(84306879)),
		(coordinates: [6, 11, 10, 3, 5, 13, 0], value: UInt32(80496570))
	])
	func decodeEncode_UInt32_1(arguments: (coordinates: [UInt32], value: UInt32)) throws {
		let morton = try MortonCode<UInt32>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
	
	@Test("[UInt32] -> UInt32 #2", arguments: [
		(coordinates: [14, 11, 12, 7, 0, 5, 4, 8], value: UInt32(2272070442)),
		(coordinates: [1, 5, 7, 1, 7, 3, 7, 1, 7], value: UInt32(89844223)),
		(coordinates: [7, 0, 0, 0, 3, 7, 2, 2, 6, 0], value: UInt32(303547441)),
		(coordinates: [0, 3, 1, 0, 1, 0, 2, 0, 0, 0, 3], value: UInt32(2233366)),
		(coordinates: [0, 2, 2, 0, 2, 2, 3, 2, 2, 2, 2, 1], value: UInt32(8349760)),
		(coordinates: [3, 1, 1, 2, 2, 3, 0, 1, 2, 2, 1, 1, 3], value: UInt32(40320167)),
		(coordinates: [1, 1, 0, 2, 1, 1, 0, 3, 3, 2, 3, 3, 3, 1], value: UInt32(132267443)),
		(coordinates: [2, 2, 2, 0, 2, 2, 0, 1, 1, 3, 3, 3, 3, 2, 0], value: UInt32(521904000)),
		(coordinates: [2, 2, 0, 1, 0, 1, 2, 0, 1, 1, 2, 1, 3, 0, 3, 0], value: UInt32(1413700392))
	])
	func decodeEncode_UInt32_2(arguments: (coordinates: [UInt32], value: UInt32)) throws {
		let morton = try MortonCode<UInt32>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}

	@Test("[UInt64] -> UInt32 #1", arguments: [
		(coordinates: [1230700064], value: UInt32(1230700064)),
		(coordinates: [43574, 22355], value: UInt32(1718495006)),
		(coordinates: [261, 785, 869], value: UInt32(923935047)),
		(coordinates: [85, 97, 200, 99], value: UInt32(1335968139)),
		(coordinates: [45, 19, 54, 22, 12], value: UInt32(183039427)),
		(coordinates: [4, 3, 10, 21, 1, 13], value: UInt32(143823290)),
		(coordinates: [7, 3, 8, 10, 3, 4, 3], value: UInt32(25718227))
	])
	func decodeEncode_UInt32_1(arguments: (coordinates: [UInt64], value: UInt32)) throws {
		let morton = try MortonCode<UInt32>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
	
	@Test("[UInt64] -> UInt32 #2", arguments: [
		(coordinates: [1, 6, 8, 13, 7, 8, 8, 10], value: UInt32(3961164313)),
		(coordinates: [5, 1, 6, 5, 2, 4, 3, 3, 0], value: UInt32(11905227)),
		(coordinates: [4, 2, 6, 1, 3, 5, 2, 7, 1, 2], value: UInt32(173758904)),
		(coordinates: [3, 0, 2, 3, 1, 0, 0, 3, 2, 2, 3], value: UInt32(3959961)),
		(coordinates: [3, 2, 2, 3, 0, 2, 0, 1, 3, 2, 0, 0], value: UInt32(3338633)),
		(coordinates: [3, 3, 2, 0, 3, 0, 0, 2, 2, 2, 0, 2, 3], value: UInt32(57864211)),
		(coordinates: [2, 2, 2, 1, 1, 3, 3, 0, 2, 1, 1, 1, 1, 0], value: UInt32(5889656)),
		(coordinates: [2, 2, 3, 1, 2, 1, 2, 2, 1, 0, 3, 3, 2, 2, 2], value: UInt32(1047235884)),
		(coordinates: [3, 2, 1, 2, 1, 3, 0, 3, 0, 0, 2, 3, 1, 2, 0, 1], value: UInt32(749443253))
	])
	func decodeEncode_UInt32_2(arguments: (coordinates: [UInt64], value: UInt32)) throws {
		let morton = try MortonCode<UInt32>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
}
