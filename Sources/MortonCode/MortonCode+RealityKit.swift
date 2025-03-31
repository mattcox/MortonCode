//
//  MortonCode+RealityKit.swift
//  MortonCode
//
//  Created by Matt Cox on 30/03/2025.
//  Copyright © 2025 Matt Cox. All rights reserved.
//

#if canImport(RealityKit)
import RealityKit

extension MortonCode {
/// Initialize the Morton Code with the specified coordinate values within
/// the provided bounding box.
///
/// - Parameters:
///   - coordinates: The coordinates to encode into the Morton Code.
///   - bounds: A bounding box containing the coordinates.
///
	@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, *)
	public init(coordinates: SIMD3<Float>, in bounds: BoundingBox) throws {
		self = try MortonCode((0..<3).map {
			(coordinate: coordinates[$0], range: bounds.min[$0]...bounds.max[$0])
		})
	}
}
#endif
