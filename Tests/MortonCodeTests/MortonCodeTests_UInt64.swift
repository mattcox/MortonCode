//
//  MortonCodeTests_UInt64.swift
//  MortonCode
//
//  Created by Matt Cox on 31/03/2025.
//  Copyright © 2025 Matt Cox. All rights reserved.
//

import Testing
@testable import MortonCode

@Suite("MortonCode<UInt64>")
struct MortonCode_UInt64 {
	@Test("[UInt8] -> UInt64 #1", arguments: [
		(coordinates: [208, 255, 133, 98, 237, 66, 25, 123], value: UInt64(1710130649351236310)),
		(coordinates: [6, 75, 52, 32, 7, 49, 41, 48, 35], value: UInt64(53350786944870258)),
		(coordinates: [24, 13, 22, 57, 7, 10, 57, 16, 40, 28], value: UInt64(370084459365584986)),
		(coordinates: [30, 6, 5, 14, 11, 31, 20, 25, 0, 31, 24], value: UInt64(30994625515870900)),
		(coordinates: [2, 12, 15, 21, 16, 9, 0, 18, 4, 6, 22, 2], value: UInt64(331017214266724396)),
		(coordinates: [5, 3, 1, 9, 3, 7, 9, 4, 14, 8, 4, 1, 5], value: UInt64(462166467958911)),
		(coordinates: [9, 9, 6, 10, 8, 4, 15, 7, 11, 8, 15, 13, 5, 12], value: UInt64(53321702250323395)),
		(coordinates: [11, 11, 6, 9, 15, 15, 15, 15, 5, 4, 3, 4, 7, 12, 3], value: UInt64(297078134048282107)),
		(coordinates: [6, 11, 13, 6, 15, 4, 1, 7, 8, 3, 3, 11, 8, 6, 15, 14], value: UInt64(15642937462074592982))
	])
	func decodeEncode_UInt64_1(arguments: (coordinates: [UInt8], value: UInt64)) throws {
		let morton = try MortonCode<UInt64>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
	
	@Test("[UInt8] -> UInt64 #2", arguments: [
		(coordinates: [4, 1, 6, 7, 3, 3, 6, 3, 0, 6, 4, 4, 6, 0, 5, 3, 6], value: UInt64(1540652650774714)),
		(coordinates: [3, 7, 6, 5, 7, 1, 3, 5, 6, 7, 2, 2, 1, 1, 3, 5, 0, 4], value: UInt64(11322638628352763)),
		(coordinates: [1, 6, 0, 5, 6, 0, 0, 5, 3, 7, 1, 0, 4, 7, 7, 2, 3, 7, 0], value: UInt64(44093298609186697)),
		(coordinates: [2, 4, 1, 2, 2, 2, 4, 2, 2, 3, 1, 2, 5, 1, 0, 3, 7, 1, 7, 0], value: UInt64(364864518688847364)),
		(coordinates: [7, 0, 4, 6, 0, 4, 0, 4, 3, 4, 7, 0, 0, 6, 4, 3, 4, 2, 1, 4, 0], value: UInt64(2709676401390552321)),
		(coordinates: [3, 0, 3, 3, 2, 0, 3, 3, 0, 2, 1, 0, 1, 0, 0, 0, 1, 1, 1, 2, 3, 0], value: UInt64(6600145704141)),
		(coordinates: [3, 2, 2, 1, 2, 2, 3, 1, 0, 0, 3, 0, 1, 3, 3, 0, 1, 0, 2, 2, 3, 0, 0], value: UInt64(15608910542025)),
		(coordinates: [0, 1, 3, 1, 0, 1, 1, 0, 3, 1, 3, 2, 0, 2, 3, 2, 0, 3, 1, 0, 1, 0, 1, 2], value: UInt64(143954491623278)),
		(coordinates: [0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 3, 0, 0, 3, 2, 0, 0, 3, 0, 0, 0, 1, 0], value: UInt64(21028168834074)),
	])
	func decodeEncode_UInt64_2(arguments: (coordinates: [UInt8], value: UInt64)) throws {
		let morton = try MortonCode<UInt64>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
	
	@Test("[UInt8] -> UInt64 #3", arguments: [
		(coordinates: [2, 3, 2, 1, 2, 0, 0, 2, 2, 1, 1, 3, 0, 3, 2, 2, 3, 0, 3, 2, 2, 0, 0, 1, 3, 0], value: UInt64(1257456324128266)),
		(coordinates: [2, 1, 1, 1, 0, 0, 1, 0, 2, 1, 0, 0, 2, 2, 3, 3, 0, 3, 3, 3, 2, 2, 1, 0, 1, 2, 3], value: UInt64(14064437569700430)),
		(coordinates: [1, 0, 3, 3, 2, 2, 3, 3, 1, 2, 3, 3, 3, 3, 1, 0, 3, 1, 0, 0, 1, 1, 2, 2, 2, 2, 1, 0], value: UInt64(16910419112459725)),
		(coordinates: [0, 3, 1, 1, 2, 2, 0, 2, 0, 2, 1, 0, 2, 3, 2, 0, 1, 0, 2, 2, 0, 3, 0, 3, 0, 0, 0, 0, 2], value: UInt64(150182663689413646)),
		(coordinates: [3, 2, 2, 0, 3, 2, 3, 1, 0, 0, 1, 1, 2, 3, 3, 1, 0, 3, 1, 1, 3, 0, 3, 2, 3, 2, 1, 2, 1, 2], value: UInt64(789427486644432081)),
		(coordinates: [0, 1, 0, 2, 3, 2, 2, 0, 1, 2, 2, 0, 2, 2, 2, 2, 1, 1, 2, 1, 3, 3, 0, 0, 3, 0, 1, 1, 0, 3, 1], value: UInt64(1196404150481125650)),
		(coordinates: [3, 2, 1, 0, 0, 3, 3, 3, 1, 2, 2, 1, 0, 2, 2, 0, 0, 1, 1, 3, 2, 1, 2, 0, 0, 1, 1, 0, 3, 1, 1, 2], value: UInt64(10401176466538498533))
	])
	func decodeEncode_UInt64_3(arguments: (coordinates: [UInt8], value: UInt64)) throws {
		let morton = try MortonCode<UInt64>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}

	@Test("[UInt16] -> UInt64 #1", arguments: [
		(coordinates: [27604, 35642, 37458, 65109], value: UInt64(16833532861510265192)),
		(coordinates: [2628, 1269, 2318, 1932, 3857], value: UInt64(786788877508951186)),
		(coordinates: [220, 263, 378, 954, 874, 238], value: UInt64(440973840226860930)),
		(coordinates: [100, 371, 310, 64, 121, 80, 406], value: UInt64(5080320686402134802)),
		(coordinates: [168, 249, 73, 135, 203, 164, 83, 182], value: UInt64(13499156987105564766)),
		(coordinates: [105, 19, 12, 62, 58, 28, 114, 99, 45], value: UInt64(3493429546729977219))
	])
	func decodeEncode_UInt64_1(arguments: (coordinates: [UInt16], value: UInt64)) throws {
		let morton = try MortonCode<UInt64>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
	
	@Test("[UInt16] -> UInt64 #2", arguments: [
		(coordinates: [5, 16, 41, 19, 3, 21, 15, 5, 40, 7], value: UInt64(292780503933215485)),
		(coordinates: [14, 25, 4, 4, 8, 10, 25, 23, 3, 16, 6], value: UInt64(12421076079151554)),
		(coordinates: [3, 13, 2, 4, 8, 1, 8, 18, 27, 3, 28, 7], value: UInt64(396410414855379747)),
		(coordinates: [14, 5, 10, 1, 6, 0, 2, 1, 12, 15, 10, 12, 7], value: UInt64(2114276282774154)),
		(coordinates: [10, 6, 15, 10, 1, 13, 15, 1, 8, 7, 7, 11, 10, 4], value: UInt64(28629523588435700)),
		(coordinates: [10, 8, 15, 14, 10, 4, 8, 12, 7, 11, 7, 15, 5, 12, 12], value: UInt64(962643780527103748))
	])
	func decodeEncode_UInt64_2(arguments: (coordinates: [UInt16], value: UInt64)) throws {
		let morton = try MortonCode<UInt64>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
	
	@Test("[UInt16] -> UInt64 #3", arguments: [
		(coordinates: [9, 2, 13, 4, 2, 7, 2, 2, 15, 6, 12, 8, 6, 4, 5, 3], value: UInt64(938287130721042725)),
		(coordinates: [7, 1, 5, 0, 3, 4, 4, 4, 3, 0, 1, 0, 3, 2, 6, 2, 0], value: UInt64(285417255605527)),
		(coordinates: [3, 2, 5, 7, 4, 6, 6, 7, 6, 2, 3, 2, 0, 0, 1, 5, 3, 4], value: UInt64(11293926810829965)),
		(coordinates: [5, 0, 6, 6, 2, 1, 4, 1, 5, 1, 7, 7, 7, 2, 0, 2, 6, 4, 2], value: UInt64(56105251754745761)),
		(coordinates: [4, 5, 2, 1, 6, 3, 4, 7, 4, 4, 3, 6, 4, 2, 3, 6, 2, 5, 6, 2], value: UInt64(476207139464037546)),
		(coordinates: [2, 5, 7, 4, 0, 7, 6, 4, 4, 1, 4, 5, 1, 1, 3, 6, 4, 6, 3, 1, 3], value: UInt64(1024492877339458086)),
		(coordinates: [1, 1, 1, 3, 3, 2, 2, 1, 1, 1, 0, 3, 1, 0, 2, 2, 2, 2, 2, 3, 3, 1], value: UInt64(8736470473631)),
		(coordinates: [0, 3, 2, 1, 0, 0, 3, 3, 0, 3, 2, 0, 2, 3, 0, 0, 3, 2, 2, 0, 3, 2, 1], value: UInt64(30354200142538)),
		(coordinates: [0, 0, 2, 0, 0, 2, 2, 1, 3, 2, 1, 2, 0, 0, 0, 3, 3, 2, 0, 2, 0, 3, 3, 2], value: UInt64(258983917094272)),
		(coordinates: [3, 0, 2, 1, 2, 0, 0, 0, 3, 3, 3, 2, 1, 2, 1, 2, 3, 0, 3, 0, 1, 1, 0, 3, 2], value: UInt64(856924001490697))
	])
	func decodeEncode_UInt64_3(arguments: (coordinates: [UInt16], value: UInt64)) throws {
		let morton = try MortonCode<UInt64>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
	
	@Test("[UInt16] -> UInt64 #4", arguments: [
		(coordinates: [0, 0, 2, 1, 2, 0, 0, 2, 2, 2, 1, 1, 3, 2, 3, 3, 1, 1, 2, 2, 1, 1, 1, 0, 0, 1], value: UInt64(56961239604232)),
		(coordinates: [3, 2, 3, 0, 0, 0, 2, 1, 1, 2, 2, 0, 2, 0, 3, 2, 2, 0, 2, 0, 1, 3, 1, 1, 0, 3, 2], value: UInt64(13843616886702469)),
		(coordinates: [3, 2, 0, 1, 3, 3, 3, 3, 0, 3, 0, 3, 3, 3, 0, 3, 3, 0, 1, 3, 0, 3, 1, 0, 2, 0, 1, 1], value: UInt64(5237726516198137)),
		(coordinates: [1, 3, 2, 0, 0, 3, 2, 0, 1, 2, 0, 3, 2, 3, 2, 0, 1, 1, 0, 1, 2, 1, 2, 1, 2, 3, 2, 0, 0], value: UInt64(65881966908221731)),
		(coordinates: [2, 3, 3, 2, 1, 1, 3, 0, 3, 3, 3, 3, 0, 2, 2, 2, 0, 1, 2, 0, 3, 0, 1, 2, 1, 2, 1, 0, 3, 3], value: UInt64(911200281152327542)),
		(coordinates: [0, 3, 0, 2, 3, 3, 1, 1, 1, 1, 1, 2, 2, 2, 0, 3, 2, 3, 3, 0, 1, 0, 2, 3, 2, 2, 0, 3, 2, 0, 3], value: UInt64(3306728569750063090)),
		(coordinates: [2, 2, 3, 0, 3, 3, 2, 0, 0, 0, 1, 2, 3, 3, 0, 2, 2, 1, 3, 1, 1, 1, 3, 1, 1, 3, 3, 2, 2, 1, 2, 2], value: UInt64(16016410471724626996))
	])
	func decodeEncode_UInt64_4(arguments: (coordinates: [UInt16], value: UInt64)) throws {
		let morton = try MortonCode<UInt64>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}

	@Test("[UInt32] -> UInt64 #1", arguments: [
		(coordinates: [2816927275, 3321777449], value: UInt64(16444892649732050119)),
		(coordinates: [1134148, 308018, 2017949], value: UInt64(6458677719046908244)),
		(coordinates: [22642, 52101, 54133, 18678], value: UInt64(7999994268143652502)),
		(coordinates: [2270, 747, 31, 3101, 3308], value: UInt64(927812565837280494)),
		(coordinates: [15, 860, 685, 535, 507, 641], value: UInt64(833958838303258237)),
		(coordinates: [217, 261, 442, 215, 49, 353, 39], value: UInt64(2745691236268680827)),
		(coordinates: [149, 79, 23, 236, 119, 60, 13, 213], value: UInt64(9915299881444906711))
	])
	func decodeEncode_UInt64_1(arguments: (coordinates: [UInt32], value: UInt64)) throws {
		let morton = try MortonCode<UInt64>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}

	@Test("[UInt32] -> UInt64 #2", arguments: [
		(coordinates: [19, 12, 37, 53, 18, 1, 46, 58, 18, 50], value: UInt64(807157191897203757)),
		(coordinates: [18, 25, 10, 27, 28, 24, 22, 14, 0, 11, 11], value: UInt64(2178665986551306)),
		(coordinates: [17, 14, 21, 4, 15, 12, 12, 3, 7, 9, 19, 6], value: UInt64(289680810210568085)),
		(coordinates: [5, 4, 5, 14, 7, 8, 10, 3, 1, 4, 7, 2, 5], value: UInt64(57554669082005)),
		(coordinates: [4, 14, 8, 1, 4, 11, 12, 13, 14, 11, 12, 2, 15, 5], value: UInt64(26910947440898728)),
		(coordinates: [6, 13, 0, 6, 12, 11, 14, 15, 0, 3, 3, 1, 4, 12, 5], value: UInt64(296776015730232994)),
		(coordinates: [9, 12, 6, 5, 5, 2, 9, 1, 0, 7, 3, 4, 6, 7, 7, 0], value: UInt64(18993094689318617)),
		(coordinates: [6, 5, 6, 5, 4, 6, 3, 0, 5, 3, 0, 1, 0, 3, 5, 7, 4], value: UInt64(1975810664360778))
	])
	func decodeEncode_UInt64_2(arguments: (coordinates: [UInt32], value: UInt64)) throws {
		let morton = try MortonCode<UInt64>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
	
	@Test("[UInt32] -> UInt64 #3", arguments: [
		(coordinates: [1, 6, 2, 5, 0, 5, 0, 2, 5, 5, 7, 0, 7, 2, 1, 7, 2, 7], value: UInt64(11666569219987241)),
		(coordinates: [5, 2, 5, 2, 7, 5, 0, 0, 4, 4, 5, 1, 4, 0, 2, 5, 1, 1, 7], value: UInt64(82697988980837429)),
		(coordinates: [2, 4, 7, 7, 5, 4, 1, 6, 3, 3, 7, 3, 7, 1, 3, 2, 3, 3, 3, 1], value: UInt64(5838947789799260)),
		(coordinates: [6, 0, 4, 0, 6, 5, 4, 2, 0, 4, 1, 4, 5, 1, 4, 0, 4, 7, 5, 2, 3], value: UInt64(2119461769837949984)),
		(coordinates: [2, 2, 1, 2, 0, 3, 0, 1, 3, 3, 1, 2, 3, 1, 2, 1, 3, 2, 1, 2, 1, 3], value: UInt64(11917644380068)),
		(coordinates: [3, 3, 0, 3, 2, 2, 0, 0, 1, 3, 3, 2, 3, 0, 2, 1, 3, 3, 3, 3, 3, 1, 0], value: UInt64(17244792788747)),
		(coordinates: [0, 2, 1, 2, 1, 1, 1, 0, 3, 1, 0, 3, 0, 0, 1, 3, 2, 0, 0, 2, 1, 2, 0, 2], value: UInt64(186406044486516)),
		
	])
	func decodeEncode_UInt64_3(arguments: (coordinates: [UInt32], value: UInt64)) throws {
		let morton = try MortonCode<UInt64>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
	
	@Test("[UInt32] -> UInt64 #4", arguments: [
		(coordinates: [0, 3, 3, 3, 2, 1, 1, 1, 3, 2, 0, 2, 2, 2, 0, 3, 1, 3, 2, 0, 3, 3, 3, 3, 3], value: UInt64(1105517031424494)),
		(coordinates: [2, 1, 2, 0, 2, 1, 0, 3, 1, 1, 0, 2, 0, 1, 3, 1, 1, 3, 3, 0, 0, 3, 3, 1, 3, 1], value: UInt64(1575747666305954)),
		(coordinates: [2, 3, 3, 1, 1, 3, 1, 3, 2, 0, 3, 1, 0, 2, 3, 2, 1, 0, 3, 2, 0, 1, 3, 1, 3, 3, 1], value: UInt64(7431793437658366)),
		(coordinates: [0, 2, 0, 1, 1, 0, 3, 0, 0, 3, 2, 2, 0, 1, 1, 1, 3, 0, 0, 2, 2, 3, 3, 3, 1, 3, 2, 1], value: UInt64(31403032078049880)),
		(coordinates: [2, 1, 0, 1, 1, 2, 1, 2, 0, 3, 3, 1, 0, 3, 0, 2, 1, 3, 3, 1, 3, 2, 0, 1, 0, 3, 0, 1, 2], value: UInt64(164052444158832218)),
		(coordinates: [2, 3, 1, 3, 0, 3, 1, 3, 0, 0, 2, 2, 3, 3, 1, 0, 0, 0, 2, 1, 1, 2, 0, 0, 3, 2, 0, 2, 2, 1], value: UInt64(488938711385927918)),
		(coordinates: [1, 1, 1, 1, 1, 0, 3, 0, 2, 2, 0, 3, 0, 1, 3, 3, 1, 1, 2, 0, 1, 2, 1, 0, 3, 2, 3, 3, 0, 3, 1], value: UInt64(1698531749175486559)),
		(coordinates: [3, 1, 1, 3, 0, 2, 0, 2, 1, 3, 0, 2, 2, 0, 3, 3, 3, 3, 2, 2, 3, 1, 0, 3, 0, 1, 0, 0, 3, 0, 3, 0], value: UInt64(5809602465103069967))
	])
	func decodeEncode_UInt64_4(arguments: (coordinates: [UInt32], value: UInt64)) throws {
		let morton = try MortonCode<UInt64>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}

	@Test("[UInt64] -> UInt64 #1", arguments: [
		(coordinates: [12165846259273966756], value: UInt64(12165846259273966756)),
		(coordinates: [112100158, 3904681584], value: UInt64(12147561645684371284)),
		(coordinates: [724230, 75180, 196166], value: UInt64(156380566219982312)),
		(coordinates: [53863, 5584, 33499, 21409], value: UInt64(6416225233330913629)),
		(coordinates: [3989, 2063, 3915, 4035, 1560], value: UInt64(574118015165730255)),
		(coordinates: [856, 124, 569, 260, 333, 978], value: UInt64(682721067807909908)),
		(coordinates: [258, 112, 378, 145, 363, 20, 352], value: UInt64(6129780292179200664)),
		(coordinates: [60, 229, 132, 149, 70, 228, 78, 208], value: UInt64(12606177379379793930))
	])
	func decodeEncode_UInt64_1(arguments: (coordinates: [UInt64], value: UInt64)) throws {
		let morton = try MortonCode<UInt64>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
	
	@Test("[UInt64] -> UInt64 #2", arguments: [
		(coordinates: [61, 56, 99, 8, 80, 83, 35, 75, 44], value: UInt64(3254100579156609253)),
		(coordinates: [10, 57, 29, 50, 55, 41, 63, 43, 22, 5], value: UInt64(281860054708610806)),
		(coordinates: [26, 16, 20, 25, 19, 31, 2, 26, 14, 4, 6], value: UInt64(3363765926987832)),
		(coordinates: [13, 29, 26, 23, 27, 28, 11, 18, 24, 18, 25, 8], value: UInt64(558120280601248859)),
		(coordinates: [12, 7, 14, 14, 1, 9, 2, 14, 9, 3, 3, 12, 4], value: UInt64(1362167078700850)),
		(coordinates: [5, 8, 1, 1, 0, 12, 5, 7, 15, 8, 2, 6, 7, 15], value: UInt64(39560007986983373)),
		(coordinates: [15, 4, 14, 12, 2, 1, 0, 9, 8, 0, 2, 4, 2, 9, 8], value: UInt64(878661539472253089)),
		(coordinates: [13, 4, 2, 7, 11, 4, 13, 11, 10, 10, 13, 13, 11, 14, 0, 9], value: UInt64(13821877570315787481))
	])
	func decodeEncode_UInt64_2(arguments: (coordinates: [UInt64], value: UInt64)) throws {
		let morton = try MortonCode<UInt64>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
	
	@Test("[UInt64] -> UInt64 #3", arguments: [
		(coordinates: [6, 2, 0, 1, 7, 4, 5, 4, 4, 2, 2, 3, 7, 4, 5, 6, 5], value: UInt64(2189974768670808)),
		(coordinates: [6, 1, 1, 0, 4, 7, 3, 2, 4, 4, 5, 5, 0, 6, 1, 3, 3, 4], value: UInt64(9837427229576294)),
		(coordinates: [0, 2, 0, 3, 1, 1, 6, 6, 0, 1, 0, 6, 1, 3, 3, 6, 0, 3, 5], value: UInt64(81680619768541752)),
		(coordinates: [5, 4, 7, 5, 1, 6, 7, 5, 4, 3, 6, 1, 2, 2, 3, 7, 3, 3, 0, 6], value: UInt64(614160529539451613)),
		(coordinates: [7, 3, 2, 2, 3, 4, 3, 6, 5, 0, 4, 6, 2, 7, 2, 0, 4, 0, 1, 2, 7], value: UInt64(4951293339303682387)),
		(coordinates: [3, 2, 3, 3, 1, 1, 0, 3, 2, 3, 3, 0, 1, 3, 1, 0, 2, 0, 2, 1, 3, 2], value: UInt64(14611006387901)),
		(coordinates: [3, 2, 2, 1, 2, 2, 1, 1, 1, 3, 0, 3, 3, 3, 2, 0, 3, 3, 3, 2, 1, 0, 1], value: UInt64(8508797303753)),
		(coordinates: [1, 3, 2, 0, 1, 1, 2, 3, 0, 1, 3, 2, 2, 0, 0, 3, 3, 2, 2, 0, 0, 2, 0, 0], value: UInt64(43554290370227))
	])
	func decodeEncode_UInt64_3(arguments: (coordinates: [UInt64], value: UInt64)) throws {
		let morton = try MortonCode<UInt64>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
	
	@Test("[UInt64] -> UInt64 #4", arguments: [
		(coordinates: [1, 2, 0, 3, 0, 3, 2, 0, 3, 1, 1, 3, 0, 1, 0, 0, 1, 0, 3, 1, 2, 3, 3, 3, 3], value: UInt64(1099592526278441)),
		(coordinates: [1, 3, 2, 0, 2, 2, 2, 2, 3, 2, 1, 3, 2, 2, 3, 2, 1, 2, 3, 1, 2, 3, 2, 3, 3, 0], value: UInt64(2212148032654595)),
		(coordinates: [3, 3, 2, 0, 1, 0, 0, 2, 0, 3, 2, 1, 0, 2, 3, 0, 0, 1, 2, 1, 1, 2, 1, 0, 3, 3, 1], value: UInt64(7075581725919763)),
		(coordinates: [2, 0, 3, 1, 0, 1, 0, 0, 2, 1, 3, 0, 2, 0, 2, 3, 2, 2, 0, 3, 1, 1, 0, 0, 0, 0, 2, 2], value: UInt64(54251348169360940)),
		(coordinates: [3, 3, 1, 0, 1, 1, 0, 2, 1, 3, 2, 1, 1, 0, 2, 2, 2, 0, 3, 3, 2, 0, 0, 1, 3, 3, 1, 2, 3], value: UInt64(244242010306517815)),
		(coordinates: [1, 2, 0, 1, 1, 0, 3, 2, 3, 1, 0, 0, 0, 2, 1, 2, 3, 2, 2, 3, 3, 1, 0, 2, 0, 3, 3, 2, 1, 0], value: UInt64(263434673478779737)),
		(coordinates: [3, 1, 2, 1, 0, 3, 2, 2, 0, 0, 2, 3, 2, 1, 2, 0, 2, 1, 0, 0, 0, 0, 2, 2, 3, 3, 0, 2, 2, 1, 1], value: UInt64(999990925734324267)),
		(coordinates: [1, 0, 1, 1, 2, 2, 3, 3, 0, 0, 3, 3, 0, 1, 1, 0, 2, 3, 3, 0, 3, 2, 0, 2, 3, 1, 2, 1, 2, 2, 3, 3], value: UInt64(17705634688369323213))
	])
	func decodeEncode_UInt64_4(arguments: (coordinates: [UInt64], value: UInt64)) throws {
		let morton = try MortonCode<UInt64>(arguments.coordinates)
		#expect(morton.value == arguments.value)
		let coordinates = morton.coordinates(count: arguments.coordinates.count)
		for coordinate in coordinates.enumerated() {
			#expect(arguments.coordinates[coordinate.offset] == coordinate.element)
		}
	}
}
