/*
Matrix extension for inverse.

Note that there is already an `inverse` function in Swift.

Uses LAPACK `dgetrf` and `dgetri` functions. In LAPACK the INFO value is used
as the index `i` in the error message, this index is one-based so it needs to
be zero-based (INFO - 1) for Swift error message.
*/

import Accelerate

public protocol Inverse {
    static func inv(a: Matrix<Self>) -> Matrix<Self>
}

extension Float: Inverse {
    public static func inv(a: Matrix<Float>) -> Matrix<Float> {
        precondition(a.rows == a.columns, "Input matrix is not square")

        let mat = a.copy()
        var n = a.rows
        var pivots = [Int](repeating: 0, count: a.rows)
        var workspace = [Float](repeating: 0.0, count: a.rows)
        var info = 0

        // Perform LU decomposition
        sgetrf_(&n, &n, mat.buffer.baseAddress, &n, &pivots, &info)

        // Check if info < 0
        precondition(info >= 0, "The \(info - 1)-th argument had an illegal value")

        // Check if info > 0
        let err = """
        U(\(info - 1),\(info - 1)) is exactly zero. The factorization has been completed, but \
        the factor U is exactly singular, and division by zero will occur if it is used \
        to solve a system of equations.
        """
        precondition(info <= 0, err)

        // Calculate inverse based on LU decomposition
        info = 0
        sgetri_(&n, mat.buffer.baseAddress, &n, &pivots, &workspace, &n, &info)

        // Check if info < 0
        precondition(info >= 0, "The \(info - 1)-th argument had an illegal value")

        // Check if info > 0
        let err2 = """
        U(\(info - 1),\(info - 1)) is exactly zero. The factorization has been completed, but \
        the factor U is exactly singular, and division by zero will occur if it is used \
        to solve a system of equations.
        """
        precondition(info <= 0, err2)

        return mat
    }
}

extension Double: Inverse {
    public static func inv(a: Matrix<Double>) -> Matrix<Double> {
        precondition(a.rows == a.columns, "Input matrix is not square")

        let mat = a.copy()
        var n = a.rows
        var pivots = [Int](repeating: 0, count: a.rows)
        var workspace = [Double](repeating: 0.0, count: a.rows)
        var info = 0

        // Perform LU decomposition
        dgetrf_(&n, &n, mat.buffer.baseAddress, &n, &pivots, &info)

        // Check if info < 0
        precondition(info >= 0, "The \(info - 1)-th argument had an illegal value")

        // Check if info > 0
        let err = """
        U(\(info - 1),\(info - 1)) is exactly zero. The factorization has been completed, but \
        the factor U is exactly singular, and division by zero will occur if it is used \
        to solve a system of equations.
        """
        precondition(info <= 0, err)

        // Calculate inverse based on LU decomposition
        info = 0
        dgetri_(&n, mat.buffer.baseAddress, &n, &pivots, &workspace, &n, &info)

        // Check if info < 0
        precondition(info >= 0, "The \(info - 1)-th argument had an illegal value")

        // Check if info > 0
        let err2 = """
        U(\(info - 1),\(info - 1)) is exactly zero. The factorization has been completed, but \
        the factor U is exactly singular, and division by zero will occur if it is used \
        to solve a system of equations.
        """
        precondition(info <= 0, err2)

        return mat
    }
}

extension Matrix where Scalar: Inverse {

    /// Compute the inverse of the matrix.
    ///
    /// Given a square matrix, compute the inverse of the matrix using single
    /// and double precision values. A precondition error occurs if the matrix
    /// is not square. This inverse function uses the LAPACK `dgetri` function
    /// to compute the inverse using the LU factorization from the LAPACK `dgetrf`
    /// function.
    ///
    /// ```swift
    /// let a = Matrix<Float>([[1, 2], [3, 4]])
    /// let invA = a.inverse()
    /// ```
    /// 
    /// - Returns: The inverse of the matrix.
    public func inverse() -> Matrix {
        Scalar.inv(a: self)
    }
}
