# ``Numerix``

Numerix is an open-source Swift package for numerical computing on Apple devices.

## Overview

Numerix is an open-source Swift package that provides vector and matrix types for performing linear algebra and other numerical computations on Apple devices. It uses the Accelerate framework to perform high-performance and energy-efficient calculations. See the sections below to learn more about the package.

## Installation

If using Xcode, select File and choose Add Package Dependencies..., then enter the URL for the Numerix GitHub repository which is <https://github.com/wigging/numerix>.

If editing a `Package.swift` manifest, add Numerix as a dependency such as:

```swift
dependencies: [
    .package(url: "https://github.com/wigging/numerix", branch: "main")
]

targets: [
    .target(name: "MyLibrary", dependencies: ["Numerix"])
]
```

The final step is to import the package in a Swift file.

## Usage

The example below uses the Numerix package to perform element-wise matrix multiplication of two 2x3 matrices. See the documentation for more examples.

```swift
import Numerix

let a: Matrix = [[1, 2.5, 3],
                 [4, 5, 6.8]]

let b: Matrix = [[0.1, 2.5, 3],
                 [4.2, 5, 6.8]]

let c = a .* b

print(c)
// This prints the following result:
// 2x3 Matrix<Double>
//   0.1000   6.2500   9.0000
//  16.8000  25.0000  46.2400
```

## Documentation

Documentation for the Numerix package can be viewed [online](https://apple.com) via the [Swift Package Index](https://swiftpackageindex.com). The documentation can also be built and viewed in Xcode by selecting Product then Build Documentation.

## Contributing

See the `CONTRIBUTING.md` document in the Numerix [GitHub repository](https://github.com/wigging/numerix) for more information.

## Topics

### Numeric types

Numeric types for working with complex numbers, vectors, and matrices.

- ``Complex``
- ``Vector``
- ``Matrix``

### Addition

Vector and matrix addition using single and double precision values. These are element-wise operations.

- ``+(_:_:)-34ctg``
- ``+(_:_:)-31nvb``
- ``+(_:_:)-5m4q0``
- ``+(_:_:)-87c1h``
- ``+(_:_:)-8dcbr``
- ``+(_:_:)-51b0c``

- ``+(_:_:)-2g7fb``
- ``+(_:_:)-2u980``
- ``+(_:_:)-1gydk``
- ``+(_:_:)-xam``
- ``+(_:_:)-6tyof``
- ``+(_:_:)-37mz0``

### Subtraction

Vector and matrix subtraction using single and double precision values. These are element-wise operations.

- ``-(_:_:)-8xodu``
- ``-(_:_:)-mz67``
- ``-(_:_:)-331ic``
- ``-(_:_:)-54bhd``
- ``-(_:_:)-78x4v``
- ``-(_:_:)-7l34c``

- ``-(_:_:)-2xjen``
- ``-(_:_:)-8v8d2``
- ``-(_:_:)-5u94x``
- ``-(_:_:)-pr89``
- ``-(_:_:)-1pmmz``
- ``-(_:_:)-4dl1``

### Multiplication

Vector and matrix multiplication using single and double precision values. Element-wise operations use the `.*` operator.

- ``*(_:_:)-430lu``
- ``*(_:_:)-8s6rb``
- ``*(_:_:)-4eb93``
- ``*(_:_:)-4c96n``
- ``*(_:_:)-2quv6``
- ``*(_:_:)-6qpmi``

- ``*(_:_:)-7djhc``
- ``*(_:_:)-3dhox``
- ``*(_:_:)-16bxl``
- ``*(_:_:)-9iigj``

- ``.*(_:_:)-1fnxr``
- ``.*(_:_:)-1isgw``

- ``⊙(_:_:)-3cut5``
- ``⊙(_:_:)-73mgh``

### Division

Matrix division using double precision values. The operations are element-wise.

- ``/(_:_:)-7owya``
- ``/(_:_:)-9x0k``
- ``divide(_:_:)-lxah``
- ``divide(_:_:)-2mwm1``

### Exponential

Element-wise exponential functions for vector and matrix types with single and double precision. 

- ``exp(_:)-5bbj0``
- ``exp(_:)-2cf33``
- ``exp(_:)-1aclw``
- ``exp(_:)-1xhnc``

- ``exp2(_:)-263ss``
- ``exp2(_:)-j75w``
- ``exp2(_:)-7qx6i``
- ``exp2(_:)-1siy``

- ``expm1(_:)-2xboj``
- ``expm1(_:)-128h0``
- ``expm1(_:)-1p7oq``
- ``expm1(_:)-18jhg``

### Euclidean norm

Use the `norm()` function to calculate the Euclidean norm or distance of a vector or matrix with single and double precision.

- ``norm(_:)-4m1aa``
- ``norm(_:)-9ebgx``
- ``norm(_:)-5e524``
- ``norm(_:)-6q1aq``

### Approximate equality

Compare two vectors or two matrices for approximate equality based on relative and absolute tolerance.

- ``isApprox(_:_:rtol:atol:)-48243``
- ``isApprox(_:_:rtol:atol:)-2hr20``
- ``isApprox(_:_:rtol:atol:)-6khct``
- ``isApprox(_:_:rtol:atol:)-3gf9s``

### Dot product

Calculate the dot product of two vectors.

- ``⋅(_:_:)-5xmep``
- ``⋅(_:_:)-3mmbq``
- ``dot(_:_:)-21pra``
- ``dot(_:_:)-70qan``
