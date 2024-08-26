/*
 Approximate equality for comparing Vector and Matrix structures. Single and
 double precision values are supported.
 */

import Accelerate

// MARK: Vector approximate equality

/// Compare two vectors of single precision for approximate equality.
///
/// Returns true when norm(x - y) ≤ max(atol, rtol × max(norm(x), norm(y))).
///
/// - Parameters:
///   - vec1: The first vector.
///   - vec2: The second vector.
///   - rtol: Relative tolerance, default is 1e-8.
///   - atol: Absolute tolerance, default is 0.
/// - Returns: True when two vectors are approximately equal.
public func isApprox(_ vec1: Vector<Float>, _ vec2: Vector<Float>, rtol: Float = 1e-8, atol: Float = 0.0) -> Bool {
    let diff = vec1 - vec2
    let normDiff = norm(diff)
    let normX = norm(vec1)
    let normY = norm(vec2)
    return normDiff <= max(atol, rtol * max(normX, normY))
}

/// Compare two vectors of double precision for approximate equality.
///
/// Returns true when norm(x - y) ≤ max(atol, rtol × max(norm(x), norm(y))).
///
/// - Parameters:
///   - vec1: The first vector.
///   - vec2: The second vector.
///   - rtol: Relative tolerance, default is 1e-8.
///   - atol: Absolute tolerance, default is 0.
/// - Returns: True when two vectors are approximately equal.
public func isApprox(_ vec1: Vector<Double>, _ vec2: Vector<Double>, rtol: Double = 1e-8, atol: Double = 0.0) -> Bool {
    let diff = vec1 - vec2
    let normDiff = norm(diff)
    let normX = norm(vec1)
    let normY = norm(vec2)
    return normDiff <= max(atol, rtol * max(normX, normY))
}

// MARK: Matrix approximate equality

/// Compare two matrices of single precision for approximate equality.
///
/// Returns true when norm(x - y) ≤ max(atol, rtol × max(norm(x), norm(y))).
///
/// - Parameters:
///   - mat1: The first matrix.
///   - mat2: The second matrix.
///   - rtol: Relative tolerance, default is 1e-8.
///   - atol: Absolute tolerance, default is 0.
/// - Returns: True when two matrices are approximately equal.
public func isApprox(_ mat1: Matrix<Float>, _ mat2: Matrix<Float>, rtol: Float = 1e-8, atol: Float = 0.0) -> Bool {
    let diff = mat1 - mat2
    let normDiff = norm(diff)
    let normX = norm(mat1)
    let normY = norm(mat2)
    return normDiff <= max(atol, rtol * max(normX, normY))
}

/// Compare two matrices of double precision for approximate equality.
///
/// Returns true when norm(x - y) ≤ max(atol, rtol × max(norm(x), norm(y))).
///
/// - Parameters:
///   - mat1: The first matrix.
///   - mat2: The second matrix.
///   - rtol: Relative tolerance, default is 1e-8.
///   - atol: Absolute tolerance, default is 0.
/// - Returns: True when two matrices are approximately equal.
public func isApprox(_ mat1: Matrix<Double>, _ mat2: Matrix<Double>, rtol: Double = 1e-8, atol: Double = 0.0) -> Bool {
    let diff = mat1 - mat2
    let normDiff = norm(diff)
    let normX = norm(mat1)
    let normY = norm(mat2)
    return normDiff <= max(atol, rtol * max(normX, normY))
}

// MARK: ShapedArray approximate equality

/// Compare two shaped arrays of single precision for approximate equality.
///
/// Returns true when norm(x - y) ≤ max(atol, rtol × max(norm(x), norm(y))).
///
/// - Parameters:
///   - a: The first shaped array.
///   - b: The second shaped array.
///   - rtol: Relative tolerance, default is 1e-8.
///   - atol: Absolute tolerance, default is 0.
/// - Returns: True when two shaped arrays are approximately equal.
public func isApprox(_ a: ShapedArray<Float>, _ b: ShapedArray<Float>, rtol: Float = 1e-8, atol: Float = 0.0) -> Bool {
    let diff = a - b
    let normDiff = norm(diff)
    let normX = norm(a)
    let normY = norm(b)
    return normDiff <= max(atol, rtol * max(normX, normY))
}

/// Compare two shaped arrays of double precision for approximate equality.
///
/// Returns true when norm(x - y) ≤ max(atol, rtol × max(norm(x), norm(y))).
///
/// - Parameters:
///   - a: The first shaped array.
///   - b: The second shaped array.
///   - rtol: Relative tolerance, default is 1e-8.
///   - atol: Absolute tolerance, default is 0.
/// - Returns: True when two shaped arrays are approximately equal.
public func isApprox(
        _ a: ShapedArray<Double>,
        _ b: ShapedArray<Double>,
        rtol: Double = 1e-8,
        atol: Double = 0.0
) -> Bool {
    let diff = a - b
    let normDiff = norm(diff)
    let normX = norm(a)
    let normY = norm(b)
    return normDiff <= max(atol, rtol * max(normX, normY))
}
