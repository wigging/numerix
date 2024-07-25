/*
 Addition operators for Vector and Matrix structures. Single and double
 precision operations are supported.
 */

import Accelerate

// MARK: Scalar-Vector addition

/// Element-wise addition of a scalar and a vector with single precision.
/// - Parameters:
///   - lhs: Scalar value.
///   - rhs: Vector of length n.
/// - Returns: Vector of length n.
public func + (lhs: Float, rhs: Vector<Float>) -> Vector<Float> {
    var vec = Vector<Float>(length: rhs.length)
    vDSP.add(lhs, rhs.buffer, result: &vec.buffer)
    return vec
}

/// Element-wise addition of a scalar and a vector with double precision.
/// - Parameters:
///   - lhs: Scalar value.
///   - rhs: Vector of length n.
/// - Returns: Vector of length n.
public func + (lhs: Double, rhs: Vector<Double>) -> Vector<Double> {
    var vec = Vector<Double>(length: rhs.length)
    vDSP.add(lhs, rhs.buffer, result: &vec.buffer)
    return vec
}

// MARK: Vector-Scalar addition

/// Element-wise addition of a vector and a scalar with single precision.
/// - Parameters:
///   - lhs: Vector of length n.
///   - rhs: Scalar value
/// - Returns: Vector of length n.
public func + (lhs: Vector<Float>, rhs: Float) -> Vector<Float> {
    var vec = Vector<Float>(length: lhs.length)
    vDSP.add(rhs, lhs.buffer, result: &vec.buffer)
    return vec
}

/// Element-wise addition of a vector and a scalar with double precision.
/// - Parameters:
///   - lhs: Vector of length n.
///   - rhs: Scalar value
/// - Returns: Vector of length n.
public func + (lhs: Vector<Double>, rhs: Double) -> Vector<Double> {
    var vec = Vector<Double>(length: lhs.length)
    vDSP.add(rhs, lhs.buffer, result: &vec.buffer)
    return vec
}

/// In-place element-wise addition of a vector and scalar with single precision.
/// - Parameters:
///   - lhs: Mutable input vector.
///   - rhs: Input scalar.
public func += (lhs: inout Vector<Float>, rhs: Float) {
    lhs = lhs + rhs
}

/// In-place element-wise addition of a vector and scalar with double precision.
/// - Parameters:
///   - lhs: Mutable input vector.
///   - rhs: Input scalar.
public func += (lhs: inout Vector<Double>, rhs: Double) {
    lhs = lhs + rhs
}

// MARK: Vector-Vector addition

/// Element-wise addition of two vectors with single precision. Vectors must be same length.
/// - Parameters:
///   - lhs: Vector of length n.
///   - rhs: Vector of length n.
/// - Returns: Vector of length n.
public func + (lhs: Vector<Float>, rhs: Vector<Float>) -> Vector<Float> {
    precondition(lhs.length == rhs.length, "Vectors must be same length")
    var vec = Vector<Float>(length: lhs.length)
    vDSP.add(lhs.buffer, rhs.buffer, result: &vec.buffer)
    return vec
}

/// Element-wise addition of two vectors with double precision. Vectors must be same length.
/// - Parameters:
///   - lhs: Vector of length n.
///   - rhs: Vector of length n.
/// - Returns: Vector of length n.
public func + (lhs: Vector<Double>, rhs: Vector<Double>) -> Vector<Double> {
    precondition(lhs.length == rhs.length, "Vectors must be same length")
    var vec = Vector<Double>(length: lhs.length)
    vDSP.add(lhs.buffer, rhs.buffer, result: &vec.buffer)
    return vec
}

/// In-place element-wise addition of two vectors with single precision.
/// - Parameters:
///   - lhs: Mutable input vector.
///   - rhs: Vector to add to the mutable vector.
public func += (lhs: inout Vector<Float>, rhs: Vector<Float>) {
    precondition(lhs.length == rhs.length, "Vectors must be same length")
    lhs = lhs + rhs
}

/// In-place element-wise addition of two vectors with double precision.
/// - Parameters:
///   - lhs: Mutable input vector.
///   - rhs: Vector to add to the mutable vector.
public func += (lhs: inout Vector<Double>, rhs: Vector<Double>) {
    precondition(lhs.length == rhs.length, "Vectors must be same length")
    lhs = lhs + rhs
}

