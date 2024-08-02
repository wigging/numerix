/*
Multiplication operators for Vector and Matrix structures. Single and double
precision operations are supported.
*/

import Accelerate

infix operator .*
infix operator ⊙

// MARK: Scalar-Vector multiplication

/// Element-wise multiplication of a scalar value and a vector with single-precision.
/// - Parameters:
///   - lhs: The left scalar value `A`.
///   - rhs: The right vector `B[i]`.
/// - Returns: A vector representing the result of `A × B[i]`.
public func * (lhs: Float, rhs: Vector<Float>) -> Vector<Float> {
    var result = Vector<Float>(length: rhs.length)
    vDSP.multiply(lhs, rhs.buffer, result: &result.buffer)
    return result
}

/// Element-wise multiplication of a scalar value and a vector with double-precision.
/// - Parameters:
///   - lhs: The left scalar value `A`.
///   - rhs: The right vector `B[i]`.
/// - Returns: A vector representing the result of `A × B[i]`.
public func * (lhs: Double, rhs: Vector<Double>) -> Vector<Double> {
    var result = Vector<Double>(length: rhs.length)
    vDSP.multiply(lhs, rhs.buffer, result: &result.buffer)
    return result
}

// MARK: Vector-Scalar multiplication

/// Element-wise multiplication of a vector and a scalar value with single-precision.
/// - Parameters:
///   - lhs: The left vector `A[i]`.
///   - rhs: The right scalar value `B`.
/// - Returns: A vector representing the result of `A[i] × B`.
public func * (lhs: Vector<Float>, rhs: Float) -> Vector<Float> {
    var result = Vector<Float>(length: lhs.length)
    vDSP.multiply(rhs, lhs.buffer, result: &result.buffer)
    return result
}

/// Element-wise multiplication of a vector and a scalar value with double-precision.
/// - Parameters:
///   - lhs: The left vector `A[i]`.
///   - rhs: The right scalar value `B`.
/// - Returns: A vector representing the result of `A[i] × B`.
public func * (lhs: Vector<Double>, rhs: Double) -> Vector<Double> {
    var result = Vector<Double>(length: lhs.length)
    vDSP.multiply(rhs, lhs.buffer, result: &result.buffer)
    return result
}

// MARK: Vector-Vector multiplication

/// Element-wise multiplication of two vectors with single-precision.
/// - Parameters:
///   - lhs: The left vector `A[i]`.
///   - rhs: The right vector `B[i]`.
/// - Returns: A vector representing the result of `A[i] × B[i]`.
public func * (lhs: Vector<Float>, rhs: Vector<Float>) -> Vector<Float> {
    var result = Vector<Float>(length: lhs.length)
    vDSP.multiply(lhs.buffer, rhs.buffer, result: &result.buffer)
    return result
}

/// Element-wise multiplication of two vectors with double-precision.
/// - Parameters:
///   - lhs: The vector `A[i]`.
///   - rhs: The vector `B[i]`.
/// - Returns: A vector representing the result of `A[i] × B[i]`.
public func * (lhs: Vector<Double>, rhs: Vector<Double>) -> Vector<Double> {
    var result = Vector<Double>(length: lhs.length)
    vDSP.multiply(lhs.buffer, rhs.buffer, result: &result.buffer)
    return result
}

// MARK: Scalar-Matrix multiplication

/// Element-wise multiplication of a scalar value and a matrix with single-precision.
/// - Parameters:
///   - lhs: The left scalar value `A`.
///   - rhs: The right matrix `B[i]`.
/// - Returns: A matrix representing the result of `A × B[i]`.
public func * (lhs: Float, rhs: Matrix<Float>) -> Matrix<Float> {
    var result = Matrix<Float>(rows: rhs.rows, columns: rhs.columns)
    vDSP.multiply(lhs, rhs.buffer, result: &result.buffer)
    return result
}

