/*
Dot product for vectors.
When NumPy does dot product on matrices, it just performs matrix multiplication.
*/

import Accelerate

infix operator ⋅

/// Calculate the dot product of two vectors with single precision. Vectors must be same size.
/// ```swift
/// let x: Vector<Float> = [1, 2, 3, 4, 5]
/// let y: Vector<Float> = [9, 2, 3, 4, 5]
/// let dot = x ⋅ y
/// ```
/// - Parameters:
///   - lhs: The left-hand side vector.
///   - rhs: The right-hand side vector.
/// - Returns: Dot product of two vectors.
public func ⋅ (lhs: Vector<Float>, rhs: Vector<Float>) -> Float {
    precondition(lhs.size == rhs.size, "Vectors must be same size")
    let dot = cblas_sdot(lhs.size, lhs.buffer.baseAddress, 1, rhs.buffer.baseAddress, 1)
    return dot
}

/// Calculate the dot product of two vectors with double precision. Vectors must be same size.
/// ```swift
/// let x: Vector = [1, 2, 3, 4, 5.0]
/// let y: Vector = [9, 2, 3, 4, 5.0]
/// let dot = x ⋅ y
/// ```
/// - Parameters:
///   - lhs: The left-hand side vector.
///   - rhs: The right-hand side vector.
/// - Returns: Dot product of two vectors.
public func ⋅ (lhs: Vector<Double>, rhs: Vector<Double>) -> Double {
    precondition(lhs.size == rhs.size, "Vectors must be same size")
    let dot = cblas_ddot(lhs.size, lhs.buffer.baseAddress, 1, rhs.buffer.baseAddress, 1)
    return dot
}

/// Calculate the dot product of two vectors with single precision.
///
/// This function calculates the dot product as `dot = xᵀy` where `x` and `y` are
/// single precision vectors. The input vectors must be the same length.
/// ```swift
/// let x: Vector<Float> = [1, 2, 3, 4, 5]
/// let y: Vector<Float> = [9, 2, 3, 4, 5]
/// let dot = dotProduct(x, y)
/// ```
/// - Parameters:
///   - x: The input vector `x`.
///   - y: The input vector `y`.
///   - stride: The stride for input vectors `x` and `y`.
/// - Returns: Dot product of two vectors.
public func dotProduct(_ x: Vector<Float>, _ y: Vector<Float>, stride: (Int, Int) = (1, 1)) -> Float {
    precondition(x.size == y.size, "Vectors must be same size")
    let dot = cblas_sdot(x.size, x.buffer.baseAddress, stride.0, y.buffer.baseAddress, stride.1)
    return dot
}

/// Calculate the dot product of two vectors with double precision.
///
/// This function calculates the dot product as `dot = xᵀy` where `x` and `y` are
/// double precision vectors. The input vectors must be the same length.
/// ```swift
/// let x: Vector<Double> = [1, 2, 3, 4, 5]
/// let y: Vector<Double> = [9, 2, 3, 4, 5]
/// let dot = dotProduct(a, b)
/// ```
/// - Parameters:
///   - x: The input vector `x`.
///   - y: The input vector `y`.
///   - stride: The stride for input vectors `x` and `y`.
/// - Returns: Dot product of two vectors.
public func dotProduct(_ x: Vector<Double>, _ y: Vector<Double>, stride: (Int, Int) = (1, 1)) -> Double {
    precondition(x.size == y.size, "Vectors must be same size")
    let dot = cblas_ddot(x.size, x.buffer.baseAddress, stride.0, y.buffer.baseAddress, stride.1)
    return dot
}

/// Calculate the dot product of two vectors with extended precision accumulation.
/// The input vectors are single precision while the output vector is double precision.
///
/// This function calculates the dot product as `dot = xᵀy` where `x` and `y` are
/// single precision vectors but the result is a double precision vector. The vectors
/// must be the same length.
/// ```swift
/// let x: Vector<Float> = [1, 2, 3, 4, 5]
/// let y: Vector<Float> = [9, 2, 3, 4, 5]
/// let c = dotProductExtended(x, y)
/// ```
/// - Parameters:
///   - x: The input vector `x`.
///   - y: The input vector `y`.
///   - stride: The stride for input vectors `x` and `y`.
/// - Returns: Dot product of two single precision vectors accumulated in double precision.
public func dotProductExtended(_ x: Vector<Float>, _ y: Vector<Float>, stride: (Int, Int) = (1, 1)) -> Double {
    precondition(x.size == y.size, "Vectors must be same size")
    let dot = cblas_dsdot(x.size, x.buffer.baseAddress, stride.0, y.buffer.baseAddress, stride.1)
    return dot
}

/// Calculate the dot product of two vectors with extended precision accumulation.
///
/// This function calculates the dot product as `dot = 𝛼 + xᵀy` where `𝛼` is a single-precision
/// scalar added to the product of vectors `x` and `y`. The vectors must be the same size.
/// ```swift
/// let x: Vector<Float> = [1, 2, 3, 4, 5]
/// let y: Vector<Float> = [9, 2, 3, 4, 5]
/// let dot = dotProductExtended(x, y, scalar: 1.4)
/// ```
/// - Parameters:
///   - x: The input vector `x`.
///   - y: The input vector `y`.
///   - scalar: Scalar value `𝛼` added to the product.
///   - stride: The stride for input vectors `x` and `y`.
/// - Returns: Single precision result of the dot product accumulated in double precision.
public func dotProductExtended(
    _ x: Vector<Float>,
    _ y: Vector<Float>,
    scalar: Float,
    stride: (Int, Int) = (1, 1)
) -> Float {
    precondition(x.size == y.size, "Vectors must be same size")
    let dot = cblas_sdsdot(x.size, scalar, x.buffer.baseAddress, stride.0, y.buffer.baseAddress, stride.1)
    return dot
}
