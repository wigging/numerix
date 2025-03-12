# Numerix

Numerix is an open-source Swift package that provides Complex, Vector, Matrix, and ShapedArray structures for performing linear algebra and other numerical computations on Apple devices. It uses the Accelerate framework to perform high-performance and energy-efficient calculations. More information is available on the [Swift Package Index](https://swiftpackageindex.com/wigging/numerix) and the [documentation website](https://swiftpackageindex.com/wigging/numerix/main/documentation/numerix).

> [!WARNING]
> Numerix is under heavy development. Many things are missing and breaking changes will likely happen.

## Installation

If using Xcode, select *File* and choose *Add Package Dependencies...* from the menu, then enter the URL for the Numerix GitHub repository which is `https://github.com/wigging/numerix`.

If editing a `Package.swift` manifest, add Numerix as a dependency such as:

```swift
dependencies: [
    .package(url: "https://github.com/wigging/numerix", branch: "main")
]

targets: [
    .target(name: "MyLibrary", dependencies: ["Numerix"])
]
```

The final step is to import the package in a Swift file by using `import Numerix`.

## Usage

The example below uses the Numerix package to perform matrix multiplication of two 3x3 matrices. The printed result is shown in the comments.

```swift
import Numerix

let a: Matrix = [[1, 2, 3],
                 [4, 5, 6.0],
                 [2, 3, 4]]

let b: Matrix = [[1, 2, 3.5],
                 [4, 5, 6],
                 [4, 5, 9.1]]

let c = a * b

print(c)
// ⎛ 21.0  27.0  42.8 ⎞
// ⎜ 48.0  63.0  98.6 ⎟
// ⎝ 30.0  39.0  61.4 ⎠

debugPrint(c)
// 3x3 Matrix<Double>
// ⎛ 21.0  27.0  42.8 ⎞
// ⎜ 48.0  63.0  98.6 ⎟
// ⎝ 30.0  39.0  61.4 ⎠
```

An N-dimensional array is also available in Numerix. The example below prints a 2x3x5 shaped array.

```swift
let shape = [2, 3, 5]
let values = Array(1...shape.reduce(1, *)).map { Double($0) }
let arr = ShapedArray<Double>(shape: shape, array: values)

print(arr)
// ⎛ ⎛  1.0   2.0   3.0   4.0   5.0 ⎞ ⎞
// ⎜ ⎜  6.0   7.0   8.0   9.0  10.0 ⎟ ⎟
// ⎜ ⎝ 11.0  12.0  13.0  14.0  15.0 ⎠ ⎟
// ⎜                                  ⎟
// ⎜ ⎛ 16.0  17.0  18.0  19.0  20.0 ⎞ ⎟
// ⎜ ⎜ 21.0  22.0  23.0  24.0  25.0 ⎟ ⎟
// ⎝ ⎝ 26.0  27.0  28.0  29.0  30.0 ⎠ ⎠
```

## Documentation

Documentation for the Numerix package can be viewed [here](https://swiftpackageindex.com/wigging/numerix/main/documentation/numerix). The documentation can also be built and viewed in Xcode by selecting *Product* then *Build Documentation* from the Xcode menu.

## Contributing

Please read the [contributing guidelines](CONTRIBUTING.md) if you would like to contribute to the Numerix package. The guidelines discuss testing, documentation, code style, and other practices used for the development of this package.
