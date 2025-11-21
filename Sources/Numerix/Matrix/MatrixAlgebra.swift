/*
Matrix algebra protocol and associated extensions.

For matrix determinant, in LAPACK the INFO value is used as the U index `i` in
the error message, this index is one-based so it needs to be zero-based (INFO - 1)
for Swift error message.

Note that there is already an `inverse` function in Swift.

Note that the `inv` implementation here uses LAPACK `dgetrf` and `dgetri` functions.
In LAPACK the INFO value is used as the index `i` in the error message, this index
is one-based so it needs to be zero-based (INFO - 1) for the Swift error message.
*/

import Accelerate

@_documentation(visibility: private)
public protocol MatrixAlgebra {
    static func copy(a: Matrix<Self>, b: Matrix<Self>)
    static func det(a: Matrix<Self>) -> Self
    static func inv(a: Matrix<Self>) -> Matrix<Self>
    static func norm(a: Matrix<Self>) -> Self
    static func scale(a: inout Matrix<Self>, by k: Self)
    static func swapValues(a: inout Matrix<Self>, b: inout Matrix<Self>)
    static func transpose(a: Matrix<Self>) -> Matrix<Self>
}

@_documentation(visibility: private)
extension Double: MatrixAlgebra {

    public static func copy(a: Matrix<Double>, b: Matrix<Double>) {
        cblas_dcopy(a.buffer.count, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

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

    public static func norm(a: Matrix<Double>) -> Double {
        cblas_dnrm2(a.buffer.count, a.buffer.baseAddress, 1)
    }

    public static func scale(a: inout Matrix<Double>, by k: Double) {
        cblas_dscal(a.rows * a.columns, k, a.buffer.baseAddress, 1)
    }

    public static func swapValues(a: inout Matrix<Double>, b: inout Matrix<Double>) {
        precondition(a.rows == b.rows && a.columns == b.columns, "Matrices must have same shape")
        cblas_dswap(a.buffer.count, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func transpose(a: Matrix<Double>) -> Matrix<Double> {
        let m = vDSP_Length(a.columns)
        let n = vDSP_Length(a.rows)
        let mat = Matrix<Double>(rows: a.columns, columns: a.rows)
        vDSP_mtransD(a.buffer.baseAddress!, 1, mat.buffer.baseAddress!, 1, m, n)
        return mat
    }
}

@_documentation(visibility: private)
extension Float: MatrixAlgebra {

    public static func copy(a: Matrix<Float>, b: Matrix<Float>) {
        cblas_scopy(a.buffer.count, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

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

    public static func norm(a: Matrix<Float>) -> Float {
        cblas_snrm2(a.buffer.count, a.buffer.baseAddress, 1)
    }

    public static func scale(a: inout Matrix<Float>, by k: Float) {
        cblas_sscal(a.rows * a.columns, k, a.buffer.baseAddress, 1)
    }

    public static func swapValues(a: inout Matrix<Float>, b: inout Matrix<Float>) {
        precondition(a.rows == b.rows && a.columns == b.columns, "Matrices must have same shape")
        cblas_sswap(a.buffer.count, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func transpose(a: Matrix<Float>) -> Matrix<Float> {
        let m = vDSP_Length(a.columns)
        let n = vDSP_Length(a.rows)
        let mat = Matrix<Float>(rows: a.columns, columns: a.rows)
        vDSP_mtrans(a.buffer.baseAddress!, 1, mat.buffer.baseAddress!, 1, m, n)
        return mat
    }
}


@_documentation(visibility: private)
extension Int: MatrixAlgebra {

    public static func copy(a: Matrix<Int>, b: Matrix<Int>) {
        fatalError("Not supported for integer matrices")
    }

    public static func det(a: Matrix<Int>) -> Int {
        fatalError("Determinant of integer matrix is not supported")
    }

    public static func inv(a: Matrix<Int>) -> Matrix<Int> {
        fatalError("Not supported for integer values")
    }

    public static func norm(a: Matrix<Int>) -> Int {
        var sumOfSquares = 0
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                sumOfSquares &+= a[i, j] * a[i, j]
            }
        }
        let result = sqrt(Float(sumOfSquares))
        return Int(result)
    }

    public static func scale(a: inout Matrix<Int>, by k: Int) {
        a = a .* k
    }

    public static func swapValues(a: inout Matrix<Int>, b: inout Matrix<Int>) {
        precondition(a.rows == b.rows && a.columns == b.columns, "Matrices must have same shape")
        swap(&a, &b)
    }

    public static func transpose(a: Matrix<Int>) -> Matrix<Int> {
        var transposed = Matrix<Int>(rows: a.columns, columns: a.rows)
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                transposed[j, i] = a[i, j]
            }
        }
        return transposed
    }
}

extension Matrix where Scalar: MatrixAlgebra {

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

/// Swap the values of two matrices.
///
/// In this example the scalar values in `mat1` are exchanged for the values in `mat2` and vice versa.
/// ```swift
/// var mat1 = Matrix<Float>([[2, 3, 4], [5, 6, 7]])
/// var mat2 = Matrix<Float>([[9, 8, 7], [10, 12, 13]])
/// swapValues(&mat1, &mat2)
/// ```
/// - Parameters:
///   - a: The first matrix.
///   - b: The second matrix.
public func swapValues<Scalar: MatrixAlgebra>(_ a: inout Matrix<Scalar>, _ b: inout Matrix<Scalar>) {
    Scalar.swapValues(a: &a, b: &b)
}
