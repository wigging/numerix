/*
Float extension to conform to Algebra protocol.
*/

import Accelerate

@_documentation(visibility: private)
extension Float: Algebra {

    public static func absoluteSum(a: Vector<Float>) -> Float {
        cblas_sasum(a.size, a.buffer.baseAddress, 1)
    }

    public static func copy(a: Matrix<Float>, b: Matrix<Float>) {
        cblas_scopy(a.buffer.count, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func copy(a: Vector<Float>, b: Vector<Float>) {
        cblas_scopy(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func cumulativeSum(a: Vector<Float>) -> Vector<Float> {
        var s: Float = 1.0             // scalar weighting factor for A
        let n = vDSP_Length(a.size)    // number of elements to process

        var result = Vector(like: a)
        vDSP_vrsum(a.buffer.baseAddress!, 1, &s, result.buffer.baseAddress!, 1, n)
        vDSP.add(a[0], result.buffer, result: &result.buffer)

        return result
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

    public static func dot(a: Vector<Float>, b: Vector<Float>) -> Float {
        cblas_sdot(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
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

    public static func norm(a: Vector<Float>) -> Float {
        cblas_snrm2(a.size, a.buffer.baseAddress, 1)
    }

    public static func scale(a: inout Matrix<Float>, by k: Float) {
        cblas_sscal(a.rows * a.columns, k, a.buffer.baseAddress, 1)
    }

    public static func scale(a: inout Vector<Float>, by k: Float) {
        cblas_sscal(a.size, k, a.buffer.baseAddress, 1)
    }

    public static func sum(a: Vector<Float>) -> Float {
        vDSP.sum(a.buffer)
    }

    public static func swapValues(a: inout Matrix<Float>, b: inout Matrix<Float>) {
        precondition(a.rows == b.rows && a.columns == b.columns, "Matrices must have same shape")
        cblas_sswap(a.buffer.count, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func swapValues(a: inout Vector<Float>, b: inout Vector<Float>) {
        precondition(a.size == b.size, "Vectors must be same size")
        cblas_sswap(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func transpose(a: Matrix<Float>) -> Matrix<Float> {
        let m = vDSP_Length(a.columns)
        let n = vDSP_Length(a.rows)
        let mat = Matrix<Float>(rows: a.columns, columns: a.rows)
        vDSP_mtrans(a.buffer.baseAddress!, 1, mat.buffer.baseAddress!, 1, m, n)
        return mat
    }

    public static func update(a: inout Vector<Float>, k: Float, b: Vector<Float>) {
        cblas_saxpy(b.size, k, b.buffer.baseAddress, 1, a.buffer.baseAddress, 1)
    }
}
