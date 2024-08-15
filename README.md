# Numerix

Numerix is an open-source Swift package that provides Complex, Vector, Matrix, and ShapedArray structures for performing linear algebra and other numerical computations on Apple devices. It uses the Accelerate framework to perform high-performance and energy-efficient calculations. See the sections below to learn more about the package.

## Installation

If using Xcode, select File and choose Add Package Dependencies... from the menu, then enter the URL for the Numerix GitHub repository which is <https://github.com/wigging/numerix>.

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

If you would like to contribute to the Numerix package, fork this repository and create a new branch with your contributions. Then create a pull request to the main branch to submit your changes. Please use [SwiftLint](https://github.com/realm/SwiftLint) to enforce Swift code styles and conventions.
