/*
Inverse function for the Matrix structure.

Note that there is already an `inverse` function in Swift.

Uses LAPACK `dgetrf` and `dgetri` functions. In LAPACK the INFO value is used
as the index `i` in the error message, this index is one-based so it needs to
be zero-based (INFO - 1) for Swift error message.
*/

import Accelerate

/// Errors for the inverse function.
///
/// The errors represent an illegal value in the matrix `InverseError.illegalValue`
/// or a singular matrix `InverseError.singular`. Each error has an associated
/// string that is the error message and a matrix that represents the partial result.
///
/// The errors are based on the `INFO` message from LAPACK. See the LAPACK
/// documentation for `dgetrf` and `dgetri` for more information.
public enum InverseError<T>: Error {
    /// An illegal value in the matrix.
    /// - Parameter message: A string that contains the error message.
    /// - Parameter matrix: A matrix that represents the partial result.
    case illegalValue(message: String, matrix: Matrix<T>)

    /// A singular matrix.
    /// - Parameter message: A string that contains the error message.
    /// - Parameter matrix: A matrix that represents the partial result.
    case singular(message: String, matrix: Matrix<T>)
}

/// Compute the inverse of a single-precision matrix.
///
/// Calculate the inverse of a 2x2 matrix.
/// ```swift
/// let A = Matrix<Float>([[1, 2], [3, 4]])
/// let invA = try! inverse(A)
/// ```
/// A safer approach is to catch the errors as demonstrated by the example below
/// that tries to calculate the inverse of a 4x4 matrix. The error message and
/// partial result can be obtained from the ``InverseError`` associated values.
/// ```swift
/// let C = Matrix<Float>([[1, 2, 3, 4],
///                        [4, 5, 6, 7],
///                        [8, 9, 10, 11],
///                        [12, 13, 14, 15]])
///
/// do {
///     let invC = try inverse(C)
///     print(invC)
/// } catch InverseError<Float>.illegalValue(let err, let mat) {
///     print("Illegal value in matrix C.")
///     print("Error is: \(err)")
///     print("Partial result is: \(mat)")
/// } catch InverseError<Float>.singular(let err, let mat) {
///     print("Matrix C is singular.")
///     print("Error is: \(err)")
///     print("Partial result is: \(mat)")
/// }
/// ```
/// - Parameter mat: A square input matrix.
/// - Throws: An ``InverseError`` with the error message and partial matrix.
/// - Returns: Inverse of the input matrix.
public func inverse(_ mat: Matrix<Float>) throws -> Matrix<Float> {
    precondition(mat.rows == mat.columns, "Input matrix is not square")

    let mat = mat.copy()
    var n = mat.rows
    var pivots = [Int](repeating: 0, count: mat.rows)
    var workspace = [Float](repeating: 0.0, count: mat.rows)
    var info = 0

    // Perform LU decomposition
    sgetrf_(&n, &n, mat.buffer.baseAddress, &n, &pivots, &info)
    if info < 0 {
        let err = "The \(info - 1)-th argument had an illegal value."
        throw InverseError.illegalValue(message: err, matrix: mat)
    } else if info > 0 {
        let err = """
        U(\(info - 1),\(info - 1)) is exactly zero. The factorization has been completed, but \
        the factor U is exactly singular, and division by zero will occur if it is used \
        to solve a system of equations.
        """
        throw InverseError.singular(message: err, matrix: mat)
    }
    info = 0

    // Calculate inverse based on LU decomposition
    sgetri_(&n, mat.buffer.baseAddress, &n, &pivots, &workspace, &n, &info)
    if info < 0 {
        let err = "The \(info - 1)-th argument had an illegal value."
        throw InverseError.illegalValue(message: err, matrix: mat)
    } else if info > 0 {
        let err = """
        U(\(info - 1),\(info - 1)) is exactly zero; the matrix is singular and its \
        inverse could not be computed.
        """
        throw InverseError.singular(message: err, matrix: mat)
    }

    return mat
}

/// Compute the inverse of a double-precision matrix.
///
/// Calculate the inverse of a 2x2 matrix.
/// ```swift
/// let A = Matrix<Double>([[1, 2], [3, 4]])
/// let invA = try! inverse(A)
/// ```
/// A safer approach is to catch the errors as demonstrated by the example below
/// that tries to calculate the inverse of a 4x4 matrix. The error message and
/// partial result can be obtained from the ``InverseError`` associated values.
/// ```swift
/// let C = Matrix<Double>([[1, 2, 3, 4],
///                         [4, 5, 6, 7],
///                         [8, 9, 10, 11],
///                         [12, 13, 14, 15]])
///
/// do {
///     let invC = try inverse(C)
///     print(invC)
/// } catch InverseError<Double>.illegalValue(let err, let mat) {
///     print("Illegal value in matrix C.")
///     print("Error is: \(err)")
///     print("Partial result is: \(mat)")
/// } catch InverseError<Double>.singular(let err, let mat) {
///     print("Matrix C is singular.")
///     print("Error is: \(err)")
///     print("Partial result is: \(mat)")
/// }
/// ```
/// - Parameter mat: A square input matrix.
/// - Throws: An ``InverseError`` with the error message and partial matrix.
/// - Returns: Inverse of the input matrix.
public func inverse(_ mat: Matrix<Double>) throws -> Matrix<Double> {
    precondition(mat.rows == mat.columns, "Input matrix is not square")

    let mat = mat.copy()
    var n = mat.rows
    var pivots = [Int](repeating: 0, count: mat.rows)
    var workspace = [Double](repeating: 0.0, count: mat.rows)
    var info = 0

    // Perform LU decomposition
    dgetrf_(&n, &n, mat.buffer.baseAddress, &n, &pivots, &info)
    if info < 0 {
        let err = "The \(info - 1)-th argument had an illegal value."
        throw InverseError.illegalValue(message: err, matrix: mat)
    } else if info > 0 {
        let err = """
        U(\(info - 1),\(info - 1)) is exactly zero. The factorization has been completed, but \
        the factor U is exactly singular, and division by zero will occur if it is used \
        to solve a system of equations.
        """
        throw InverseError.singular(message: err, matrix: mat)
    }
    info = 0

    // Calculate inverse based on LU decomposition
    dgetri_(&n, mat.buffer.baseAddress, &n, &pivots, &workspace, &n, &info)
    if info < 0 {
        let err = "The \(info - 1)-th argument had an illegal value."
        throw InverseError.illegalValue(message: err, matrix: mat)
    } else if info > 0 {
        let err = """
        U(\(info - 1),\(info - 1) is exactly zero; the matrix is singular and its \
        inverse could not be computed.
        """
        throw InverseError.singular(message: err, matrix: mat)
    }

    return mat
}
