// swift-tools-version: 6.0

import PackageDescription

let package = Package(
	name: "MortonCode",
	products: [
		.library(
			name: "MortonCode",
			targets: [
				"MortonCode"
			]
		),
	],
	targets: [
		.target(
			name: "MortonCode",
			dependencies: [
				// . . .
			]
		),
		.testTarget(
			name: "MortonCodeTests",
			dependencies: [
				"MortonCode"
			]
		),
	]
)
