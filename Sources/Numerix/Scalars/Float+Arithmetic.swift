/*
Float extension to conform to Arithmetic protocol.
*/

import Accelerate

@_documentation(visibility: private)
extension Float: Arithmetic {
    // A + k
    public static func add(_ a: Complex<Float>, _ k: Float) -> Complex<Float> {
        Complex(a.real + k, a.imaginary)
    }

    public static func add(_ a: Vector<Float>, _ k: Float) -> Vector<Float> {
        var vec = Vector(like: a)
        vDSP.add(k, a.buffer, result: &vec.buffer)
        return vec
    }

    public static func add(_ a: Vector<Complex<Float>>, _ k: Float) -> Vector<Complex<Float>> {
        var vec = Vector(like: a)
        for i in 0..<vec.size {
            vec[i] = Complex(a[i].real + k, a[i].imaginary)
        }
        return vec
    }

    public static func add(_ a: Matrix<Float>, _ k: Float) -> Matrix<Float> {
        var mat = Matrix(like: a)
        vDSP.add(k, a.buffer, result: &mat.buffer)
        return mat
    }

    public static func add(_ a: ShapedArray<Float>, _ k: Float) -> ShapedArray<Float> {
        var arr = ShapedArray<Float>(shape: a.shape)
        vDSP.add(k, a.buffer, result: &arr.buffer)
        return arr
    }

    // A + B
    public static func add(_ a: Complex<Float>, _ b: Complex<Float>) -> Complex<Float> {
        Complex(a.real + b.real, a.imaginary + b.imaginary)
    }

    public static func add(_ a: Vector<Float>, _ b: Vector<Float>) -> Vector<Float> {
        var vec = Vector(like: a)
        vDSP.add(a.buffer, b.buffer, result: &vec.buffer)
        return vec
    }

    public static func add(_ a: Matrix<Float>, _ b: Matrix<Float>) -> Matrix<Float> {
        var mat = Matrix(like: a)
        vDSP.add(a.buffer, b.buffer, result: &mat.buffer)
        return mat
    }

    public static func add(_ a: ShapedArray<Float>, _ b: ShapedArray<Float>) -> ShapedArray<Float> {
        var arr = ShapedArray<Float>(shape: a.shape)
        vDSP.add(a.buffer, b.buffer, result: &arr.buffer)
        return arr
    }

    // k - A
    public static func subtract(_ k: Float, _ a: Vector<Float>) -> Vector<Float> {
        let arr = Array(repeating: k, count: a.size)
        var res = Vector(like: a)
        vDSP.subtract(arr, a.buffer, result: &res.buffer)
        return res
    }

