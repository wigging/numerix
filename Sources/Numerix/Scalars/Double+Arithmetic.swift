/*
Double extension to conform to Arithmetic protocol.
*/

import Accelerate

@_documentation(visibility: private)
extension Double: Arithmetic {
    // A + k
    public static func add(_ a: Complex<Double>, _ k: Double) -> Complex<Double> {
        Complex(a.real + k, a.imaginary)
    }

    public static func add(_ a: Matrix<Double>, _ k: Double) -> Matrix<Double> {
        var mat = Matrix(like: a)
        vDSP.add(k, a.buffer, result: &mat.buffer)
        return mat
    }

    public static func add(_ a: ShapedArray<Double>, _ k: Double) -> ShapedArray<Double> {
        var arr = ShapedArray<Double>(shape: a.shape)
        vDSP.add(k, a.buffer, result: &arr.buffer)
        return arr
    }

    // A + B
    public static func add(_ a: Complex<Double>, _ b: Complex<Double>) -> Complex<Double> {
        Complex(a.real + b.real, a.imaginary + b.imaginary)
    }

    public static func add(_ a: Matrix<Double>, _ b: Matrix<Double>) -> Matrix<Double> {
        var mat = Matrix(like: a)
        vDSP.add(a.buffer, b.buffer, result: &mat.buffer)
        return mat
    }

    public static func add(_ a: ShapedArray<Double>, _ b: ShapedArray<Double>) -> ShapedArray<Double> {
        var arr = ShapedArray<Double>(shape: a.shape)
        vDSP.add(a.buffer, b.buffer, result: &arr.buffer)
        return arr
    }

    // k - A

    public static func subtract(_ k: Double, _ a: Matrix<Double>) -> Matrix<Double> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var mat = Matrix(like: a)
        vDSP.subtract(arr, a.buffer, result: &mat.buffer)
        return mat
    }

    public static func subtract(_ k: Double, _ a: ShapedArray<Double>) -> ShapedArray<Double> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var result = ShapedArray<Double>(shape: a.shape)
        vDSP.subtract(arr, a.buffer, result: &result.buffer)
        return result
    }

    // A - k

    public static func subtract(_ a: Matrix<Double>, _ k: Double) -> Matrix<Double> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var mat = Matrix(like: a)
        vDSP.subtract(a.buffer, arr, result: &mat.buffer)
        return mat
    }

    public static func subtract(_ a: ShapedArray<Double>, _ k: Double) -> ShapedArray<Double> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var result = ShapedArray<Double>(shape: a.shape)
        vDSP.subtract(arr, a.buffer, result: &result.buffer)
        return result
    }

    // A - B

    public static func subtract(_ a: Matrix<Double>, _ b: Matrix<Double>) -> Matrix<Double> {
        var mat = Matrix(like: a)
        vDSP.subtract(a.buffer, b.buffer, result: &mat.buffer)
        return mat
    }

    public static func subtract(_ a: ShapedArray<Double>, _ b: ShapedArray<Double>) -> ShapedArray<Double> {
        precondition(a.shape == b.shape, "Shaped arrays must have same shape")
        var result = ShapedArray<Double>(shape: a.shape)
        vDSP.subtract(a.buffer, b.buffer, result: &result.buffer)
        return result
    }

    // A * k

    public static func multiply(_ a: Matrix<Double>, _ k: Double) -> Matrix<Double> {
        var mat = Matrix(like: a)
        vDSP.multiply(k, a.buffer, result: &mat.buffer)
        return mat
    }

    public static func multiply(_ a: ShapedArray<Double>, _ k: Double) -> ShapedArray<Double> {
        var array = ShapedArray<Double>(shape: a.shape)
        vDSP.multiply(k, a.buffer, result: &array.buffer)
        return array
    }

    // A * B

    public static func multiply(_ a: Matrix<Double>, _ b: Matrix<Double>) -> Matrix<Double> {
        var mat = Matrix(like: a)
        vDSP.multiply(a.buffer, b.buffer, result: &mat.buffer)
        return mat
    }

    public static func multiply(_ a: ShapedArray<Double>, _ b: ShapedArray<Double>) -> ShapedArray<Double> {
        var array = ShapedArray<Double>(shape: a.shape)
        vDSP.multiply(a.buffer, b.buffer, result: &array.buffer)
        return array
    }

    // A x B
    public static func matrixMultiply(_ a: Matrix<Double>, _ b: Matrix<Double>) -> Matrix<Double> {
        precondition(a.columns == b.rows, "Number of columns in matrix A must equal number of rows in matrix B")

        let m = a.rows     // number of rows in matrices A and C
        let n = b.columns  // number of columns in matrices B and C
        let k = a.columns  // number of columns in matrix A; number of rows in matrix B
        let alpha = 1.0
        let beta = 0.0

        // matrix multiplication where C ← αAB + βC
        let c = Matrix<Double>(rows: a.rows, columns: b.columns)
        cblas_dgemm(
            CblasRowMajor, CblasNoTrans, CblasNoTrans,
            m, n, k, alpha,
            a.buffer.baseAddress, k,
            b.buffer.baseAddress, n,
            beta,
            c.buffer.baseAddress, n
        )

        return c
    }

    // k / A

    public static func divide(_ k: Double, _ a: Matrix<Double>) -> Matrix<Double> {
        var mat = Matrix(like: a)
        vDSP.divide(k, a.buffer, result: &mat.buffer)
        return mat
    }

    public static func divide(_ k: Double, _ a: ShapedArray<Double>) -> ShapedArray<Double> {
        var arr = ShapedArray<Double>(shape: a.shape)
        vDSP.divide(k, a.buffer, result: &arr.buffer)
        return arr
    }

    // A / k

    public static func divide(_ a: Matrix<Double>, _ k: Double) -> Matrix<Double> {
        var mat = Matrix(like: a)
        vDSP.divide(a.buffer, k, result: &mat.buffer)
        return mat
    }

    public static func divide(_ a: ShapedArray<Double>, _ k: Double) -> ShapedArray<Double> {
        var arr = ShapedArray<Double>(shape: a.shape)
        vDSP.divide(a.buffer, k, result: &arr.buffer)
        return arr
    }

    // A / B

    public static func divide(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self> {
        var mat = Matrix(like: a)
        vDSP.divide(a.buffer, b.buffer, result: &mat.buffer)
        return mat
    }

    public static func divide(_ a: ShapedArray<Double>, _ b: ShapedArray<Double>) -> ShapedArray<Double> {
        var arr = ShapedArray<Double>(shape: a.shape)
        vDSP.divide(a.buffer, b.buffer, result: &arr.buffer)
        return arr
    }
}