/// Element-wise multiplication of a scalar value and a matrix with double-precision.
/// - Parameters:
///   - lhs: The left scalar value `A`.
///   - rhs: The right matrix `B[i]`.
/// - Returns: A matrix representing the result of `A × B[i]`.
public func * (lhs: Double, rhs: Matrix<Double>) -> Matrix<Double> {
    var result = Matrix<Double>(rows: rhs.rows, columns: rhs.columns)
    vDSP.multiply(lhs, rhs.buffer, result: &result.buffer)
    return result
}

// MARK: Matrix-Matrix multiplication

/// Matrix multiplication for single precision. Number of columns in the left matrix must be
/// equal to the number of rows in the right matrix.
/// - Parameters:
///   - lhs: Left matrix with dimensions of m x n.
///   - rhs: Right matrix with dimensions of n x p.
/// - Returns: Matrix with dimensions of m x p.
public func * (lhs: Matrix<Float>, rhs: Matrix<Float>) -> Matrix<Float> {
    precondition(lhs.columns == rhs.rows, "Number of columns in left matrix must equal number of rows in right matrix")
    let a = lhs.buffer.baseAddress
    let b = rhs.buffer.baseAddress

    let m = lhs.rows     // number of rows in matrices A and C
    let n = rhs.columns  // number of columns in matrices B and C
    let k = lhs.columns  // number of columns in matrix A; number of rows in matrix B
    let alpha: Float = 1.0
    let beta: Float = 0.0

    // matrix multiplication where C ← αAB + βC
    let c = Matrix<Float>(rows: lhs.rows, columns: rhs.columns)
    cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, m, n, k, alpha, a, k, b, n, beta, c.buffer.baseAddress, n)

    return c
}

/// Matrix multiplication for double precision. Number of columns in the left matrix must be
/// equal to the number of rows in the right matrix.
/// - Parameters:
///   - lhs: Left matrix with dimensions of m x n.
///   - rhs: Right matrix with dimensions of n x p.
/// - Returns: Matrix with dimensions of m x p.
public func * (lhs: Matrix<Double>, rhs: Matrix<Double>) -> Matrix<Double> {
    precondition(lhs.columns == rhs.rows, "Number of columns in left matrix must equal number of rows in right matrix")
    let a = lhs.buffer.baseAddress
    let b = rhs.buffer.baseAddress

    let m = lhs.rows     // number of rows in matrices A and C
    let n = rhs.columns  // number of columns in matrices B and C
    let k = lhs.columns  // number of columns in matrix A; number of rows in matrix B
    let alpha = 1.0
    let beta = 0.0

    // matrix multiplication where C ← αAB + βC
    let c = Matrix<Double>(rows: lhs.rows, columns: rhs.columns)
    cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, m, n, k, alpha, a, k, b, n, beta, c.buffer.baseAddress, n)

    return c
}

/// Matrix multiplication for double precision complex. Number of columns in left matrix must be
/// equal to number of rows in the right matrix.
/// - Parameters:
///   - lhs: Left matrix with dimensions of m x n.
///   - rhs: Right matrix with dimensions of n x p.
/// - Returns: Matrix with dimensions of m x p.
public func * (lhs: Matrix<Complex<Double>>, rhs: Matrix<Complex<Double>>) -> Matrix<Complex<Double>> {
    precondition(lhs.columns == rhs.rows, "Number of columns in left matrix must equal number of rows in right matrix")
    let a = lhs.buffer.baseAddress
    let b = rhs.buffer.baseAddress

    let m = lhs.rows     // rows in matrices A and C
    let n = rhs.columns  // columns in matrices B and C
    let k = lhs.columns  // columns in matrix A and rows in matrix B

    let alpha = [Complex(real: 1.0, imag: 0.0)]
    let beta = [Complex(real: 1.0, imag: 0.0)]

    let c = Matrix<Complex<Double>>(rows: lhs.rows, columns: rhs.columns)
    alpha.withUnsafeBytes { alphaPtr in
        beta.withUnsafeBytes { betaPtr in
            cblas_zgemm(
                CblasRowMajor, CblasNoTrans, CblasNoTrans, m, n, k,
                .init(alphaPtr.baseAddress!), .init(a), k, .init(b), n,
                .init(betaPtr.baseAddress!), .init(c.buffer.baseAddress), n
            )
        }
    }

    return c
}