// MARK: Scalar-Matrix addition

/// Element-wise addition of a scalar and a matrix with single precision.
/// - Parameters:
///   - lhs: The input scalar value.
///   - rhs: The input matrix.
/// - Returns: The sum of scalar + B[i].
public func + (lhs: Float, rhs: Matrix<Float>) -> Matrix<Float> {
    var mat = Matrix<Float>(rows: rhs.rows, columns: rhs.columns)
    vDSP.add(lhs, rhs.buffer, result: &mat.buffer)
    return mat
}

/// Element-wise addition of a scalar and a matrix with double precision.
/// - Parameters:
///   - lhs: The input scalar value.
///   - rhs: The input matrix.
/// - Returns: The sum of scalar + B[i].
public func + (lhs: Double, rhs: Matrix<Double>) -> Matrix<Double> {
    var mat = Matrix<Double>(rows: rhs.rows, columns: rhs.columns)
    vDSP.add(lhs, rhs.buffer, result: &mat.buffer)
    return mat
}

// MARK: Matrix-Scalar addition

/// Element-wise addition of a matrix and a scalar with single precision.
/// - Parameters:
///   - lhs:The input matrix
///   - rhs: The input scalar value.
/// - Returns: The sum of A[i] + scalar.
public func + (lhs: Matrix<Float>, rhs: Float) -> Matrix<Float> {
    var mat = Matrix<Float>(rows: lhs.rows, columns: lhs.columns)
    vDSP.add(rhs, lhs.buffer, result: &mat.buffer)
    return mat
}

/// Element-wise addition of a matrix and a scalar with double precision.
/// - Parameters:
///   - lhs: The input matrix.
///   - rhs: The input scalar value.
/// - Returns: The sum of A[i] + scalar.
public func + (lhs: Matrix<Double>, rhs: Double) -> Matrix<Double> {
    var mat = Matrix<Double>(rows: lhs.rows, columns: lhs.columns)
    vDSP.add(rhs, lhs.buffer, result: &mat.buffer)
    return mat
}

/// In-place element-wise addition of a matrix and scalar value with single precision.
/// - Parameters:
///   - lhs: Mutable input matrix.
///   - rhs: The scalar value.
public func += (lhs: inout Matrix<Float>, rhs: Float) {
    lhs = lhs + rhs
}

/// In-place element-wise addition of a matrix and scalar value with double precision.
/// - Parameters:
///   - lhs: Mutable input matrix.
///   - rhs: The scalar value.
public func += (lhs: inout Matrix<Double>, rhs: Double) {
    lhs = lhs + rhs
}

// MARK: Matrix-Matrix addition

/// Element-wise addition of two matrices with single precision.
/// - Parameters:
///   - lhs: The input matrix A.
///   - rhs: The input matrix B.
/// - Returns: The result matrix of A + B.
public func + (lhs: Matrix<Float>, rhs: Matrix<Float>) -> Matrix<Float> {
    precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must be same shape")
    var mat = Matrix<Float>(rows: lhs.rows, columns: lhs.columns)
    vDSP.add(lhs.buffer, rhs.buffer, result: &mat.buffer)
    return mat
}

/// Element-wise addition of two matrices with double precision.
/// - Parameters:
///   - lhs: The input matrix A.
///   - rhs: The input matrix B.
/// - Returns: The result matrix of A + B.
public func + (lhs: Matrix<Double>, rhs: Matrix<Double>) -> Matrix<Double> {
    precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must be same shape")
    var mat = Matrix<Double>(rows: lhs.rows, columns: lhs.columns)
    vDSP.add(lhs.buffer, rhs.buffer, result: &mat.buffer)
    return mat
}

/// In-place element-wise addition of two matrices with single precision.
/// - Parameters:
///   - lhs: The mutable input matrix.
///   - rhs: The second input matrix.
public func += (lhs: inout Matrix<Float>, rhs: Matrix<Float>) {
    precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must be same shape")
    lhs = lhs + rhs
}

/// In-place element-wise addition of two matrices with double precision.
/// - Parameters:
///   - lhs: The mutable input matrix.
///   - rhs: The second input matrix.
public func += (lhs: inout Matrix<Double>, rhs: Matrix<Double>) {
    precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must be same shape")
    lhs = lhs + rhs
}
