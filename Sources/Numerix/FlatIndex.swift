/*
Flat index function for working with N-dimensional arrays.
*/

/// Calculate the flat index of an N-dimensional element.
///
/// The indices for each dimension are
/// ```
/// indices = i₁, i₂, ... iₙ
/// ```
/// The dimensions for each index are
/// ```
/// shape = d₁, d₂, ... dₙ
/// ```
/// The flat index that corresponds to N-dimensions is
/// ```
/// flat index = i₁ + (i₂ * d₁) + (i₃ * d₁ * d₂) + ... + (iₙ * d₁ * d₂ * ... * dₙ₋₁)
/// ```
///
/// - Parameters:
///   - indices: Indices of the element for each dimension.
///   - shape: Dimensions of the array.
/// - Returns: Index of the element corresponding to one-dimension.
public func flatIndex(indices: [Int], shape: [Int]) -> Int {
    var index = 0
    var stride = 1

    for i in (0..<shape.count).reversed() {
        index += indices[i] * stride
        stride *= shape[i]
    }

    return index
}
