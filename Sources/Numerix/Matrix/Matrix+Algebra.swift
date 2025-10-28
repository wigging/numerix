/*
Matrix extension to conform to Algebra protocol.
*/

extension Matrix where Scalar: Algebra {

    /// Copy contents of matrix `b` into matrix `a` such that `a == b`.
    ///
    /// This uses the BLAS `copy` routine for Float and Double values.
    /// - Parameter b: The matrix that is copied.
    public func copy(_ b: Matrix) {
        Scalar.copy(a: self, b: b)
    }

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

    /// The Euclidean norm of the matrix. Also known as the 2-norm or maximum singular value.
    /// - Returns: The matrix norm.
    public func norm() -> Scalar {
        Scalar.norm(a: self)
    }

    /// Multiply each value in the matrix by a constant.
    ///
    /// For integer matrices, this performs element-wise multiplication. For
    /// single and double precision matrices this uses BLAS routines `sscal`
    /// and `dscal` respectively.
    ///
    /// - Parameter k: The scaling factor.
    public mutating func scale(by k: Scalar) {
        Scalar.scale(a: &self, by: k)
    }

    /// Transpose the matrix and return the result.
    /// - Returns: The transposed matrix.
    public func transpose() -> Matrix {
        Scalar.transpose(a: self)
    }
}
