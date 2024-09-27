/*
Determinant functions for the Matrix structure.

Uses LAPACK `sgetrf` or `dgetrf` functions. In LAPACK the INFO value is used
as the U index `i` in the error message, this index is one-based so it needs
to be zero-based (INFO - 1) for Swift error message.
*/

import Accelerate

/// Errors for the determinant function.
///
/// The errors represent an illegal value in the matrix `InverseError.illegalValue`
/// or a singular matrix `InverseError.singular`. Each error has an associated
/// string that is the error message and a matrix that represents the partial result.
///
/// The errors are based on the `INFO` message from LAPACK. See the LAPACK
/// documentation for `sgetrf` and `dgetrf` for more information.
public enum DeterminantError<T>: Error {
    /// An illegal value in the matrix.
    /// - Parameter error: A string that contains the error message.
    /// - Parameter matrix: A matrix that represents the partial result.
    case illegalValue(error: String, matrix: Matrix<T>)

    /// A singular matrix.
    /// - Parameter error: A string that contains the error message.
    /// - Parameter matrix: A matrix that represents the partial result.
    case singular(error: String, matrix: Matrix<T>)
}

/// Compute the determinant of a single-precision matrix.
///
/// Calculate the determinant of a 2x2 matrix.
/// ```swift
/// let A: Matrix<Float> = [[1, 2], [3, 4]]
/// let detA = try determinant(A)
/// ```
///
/// Catch the errors from calculating the determinant.
/// ```swift
/// let B = 0
/// ```
/// - Parameter matrix: The square input matrix.
/// - Throws: A ``DeterminantError`` with error message and partial matrix.
/// - Returns: The determinant of the input matrix.
public func determinant(_ matrix: Matrix<Float>) throws -> Float {
    precondition(matrix.rows == matrix.columns, "Input matrix is not square")
    let mat = matrix.copy()

    // Perform LU factorization using LAPACK sgetrf
    var rows = mat.rows
    var pivots = [Int](repeating: 0, count: mat.rows)
    var info = 0
    var det: Float = 1.0
    sgetrf_(&rows, &rows, mat.buffer.baseAddress, &rows, &pivots, &info)

    // Throw errors based on INFO status
    if info < 0 {
        let err = "The \(abs(info))-th argument had an illegal value."
        throw DeterminantError.illegalValue(error: err, matrix: mat)
    } else if info > 0 {
        let err = """
        U(\(info - 1),\(info - 1)) is exactly zero. The factorization has been completed, but \
        the factor U is exactly singular, and division by zero will occur if it is used \
        to solve a system of equations.
        """
        throw DeterminantError.singular(error: err, matrix: mat)
    }

    // Calculate determinant from the diagonal
    for i in 0..<rows {
        det *= mat[i, i]
        if pivots[i] != i + 1 {
            det *= -1
        }
    }

    return det
}

/// Compute the determinant of a double-precision matrix.
///
/// Calculate the determinant of a 2x2 matrix.
/// ```swift
/// let A: Matrix<Double> = [[1, 2], [3, 4]]
/// let detA = try determinant(A)
/// ```
///
/// Catch the errors from calculating the determinant.
/// ```swift
/// let B = 0
/// ```
/// - Parameter matrix: The square input matrix.
/// - Throws: A ``DeterminantError`` with error message and partial matrix.
/// - Returns: The determinant of the input matrix.
public func determinant(_ matrix: Matrix<Double>) throws -> Double {
    precondition(matrix.rows == matrix.columns, "Input matrix is not square")
    let mat = matrix.copy()

    // Perform LU factorization using LAPACK sgetrf
    var rows = mat.rows
    var pivots = [Int](repeating: 0, count: mat.rows)
    var info = 0
    var det: Double = 1.0
    dgetrf_(&rows, &rows, mat.buffer.baseAddress, &rows, &pivots, &info)

    // Throw errors based on INFO status
    if info < 0 {
        let err = "The \(abs(info))-th argument had an illegal value."
        throw DeterminantError.illegalValue(error: err, matrix: mat)
    } else if info > 0 {
        let err = """
        U(\(info - 1),\(info - 1)) is exactly zero. The factorization has been completed, but \
        the factor U is exactly singular, and division by zero will occur if it is used \
        to solve a system of equations.
        """
        throw DeterminantError.singular(error: err, matrix: mat)
    }

    // Calculate determinant from the diagonal
    for i in 0..<rows {
        det *= mat[i, i]
        if pivots[i] != i + 1 {
            det *= -1
        }
    }

    return det
}