    public static func subtract(_ k: Float, _ a: Matrix<Float>) -> Matrix<Float> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var mat = Matrix(like: a)
        vDSP.subtract(arr, a.buffer, result: &mat.buffer)
        return mat
    }

    public static func subtract(_ k: Float, _ a: ShapedArray<Float>) -> ShapedArray<Float> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var result = ShapedArray<Float>(shape: a.shape)
        vDSP.subtract(arr, a.buffer, result: &result.buffer)
        return result
    }

    // A - k
    public static func subtract(_ a: Vector<Float>, _ k: Float) -> Vector<Float> {
        let arr = Array(repeating: k, count: a.size)
        var res = Vector(like: a)
        vDSP.subtract(a.buffer, arr, result: &res.buffer)
        return res
    }

    public static func subtract(_ a: Matrix<Float>, _ k: Float) -> Matrix<Float> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var mat = Matrix(like: a)
        vDSP.subtract(a.buffer, arr, result: &mat.buffer)
        return mat
    }

    public static func subtract(_ a: ShapedArray<Float>, _ k: Float) -> ShapedArray<Float> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var result = ShapedArray<Float>(shape: a.shape)
        vDSP.subtract(arr, a.buffer, result: &result.buffer)
        return result
    }

    // A - B
    public static func subtract(_ a: Vector<Float>, _ b: Vector<Float>) -> Vector<Float> {
        var res = Vector(like: a)
        vDSP.subtract(a.buffer, b.buffer, result: &res.buffer)
        return res
    }

    public static func subtract(_ a: Matrix<Float>, _ b: Matrix<Float>) -> Matrix<Float> {
        var mat = Matrix(like: a)
        vDSP.subtract(a.buffer, b.buffer, result: &mat.buffer)
        return mat
    }

    public static func subtract(_ a: ShapedArray<Float>, _ b: ShapedArray<Float>) -> ShapedArray<Float> {
        precondition(a.shape == b.shape, "Shaped arrays must have same shape")
        var result = ShapedArray<Float>(shape: a.shape)
        vDSP.subtract(a.buffer, b.buffer, result: &result.buffer)
        return result
    }

    // A * k
    public static func multiply(_ a: Vector<Float>, _ k: Float) -> Vector<Float> {
        var vec = Vector(like: a)
        vDSP.multiply(k, a.buffer, result: &vec.buffer)
        return vec
    }

    public static func multiply(_ a: Matrix<Float>, _ k: Float) -> Matrix<Float> {
        var mat = Matrix(like: a)
        vDSP.multiply(k, a.buffer, result: &mat.buffer)
        return mat
    }

    public static func multiply(_ a: ShapedArray<Float>, _ k: Float) -> ShapedArray<Float> {
        var array = ShapedArray<Float>(shape: a.shape)
        vDSP.multiply(k, a.buffer, result: &array.buffer)
        return array
    }

    // A * B
    public static func multiply(_ a: Vector<Float>, _ b: Vector<Float>) -> Vector<Float> {
        var vec = Vector(like: a)
        vDSP.multiply(a.buffer, b.buffer, result: &vec.buffer)
        return vec
    }

    public static func multiply(_ a: Vector<Complex<Float>>, _ k: Float) -> Vector<Complex<Float>> {
        let vec = a.copy()
        cblas_csscal(vec.size, k, .init(vec.buffer.baseAddress), 1)
        return vec
    }

    public static func multiply(_ a: Matrix<Float>, _ b: Matrix<Float>) -> Matrix<Float> {
        var mat = Matrix(like: a)
        vDSP.multiply(a.buffer, b.buffer, result: &mat.buffer)
        return mat
    }

    public static func multiply(_ a: ShapedArray<Float>, _ b: ShapedArray<Float>) -> ShapedArray<Float> {
        var array = ShapedArray<Float>(shape: a.shape)
        vDSP.multiply(a.buffer, b.buffer, result: &array.buffer)
        return array
    }

    // A x B
    public static func matrixMultiply(_ a: Matrix<Float>, _ b: Matrix<Float>) -> Matrix<Float> {
        precondition(a.columns == b.rows, "Number of columns in matrix A must equal number of rows in matrix B")

        let m = a.rows     // number of rows in matrices A and C
        let n = b.columns  // number of columns in matrices B and C
        let k = a.columns  // number of columns in matrix A; number of rows in matrix B
        let alpha: Float = 1.0
        let beta: Float = 0.0

        // matrix multiplication where C ← αAB + βC
        let c = Matrix<Float>(rows: a.rows, columns: b.columns)
        cblas_sgemm(
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
    public static func divide(_ k: Float, _ a: Vector<Float>) -> Vector<Float> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = k / a[i]
        }
        return vec
    }

    public static func divide(_ k: Float, _ a: Matrix<Float>) -> Matrix<Float> {
        var mat = Matrix(like: a)
        vDSP.divide(k, a.buffer, result: &mat.buffer)
        return mat
    }

    public static func divide(_ k: Float, _ a: ShapedArray<Float>) -> ShapedArray<Float> {
        var arr = ShapedArray<Float>(shape: a.shape)
        vDSP.divide(k, a.buffer, result: &arr.buffer)
        return arr
    }

    // A / k
    public static func divide(_ a: Vector<Float>, _ k: Float) -> Vector<Float> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] / k
        }
        return vec
    }

    public static func divide(_ a: Matrix<Float>, _ k: Float) -> Matrix<Float> {
        var mat = Matrix(like: a)
        vDSP.divide(a.buffer, k, result: &mat.buffer)
        return mat
    }

    public static func divide(_ a: ShapedArray<Float>, _ k: Float) -> ShapedArray<Float> {
        var arr = ShapedArray<Float>(shape: a.shape)
        vDSP.divide(a.buffer, k, result: &arr.buffer)
        return arr
    }

    // A / B
    public static func divide(_ a: Vector<Float>, _ b: Vector<Float>) -> Vector<Float> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] / b[i]
        }
        return vec
    }

    public static func divide(_ a: Matrix<Float>, _ b: Matrix<Float>) -> Matrix<Float> {
        var mat = Matrix(like: a)
        vDSP.divide(a.buffer, b.buffer, result: &mat.buffer)
        return mat
    }

    public static func divide(_ a: ShapedArray<Float>, _ b: ShapedArray<Float>) -> ShapedArray<Float> {
        var arr = ShapedArray<Float>(shape: a.shape)
        vDSP.divide(a.buffer, b.buffer, result: &arr.buffer)
        return arr
    }
}
