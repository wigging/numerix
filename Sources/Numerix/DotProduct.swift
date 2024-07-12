/*
 Dot product for Vector structures. When NumPy does dot product on matrices, it
 just performs matrix multiplication.
 */

import Accelerate

infix operator ⋅

/// Calculate the dot product of two vectors with single precision. Vectors must be same length.
/// ```swift
/// let a: Vector<Float> = [1, 2, 3, 4, 5]
/// let b: Vector<Float> = [9, 2, 3, 4, 5]
/// let c = a ⋅ b
/// ```
/// - Parameters:
///   - lhs: The first vector.
///   - rhs: The second vector.
/// - Returns: Dot product of two vectors.
public func ⋅ (lhs: Vector<Float>, rhs: Vector<Float>) -> Float {
    precondition(lhs.length == rhs.length, "Vectors must be same length")
    let n = lhs.length
    let x = lhs.buffer.baseAddress
    let y = rhs.buffer.baseAddress
    let c = cblas_sdot(n, x, 1, y, 1)
    return c
}

/// Calculate the dot product of two vectors with double precision. Vectors must be same length.
/// ```swift
/// let a: Vector = [1, 2, 3, 4, 5.0]
/// let b: Vector = [9, 2, 3, 4, 5.0]
/// let c = a ⋅ b
/// ```
/// - Parameters:
///   - lhs: The first vector.
///   - rhs: The second vector.
/// - Returns: Dot product of two vectors.
public func ⋅ (lhs: Vector<Double>, rhs: Vector<Double>) -> Double {
    precondition(lhs.length == rhs.length, "Vectors must be same length")
    let n = lhs.length
    let x = lhs.buffer.baseAddress
    let y = rhs.buffer.baseAddress
    let c = cblas_ddot(n, x, 1, y, 1)
    return c
}

/// Calculate the dot product of two vectors with single precision. Vectors must be same length.
/// ```swift
/// let a: Vector<Float> = [1, 2, 3, 4, 5]
/// let b: Vector<Float> = [9, 2, 3, 4, 5]
/// let c = dot(a, b)
/// ```
/// - Parameters:
///   - a: The first vector.
///   - b: The second vector.
/// - Returns: Dot product of two vectors.
public func dot(_ a: Vector<Float>, _ b: Vector<Float>) -> Float {
    precondition(a.length == b.length, "Vectors must be same length")
    let c = a ⋅ b
    return c
}

/// Calculate the dot product of two vectors with double precision. Vectors must be same length.
/// ```swift
/// let a: Vector<Double> = [1, 2, 3, 4, 5]
/// let b: Vector<Double> = [9, 2, 3, 4, 5]
/// let c = dot(a, b)
/// ```
/// - Parameters:
///   - a: The first vector.
///   - b: The second vector.
/// - Returns: Dot product of two vectors.
public func dot(_ a: Vector<Double>, _ b: Vector<Double>) -> Double {
    precondition(a.length == b.length, "Vectors must be same length")
    let c = a ⋅ b
    return c
}
