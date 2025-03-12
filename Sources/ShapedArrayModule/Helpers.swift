/*
Helper functions for ShapedArray struct.
*/

// Get the last row for each sub-matrix
// This accounts for the empty line between each sub-matrix when printing
func getLastRows(_ array: [Int]) -> [Int] {
    array.reduce(into: [Int]()) { partialResult, x in
        if let last = partialResult.last {
            partialResult.append(last * x + x - 1)
        } else {
            partialResult.append(x)
        }
    }
}

// Get the shape of nested arrays that represent an N-dimensional array
// This is used for ShapedArray init and ShapedArray literal
func getShape<T>(_ arr: [ShapedArrayElement<T>]) -> [Int] {
    switch arr.first {
    case .array(let inner):
        [arr.count] + getShape(inner)
    default:
        [arr.count]
    }
}

// Flatten nested arrays to an array
func flatten<T>(_ arrays: [ShapedArrayElement<T>]) -> [T] {
    var result = [T]()
    for val in arrays {
        switch val {
        case .array(let arr):
            result.append(contentsOf: flatten(arr))
        case .element(let elm):
            result.append(elm)
        }
    }

    return result
}

/// Calculate the flat index of an N-dimensional element.
///
/// The indices for each dimension are
///
/// ```
/// indices = i₁, i₂, ... iₙ
/// ```
///
/// The dimensions for each index are
///
/// ```
/// shape = d₁, d₂, ... dₙ
/// ```
///
/// The flat index that corresponds to N-dimensions is
///
/// ```
/// flat index = i₁ + (i₂ * d₁) + (i₃ * d₁ * d₂) + ... + (iₙ * d₁ * d₂ * ... * dₙ₋₁)
/// ```
///
/// - Parameters:
///   - indices: Indices of the element for each dimension.
///   - shape: Dimensions of the array.
/// - Returns: Index of the element corresponding to one-dimension.
func flatIndex(indices: [Int], shape: [Int]) -> Int {
    var index = 0
    var stride = 1

    for i in (0..<shape.count).reversed() {
        index += indices[i] * stride
        stride *= shape[i]
    }

    return index
}
