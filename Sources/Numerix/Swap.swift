/*
Swap two vectors.
*/

import Accelerate

/// Exchange the elements of two single-precision vectors.
///
/// This swaps the values of two single-precision vectors. The underlying data
/// buffers of the vectors are exchanged therefore the vectors can be defined
/// with `let` or `var`.
/// ```swift
/// let vec1 = Vector<Float>([2, 3, 4, 5, 6])
/// let vec2 = Vector<Float>([9, 8, 7, 10, 12])
/// swap(vec1, vec2)
/// ```
/// - Parameters:
///   - a: The first vector.
///   - b: The second vector.
public func swap(_ a: Vector<Float>, _ b: Vector<Float>) {
    precondition(a.size == b.size, "Vectors must be same size")
    cblas_sswap(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
}

/// Exchange the elements of two double-precision vectors.
///
/// This swaps the values of two double-precision vectors. The underlying data
/// buffers of the vectors are exchanged therefore the vectors can be defined
/// with `let` or `var`.
/// ```swift
/// let vec1 = Vector<Double>([2, 3, 4, 5, 6])
/// let vec2 = Vector<Double>([9, 8, 7, 10, 12])
/// swap(vec1, vec2)
/// ```
/// - Parameters:
///   - a: The first vector.
///   - b: The second vector.
public func swap(_ a: Vector<Double>, _ b: Vector<Double>) {
    precondition(a.size == b.size, "Vectors must be same size")
    cblas_dswap(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
}
