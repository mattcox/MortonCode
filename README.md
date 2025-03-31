# MortonCode

<p align="center">
    <img src="https://img.shields.io/badge/Swift-orange.svg" alt="Swift" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/swiftpm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
</p>

Welcome to **MortonCode**, a Swift package for computing a Morton Code in N dimensions.

A Morton code (also known as Z-order or Lebesgue curve), is a mapping from many dimensions into one. It ensures locality of information, where two morton codes with a similar value represent a close spatial proximity. It can be very useful for building spatial acceleration structures such as a BVH or an Octree.

## Usage

### Basic Usage
To encode a N dimensional morton code, you simply pass integers encoding coordinates to the initializer. The integers represent the bits to interleave into the morton code. For example, for 16-bit unsigned integers `12061` and `31418`:

```swift
let morton = try MortonCode<UInt32>(12061, 31418)
print(morton.value)  // 786271193
```

The coordinates can be decoded from the morton code:
```swift
let coordinates = morton.coordinates(count: 2)
print(coordinates)  // [12061, 31418]
```

The numeric values used to initialize the morton code must be able to be represented in fewer bits than the morton code size, for example a `UInt32` morton code can encode two `UInt16` values, or four `UInt8` values. A `UInt32` morton code can encode four `UInt16` values, but the numeric value of the `UInt16` must each be able to be stored in 8-bits.

### Higher Dimension Morton Code
The value stored in the morton code is based on the value, not necessarily the data type used to initialize it. For example a 64-bit morton code could in theory encode 32 dimensions of data, where each dimension is represented by 2 bits:

```swift
let morton = try MortonCode<UInt64>(1, 0, 1, 1, 2, 2, 3, 3, 0, 0, 3, 3, 0, 1, 1, 0, 2, 3, 3, 0, 3, 2, 0, 2, 3, 1, 2, 1, 2, 2, 3, 3)
print(morton.value)  // 17705634688369323213
```

### Encoding Floating Point Values
When working with 2D/3D coordinate systems, mapping floating point coordinates into integers can be a pain. Therefore some helper functions are provided for `RealityKit`, `simd` and `Spatial` APIs. For example to encode a floating point coordinate within the bounds of a bounding box:

```swift
let coordinates = SIMD3<Float>(-2.0, 1.2, 4.7)
let bounds = BoundingBox(min: SIMD3<Float>(-5.0, -5.0, -5.0), max: SIMD3<Float>(5.0, 5.0, 5.0))
	
let mortonCode = try MortonCode<UInt64>(coordinates: coordinates, in: bounds)
print(mortonCode.value)  //7725758287100141315
```

Note that when converting the morton code back into coordinates, the integer values will be returned, not the original floating point values.

## Installation

MortonCode is distributed using the [Swift Package Manager](https://swift.org/package-manager). To install it within another Swift package, add it as a dependency within your `Package.swift` manifest:

```swift
let package = Package(
    // . . .
    dependencies: [
        .package(url: "https://github.com/MattCox/MortonCode.git", branch: "main")
    ],
    // . . .
)
```

If you’d like to use MortonCode within an iOS, macOS, watchOS or tvOS app, then use Xcode’s `File > Add Packages...` menu command to add it to your project.

Import MortonCode wherever you’d like to use it:
```swift
import MortonCode
```
