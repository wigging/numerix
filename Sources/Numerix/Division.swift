/*
Division operators for Vector, Matrix, and ShapedArray structures. Single and double
precision operations are supported.
*/

import Accelerate

// MARK: Scalar-Matrix division

/// Element-wise division of a scalar by a matrix using single precision.
///
/// This divides a scalar value A by each value in matrix B and returns the
/// result as matrix C such that A / B[i] = C[i] where i is the index of the
/// matrix. The operation is performed using single precision values.
///
/// - Parameters:
///   - lhs: The input scalar value A in A / B[i] = C[i].
///   - rhs: The input matrix B in A / B[i] = C[i].
/// - Returns: The output matrix C in A / B[i] = C[i].
public func / (lhs: Float, rhs: Matrix<Float>) -> Matrix<Float> {
    var mat = Matrix<Float>(rows: rhs.rows, columns: rhs.columns)
    vDSP.divide(lhs, rhs.buffer, result: &mat.buffer)
    return mat
}

/// Element-wise division of a scalar by a matrix using double precision.
///
/// This divides a scalar value A by each value in matrix B and returns the
/// result as matrix C such that A / B[i] = C[i] where i is the index of the
/// matrix. The operation is performed using double precision values.
///
/// - Parameters:
///   - lhs: The input scalar value A in A / B[i] = C[i].
///   - rhs: The input matrix B in A / B[i] = C[i].
/// - Returns: The output matrix C in A / B[i] = C[i].
public func / (lhs: Double, rhs: Matrix<Double>) -> Matrix<Double> {
    var mat = Matrix<Double>(rows: rhs.rows, columns: rhs.columns)
    vDSP.divide(lhs, rhs.buffer, result: &mat.buffer)
    return mat
}

// MARK: Matrix-Scalar division

/// Element-wise division of a matrix by a scalar using single precision.
///
/// This divides each value in matrix A by a scalar value B and returns the
/// result as matrix C such that A[i] / B = C[i] where i is the index of the
/// matrix. The operation is performed using single precision values.
///
/// - Parameters:
///   - lhs: The input matrix A in A[i] / B = C[i].
///   - rhs: The input scalar B in A[i] / B = C[i].
/// - Returns: The output matrix C in A[i] / B = C[i].
public func / (lhs: Matrix<Float>, rhs: Float) -> Matrix<Float> {
    var mat = Matrix<Float>(rows: lhs.rows, columns: lhs.columns)
    vDSP.divide(lhs.buffer, rhs, result: &mat.buffer)
    return mat
}

/// Element-wise division of a matrix by a scalar using double precision.
///
/// This divides each value in matrix A by a scalar value B and returns the
/// result as matrix C such that A[i] / B = C[i] where i is the index of the
/// matrix. The operation is performed using double precision values.
///
/// - Parameters:
///   - lhs: The input matrix A in A[i] / B = C[i].
///   - rhs: The input scalar B in A[i] / B = C[i].
/// - Returns: The output matrix C in A[i] / B = C[i].
public func / (lhs: Matrix<Double>, rhs: Double) -> Matrix<Double> {
    var mat = Matrix<Double>(rows: lhs.rows, columns: lhs.columns)
    vDSP.divide(lhs.buffer, rhs, result: &mat.buffer)
    return mat
}

/// In-place element-wise division of a matrix by a scalar using single precision.
/// - Parameters:
///   - lhs: Matrix A.
///   - rhs: Scalar value.
public func /= (lhs: inout Matrix<Float>, rhs: Float) {
    lhs = lhs / rhs
}

/// In-place element-wise division of a matrix by a scalar using double precision.
/// - Parameters:
///   - lhs: Matrix A.
///   - rhs: Scalar value.
public func /= (lhs: inout Matrix<Double>, rhs: Double) {
    lhs = lhs / rhs
}

// MARK: Scalar-ShapedArray division

/// Element-wise division of a scalar value by a shaped array using single precision.
/// - Parameters:
///   - lhs: The scalar value numerator.
///   - rhs: The shaped array denominator.
/// - Returns: The shaped array quotient.
public func / (lhs: Float, rhs: ShapedArray<Float>) -> ShapedArray<Float> {
    var arr = ShapedArray<Float>(shape: rhs.shape)
    vDSP.divide(lhs, rhs.buffer, result: &arr.buffer)
    return arr
}

/// Element-wise division of a scalar value by a shaped array using double precision.
/// - Parameters:
///   - lhs: The scalar value numerator.
///   - rhs: The shaped array denominator.
/// - Returns: The shaped array quotient.
public func / (lhs: Double, rhs: ShapedArray<Double>) -> ShapedArray<Double> {
    var arr = ShapedArray<Double>(shape: rhs.shape)
    vDSP.divide(lhs, rhs.buffer, result: &arr.buffer)
    return arr
}

// MARK: ShapedArray-Scalar division

/// Element-wise division of a shaped array by a scalar value using single precision.
/// - Parameters:
///   - lhs: The shaped array numerator.
///   - rhs: The scalar value denominator.
/// - Returns: The shaped array quotient.
public func / (lhs: ShapedArray<Float>, rhs: Float) -> ShapedArray<Float> {
    var arr = ShapedArray<Float>(shape: lhs.shape)
    vDSP.divide(lhs.buffer, rhs, result: &arr.buffer)
    return arr
}

/// Element-wise division of a shaped array by a scalar value using double precision.
/// - Parameters:
///   - lhs: The shaped array numerator.
///   - rhs: The scalar value denominator.
/// - Returns: The shaped array quotient.
public func / (lhs: ShapedArray<Double>, rhs: Double) -> ShapedArray<Double> {
    var arr = ShapedArray<Double>(shape: lhs.shape)
    vDSP.divide(lhs.buffer, rhs, result: &arr.buffer)
    return arr
}

// MARK: ShapedArray-ShapedArray division

/// Element-wise division of two shaped arrays using single precision.
/// - Parameters:
///   - lhs: The shaped array numerator.
///   - rhs: The shaped array denominator.
/// - Returns: The shaped array quotient.
public func / (lhs: ShapedArray<Float>, rhs: ShapedArray<Float>) -> ShapedArray<Float> {
    var arr = ShapedArray<Float>(shape: lhs.shape)
    vDSP.divide(lhs.buffer, rhs.buffer, result: &arr.buffer)
    return arr
}

/// Element-wise division of two shaped arrays using double precision.
/// - Parameters:
///   - lhs: The shaped array numerator.
///   - rhs: The shaped array denominator.
/// - Returns: The shaped array quotient.
public func / (lhs: ShapedArray<Double>, rhs: ShapedArray<Double>) -> ShapedArray<Double> {
    precondition(lhs.shape == rhs.shape, "Shapes must be similar")
    var arr = ShapedArray<Double>(shape: lhs.shape)
    vDSP.divide(lhs.buffer, rhs.buffer, result: &arr.buffer)
    return arr
}
