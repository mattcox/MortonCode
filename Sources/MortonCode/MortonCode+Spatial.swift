//
//  MortonCode+Spatial.swift
//  MortonCode
//
//  Created by Matt Cox on 30/03/2025.
//  Copyright © 2025 Matt Cox. All rights reserved.
//

#if canImport(Spatial)
import Spatial

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
	@available(iOS 16.0, macCatalyst 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
	public init(coordinates: Vector3D, minimum: Vector3D, maximum: Vector3D) throws {
		let x = (coordinate: coordinates.x, range: min(minimum.x, maximum.x)...max(minimum.x, maximum.x))
		let y = (coordinate: coordinates.y, range: min(minimum.y, maximum.y)...max(minimum.y, maximum.y))
		let z = (coordinate: coordinates.z, range: min(minimum.z, maximum.z)...max(minimum.z, maximum.z))
		
		self = try MortonCode(x, y, z)
	}
	
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
	@available(iOS 16.0, macCatalyst 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
	public init(coordinates: Point3D, minimum: Vector3D, maximum: Vector3D) throws {
		let x = (coordinate: coordinates.x, range: min(minimum.x, maximum.x)...max(minimum.x, maximum.x))
		let y = (coordinate: coordinates.y, range: min(minimum.y, maximum.y)...max(minimum.y, maximum.y))
		let z = (coordinate: coordinates.z, range: min(minimum.z, maximum.z)...max(minimum.z, maximum.z))
		
		self = try MortonCode(x, y, z)
	}
}
#endif
