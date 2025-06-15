/*
Matrix extension for determinant.

Uses LAPACK `sgetrf` or `dgetrf` functions. In LAPACK the INFO value is used
as the U index `i` in the error message, this index is one-based so it needs
to be zero-based (INFO - 1) for Swift error message.
*/

import Accelerate

public protocol Determinant {
    static func det(a: Matrix<Self>) -> Self
}

extension Float: Determinant {
    public static func det(a: Matrix<Float>) -> Float {
        precondition(a.rows == a.columns, "Input matrix is not square")
        let mat = a.copy()

        // Perform LU factorization using LAPACK sgetrf
        var rows = mat.rows
        var pivots = [Int](repeating: 0, count: mat.rows)
        var info = 0
        var det: Float = 1.0
        sgetrf_(&rows, &rows, mat.buffer.baseAddress, &rows, &pivots, &info)

        // Check if INFO < 0
        precondition(info >= 0, "The \(abs(info))-th argument had an illegal value.")

        // Check if INFO > 0
        let err = """
        U(\(info - 1),\(info - 1)) is exactly zero. The factorization has been \
        completed, but the factor U is exactly singular, and division by zero will \
        occur if it is used to solve a system of equations.
        """
        precondition(info <= 0, err)

        // Calculate determinant from the diagonal if INFO = 0
        for i in 0..<rows {
            det *= mat[i, i]
            if pivots[i] != i + 1 {
                det *= -1
            }
        }

        return det
    }
}

extension Double: Determinant {
    public static func det(a: Matrix<Double>) -> Double {
        precondition(a.rows == a.columns, "Input matrix is not square")
        let mat = a.copy()

        // Perform LU factorization using LAPACK sgetrf
        var rows = mat.rows
        var pivots = [Int](repeating: 0, count: mat.rows)
        var info = 0
        var det: Double = 1.0
        dgetrf_(&rows, &rows, mat.buffer.baseAddress, &rows, &pivots, &info)

        // Check if INFO < 0
        precondition(info >= 0, "The \(abs(info))-th argument had an illegal value.")

        // Check if INFO > 0
        let err = """
        U(\(info - 1),\(info - 1)) is exactly zero. The factorization has been \
        completed, but the factor U is exactly singular, and division by zero will \
        occur if it is used to solve a system of equations.
        """
        precondition(info <= 0, err)

        // Calculate determinant from the diagonal if INFO = 0
        for i in 0..<rows {
            det *= mat[i, i]
            if pivots[i] != i + 1 {
                det *= -1
            }
        }

        return det
    }
}

extension Matrix where Scalar: Determinant {

    /// Compute the determinant of the matrix.
    ///
    /// Given a square matrix, compute the determinant of the matrix using single
    /// and double precision values. A precondition error occurs if the input matrix
    /// is not square. This determinant method uses the LAPACK `sgetrf` and `dgetrf`
    /// functions for single and double precision LU factorization. The diagonal of
    /// the factorization is used to calculate the determinant.
    ///
    /// ```swift
    /// let a: Matrix<Double> = [[1, 2], [3, 4]]
    /// let detA = a.determinant()
    /// ```
    ///
    /// - Returns: The determinant of the matrix.
    public func determinant() -> Scalar {
        Scalar.det(a: self)
    }
}
