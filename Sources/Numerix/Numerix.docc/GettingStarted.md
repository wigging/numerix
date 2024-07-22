# Getting Started

First steps for installing and using Numerix

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

The final step is to import the package in a Swift file as shown below.

```swift
import Numerix
```

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
