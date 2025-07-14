/*
Double extension to conform to Algebra protocol.
*/

import Accelerate

@_documentation(visibility: private)
extension Double: Algebra {

    public static func absoluteSum(a: Vector<Double>) -> Double {
        cblas_dasum(a.size, a.buffer.baseAddress, 1)
    }

    public static func copy(a: Matrix<Double>, b: Matrix<Double>) {
        cblas_dcopy(a.buffer.count, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func copy(a: Vector<Double>, b: Vector<Double>) {
        cblas_dcopy(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func cumulativeSum(a: Vector<Double>) -> Vector<Double> {
        var s = 1.0                    // scalar weighting factor for A
        let n = vDSP_Length(a.size)    // number of elements to process

        var result = Vector(like: a)
        vDSP_vrsumD(a.buffer.baseAddress!, 1, &s, result.buffer.baseAddress!, 1, n)
        vDSP.add(a[0], result.buffer, result: &result.buffer)

        return result
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

    public static func dot(a: Vector<Double>, b: Vector<Double>) -> Double {
        cblas_ddot(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
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

    public static func norm(a: Vector<Double>) -> Double {
        cblas_dnrm2(a.size, a.buffer.baseAddress, 1)
    }

    public static func scale(a: inout Matrix<Double>, by k: Double) {
        cblas_dscal(a.rows * a.columns, k, a.buffer.baseAddress, 1)
    }

    public static func scale(a: inout Vector<Double>, by k: Double) {
        cblas_dscal(a.size, k, a.buffer.baseAddress, 1)
    }

    public static func sum(a: Vector<Double>) -> Double {
        vDSP.sum(a.buffer)
    }

    public static func swapValues(a: inout Matrix<Double>, b: inout Matrix<Double>) {
        precondition(a.rows == b.rows && a.columns == b.columns, "Matrices must have same shape")
        cblas_dswap(a.buffer.count, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func swapValues(a: inout Vector<Double>, b: inout Vector<Double>) {
        precondition(a.size == b.size, "Vectors must be same size")
        cblas_dswap(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func transpose(a: Matrix<Double>) -> Matrix<Double> {
        let m = vDSP_Length(a.columns)
        let n = vDSP_Length(a.rows)
        let mat = Matrix<Double>(rows: a.columns, columns: a.rows)
        vDSP_mtransD(a.buffer.baseAddress!, 1, mat.buffer.baseAddress!, 1, m, n)
        return mat
    }

    public static func update(a: inout Vector<Double>, k: Double, b: Vector<Double>) {
        cblas_daxpy(b.size, k, b.buffer.baseAddress, 1, a.buffer.baseAddress, 1)
    }
}