/// Perform single precision matrix multiplication with compound assignment. Number
/// of columns in left matrix must be equal to number of rows in right matrix.
/// - Parameters:
///   - lhs: Left matrix with dimensions of M x N.
///   - rhs: Right matrix with dimensions of N x P.
/// - Returns: Matrix with dimensions of M x P.
public func *= (lhs: inout Matrix<Float>, rhs: Matrix<Float>) {
    precondition(lhs.columns == rhs.rows, "Number of columns in left matrix must equal number of rows in right matrix")
    lhs = lhs * rhs
}

/// Perform double precision matrix multiplication with compound assignment. Number
/// of columns in left matrix must be equal to number of rows in right matrix.
/// - Parameters:
///   - lhs: Left matrix with dimensions of M x N.
///   - rhs: Right matrix with dimensions of N x P.
/// - Returns: Matrix with dimensions of M x P.
public func *= (lhs: inout Matrix<Double>, rhs: Matrix<Double>) {
    precondition(lhs.columns == rhs.rows, "Number of columns in left matrix must equal number of rows in right matrix")
    lhs = lhs * rhs
}

/// Element-wise matrix multiplication for single precision matrices. Matrices must have same dimensions.
/// This is also known as the Hadamard product or Schur product.
/// - Parameters:
///   - lhs: Left matrix with dimension of m x n.
///   - rhs: Right matrix with dimension m x n.
/// - Returns: Matrix of the same dimensions.
public func .* (lhs: Matrix<Float>, rhs: Matrix<Float>) -> Matrix<Float> {
    precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must have same dimensions")
    var mat = Matrix<Float>(rows: lhs.rows, columns: lhs.columns)
    vDSP.multiply(lhs.buffer, rhs.buffer, result: &mat.buffer)
    return mat
}

/// Element-wise matrix multiplication for double precision matrices. Matrices must have same dimensions.
/// This is also known as the Hadamard product or Schur product.
/// - Parameters:
///   - lhs: Left matrix with dimension of m x n.
///   - rhs: Right matrix with dimension m x n.
/// - Returns: Matrix of the same dimensions.
public func .* (lhs: Matrix<Double>, rhs: Matrix<Double>) -> Matrix<Double> {
    precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must have same dimensions")
    var mat = Matrix<Double>(rows: lhs.rows, columns: lhs.columns)
    vDSP.multiply(lhs.buffer, rhs.buffer, result: &mat.buffer)
    return mat
}

/// Element-wise matrix multiplication for single precision matrices. Matrices must have same dimensions.
/// This is also known as the Hadamard product or Schur product.
/// - Parameters:
///   - lhs: Left matrix with dimension of m x n.
///   - rhs: Right matrix with dimension m x n.
/// - Returns: Matrix of the same dimensions.
public func ⊙ (lhs: Matrix<Float>, rhs: Matrix<Float>) -> Matrix<Float> {
    precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must have same dimensions")
    var mat = Matrix<Float>(rows: lhs.rows, columns: lhs.columns)
    vDSP.multiply(lhs.buffer, rhs.buffer, result: &mat.buffer)
    return mat
}

/// Element-wise matrix multiplication for double precision matrices. Matrices must have same dimensions.
/// This is also known as the Hadamard product or Schur product.
/// - Parameters:
///   - lhs: Left matrix with dimension of m x n.
///   - rhs: Right matrix with dimension m x n.
/// - Returns: Matrix of the same dimensions.
public func ⊙ (lhs: Matrix<Double>, rhs: Matrix<Double>) -> Matrix<Double> {
    precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must have same dimensions")
    var mat = Matrix<Double>(rows: lhs.rows, columns: lhs.columns)
    vDSP.multiply(lhs.buffer, rhs.buffer, result: &mat.buffer)
    return mat
}
