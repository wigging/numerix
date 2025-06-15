/*
Arithmetic protocol and extensions.
*/

import Accelerate

infix operator .* : MultiplicationPrecedence
infix operator ⊙ : MultiplicationPrecedence

@_documentation(visibility: private)
public protocol Arithmetic {

    static func add(_ a: Vector<Self>, _ k: Self) -> Vector<Self>
    static func add(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self>
    static func subtract(_ k: Self, _ a: Vector<Self>) -> Vector<Self>
    static func subtract(_ a: Vector<Self>, _ k: Self) -> Vector<Self>
    static func subtract(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self>
    static func multiply(_ a: Vector<Self>, _ k: Self) -> Vector<Self>
    static func multiply(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self>
    static func divide(_ k: Self, _ b: Vector<Self>) -> Vector<Self>
    static func divide(_ a: Vector<Self>, _ k: Self) -> Vector<Self>
    static func divide(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self>

    static func add(_ a: Matrix<Self>, _ k: Self) -> Matrix<Self>
    static func add(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self>
    static func subtract(_ k: Self, _ a: Matrix<Self>) -> Matrix<Self>
    static func subtract(_ a: Matrix<Self>, _ k: Self) -> Matrix<Self>
    static func subtract(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self>
    static func multiply(_ a: Matrix<Self>, _ k: Self) -> Matrix<Self>
    static func multiply(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self>
    static func matrixMultiply(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self>
    static func divide(_ k: Self, _ b: Matrix<Self>) -> Matrix<Self>
    static func divide(_ a: Matrix<Self>, _ k: Self) -> Matrix<Self>
    static func divide(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self>

    static func add(_ a: ShapedArray<Self>, _ k: Self) -> ShapedArray<Self>
    static func add(_ a: ShapedArray<Self>, _ b: ShapedArray<Self>) -> ShapedArray<Self>
    static func subtract(_ k: Self, _ a: ShapedArray<Self>) -> ShapedArray<Self>
    static func subtract(_ a: ShapedArray<Self>, _ k: Self) -> ShapedArray<Self>
    static func subtract(_ a: ShapedArray<Self>, _ b: ShapedArray<Self>) -> ShapedArray<Self>
    static func multiply(_ a: ShapedArray<Self>, _ k: Self) -> ShapedArray<Self>
    static func multiply(_ a: ShapedArray<Self>, _ b: ShapedArray<Self>) -> ShapedArray<Self>
    static func divide(_ k: Self, _ b: ShapedArray<Self>) -> ShapedArray<Self>
    static func divide(_ a: ShapedArray<Self>, _ k: Self) -> ShapedArray<Self>
    static func divide(_ a: ShapedArray<Self>, _ b: ShapedArray<Self>) -> ShapedArray<Self>
}

@_documentation(visibility: private)
extension Int: Arithmetic {

    // Vector

    public static func add(_ a: Vector<Int>, _ k: Int) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &+ k
        }
        return vec
    }

    public static func add(_ a: Vector<Int>, _ b: Vector<Int>) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &+ b[i]
        }
        return vec
    }

    public static func subtract(_ k: Int, _ a: Vector<Int>) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = k &- a[i]
        }
        return vec
    }

    public static func subtract(_ a: Vector<Int>, _ k: Int) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &- k
        }
        return vec
    }

    public static func subtract(_ a: Vector<Int>, _ b: Vector<Int>) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &- b[i]
        }
        return vec
    }

    public static func multiply(_ a: Vector<Int>, _ k: Int) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &* k
        }
        return vec
    }

    public static func multiply(_ a: Vector<Int>, _ b: Vector<Int>) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &* b[i]
        }
        return vec
    }

    public static func divide(_ k: Self, _ b: Vector<Self>) -> Vector<Self> {
        var vec = Vector(like: b)
        for i in 0..<b.size {
            vec[i] = k / b[i]
        }
        return vec
    }

    public static func divide(_ a: Vector<Self>, _ k: Self) -> Vector<Self> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] / k
        }
        return vec
    }

    public static func divide(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] / b[i]
        }
        return vec
    }

    // Matrix

    public static func add(_ a: Matrix<Int>, _ k: Int) -> Matrix<Int> {
        var mat = Matrix(like: a)
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                mat[i, j] = a[i, j] &+ k
            }
        }
        return mat
    }

    public static func add(_ a: Matrix<Int>, _ b: Matrix<Int>) -> Matrix<Int> {
        var mat = Matrix(like: a)
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                mat[i, j] = a[i, j] &+ b[i, j]
            }
        }
        return mat
    }

    public static func subtract(_ k: Int, _ a: Matrix<Int>) -> Matrix<Int> {
        var mat = Matrix(like: a)
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                mat[i, j] = k &- a[i, j]
            }
        }
        return mat
    }

    public static func subtract(_ a: Matrix<Int>, _ k: Int) -> Matrix<Int> {
        var mat = Matrix(like: a)
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                mat[i, j] = a[i, j] &- k
            }
        }
        return mat
    }

    public static func subtract(_ a: Matrix<Int>, _ b: Matrix<Int>) -> Matrix<Int> {
        var mat = Matrix(like: a)
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                mat[i, j] = a[i, j] &- b[i, j]
            }
        }
        return mat
    }

    public static func multiply(_ a: Matrix<Int>, _ k: Int) -> Matrix<Int> {
        var mat = Matrix(like: a)
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                mat[i, j] = a[i, j] &* k
            }
        }
        return mat
    }

    public static func multiply(_ a: Matrix<Int>, _ b: Matrix<Int>) -> Matrix<Int> {
        var mat = Matrix(like: a)
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                mat[i, j] = a[i, j] &* b[i, j]
            }
        }
        return mat
    }

    public static func matrixMultiply(_ a: Matrix<Int>, _ b: Matrix<Int>) -> Matrix<Int> {
        precondition(a.columns == b.rows, "Number of columns in matrix A must equal number of rows in matrix B")
        var mat = Matrix<Int>(rows: a.rows, columns: b.columns)
        for i in 0..<a.rows {
            for j in 0..<b.columns {
                for k in 0..<a.columns {
                    mat[i, j] += a[i, k] * b[k, j]
                }
            }
        }
        return mat
    }

    public static func divide(_ k: Self, _ b: Matrix<Self>) -> Matrix<Self> {
        var mat = Matrix(like: b)
        for i in 0..<b.rows {
            for j in 0..<b.columns {
                mat[i, j] = k / b[i, j]
            }
        }
        return mat
    }

    public static func divide(_ a: Matrix<Self>, _ k: Self) -> Matrix<Self> {
        var mat = Matrix(like: a)
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                mat[i, j] = a[i, j] / k
            }
        }
        return mat
    }

    public static func divide(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self> {
        var mat = Matrix(like: a)
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                mat[i, j] = a[i, j] / b[i, j]
            }
        }
        return mat
    }

    // ShapedArray

    public static func add(_ a: ShapedArray<Int>, _ k: Int) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = k &+ a.buffer[i]
        }
        return arr
    }

    public static func add(_ a: ShapedArray<Int>, _ b: ShapedArray<Int>) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = a.buffer[i] &+ b.buffer[i]
        }
        return arr
    }

    public static func subtract(_ k: Int, _ b: ShapedArray<Int>) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: b.shape)
        let count = b.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = k &- b.buffer[i]
        }
        return arr
    }

    public static func subtract(_ a: ShapedArray<Int>, _ k: Int) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = a.buffer[i] &- k
        }
        return arr
    }

    public static func subtract(_ a: ShapedArray<Int>, _ b: ShapedArray<Int>) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = a.buffer[i] &- b.buffer[i]
        }
        return arr
    }

    public static func multiply(_ a: ShapedArray<Int>, _ k: Int) -> ShapedArray<Int> {
        let array = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            array.buffer[i] = k &* a.buffer[i]
        }
        return array
    }

    public static func multiply(_ a: ShapedArray<Int>, _ b: ShapedArray<Int>) -> ShapedArray<Int> {
        let array = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            array.buffer[i] = a.buffer[i] &* b.buffer[i]
        }
        return array
    }

    public static func divide(_ k: Int, _ b: ShapedArray<Int>) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: b.shape)
        let count = b.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = k / b.buffer[i]
        }
        return arr
    }

    public static func divide(_ a: ShapedArray<Int>, _ k: Int) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = a.buffer[i] / k
        }
        return arr
    }

    public static func divide(_ a: ShapedArray<Int>, _ b: ShapedArray<Int>) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = a.buffer[i] / b.buffer[i]
        }
        return arr
    }
}

@_documentation(visibility: private)
extension Float: Arithmetic {

    // Vector

    public static func add(_ a: Vector<Float>, _ k: Float) -> Vector<Float> {
        var vec = Vector(like: a)
        vDSP.add(k, a.buffer, result: &vec.buffer)
        return vec
    }

    public static func add(_ a: Vector<Float>, _ b: Vector<Float>) -> Vector<Float> {
        var vec = Vector(like: a)
        vDSP.add(a.buffer, b.buffer, result: &vec.buffer)
        return vec
    }

    public static func subtract(_ k: Float, _ a: Vector<Float>) -> Vector<Float> {
        let arr = Array(repeating: k, count: a.size)
        var res = Vector(like: a)
        vDSP.subtract(arr, a.buffer, result: &res.buffer)
        return res
    }

    public static func subtract(_ a: Vector<Float>, _ k: Float) -> Vector<Float> {
        let arr = Array(repeating: k, count: a.size)
        var res = Vector(like: a)
        vDSP.subtract(a.buffer, arr, result: &res.buffer)
        return res
    }

    public static func subtract(_ a: Vector<Float>, _ b: Vector<Float>) -> Vector<Float> {
        var res = Vector(like: a)
        vDSP.subtract(a.buffer, b.buffer, result: &res.buffer)
        return res
    }

    public static func multiply(_ a: Vector<Float>, _ k: Float) -> Vector<Float> {
        var vec = Vector(like: a)
        vDSP.multiply(k, a.buffer, result: &vec.buffer)
        return vec
    }

    public static func multiply(_ a: Vector<Float>, _ b: Vector<Float>) -> Vector<Float> {
        var vec = Vector(like: a)
        vDSP.multiply(a.buffer, b.buffer, result: &vec.buffer)
        return vec
    }

    public static func divide(_ k: Self, _ b: Vector<Self>) -> Vector<Self> {
        var vec = Vector(like: b)
        for i in 0..<b.size {
            vec[i] = k / b[i]
        }
        return vec
    }

    public static func divide(_ a: Vector<Self>, _ k: Self) -> Vector<Self> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] / k
        }
        return vec
    }

    public static func divide(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] / b[i]
        }
        return vec
    }

    // Matrix

    public static func add(_ a: Matrix<Float>, _ k: Float) -> Matrix<Float> {
        var mat = Matrix(like: a)
        vDSP.add(k, a.buffer, result: &mat.buffer)
        return mat
    }

    public static func add(_ a: Matrix<Float>, _ b: Matrix<Float>) -> Matrix<Float> {
        var mat = Matrix(like: a)
        vDSP.add(a.buffer, b.buffer, result: &mat.buffer)
        return mat
    }

    public static func subtract(_ k: Float, _ a: Matrix<Float>) -> Matrix<Float> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var mat = Matrix(like: a)
        vDSP.subtract(arr, a.buffer, result: &mat.buffer)
        return mat
    }

    public static func subtract(_ a: Matrix<Float>, _ k: Float) -> Matrix<Float> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var mat = Matrix(like: a)
        vDSP.subtract(a.buffer, arr, result: &mat.buffer)
        return mat
    }

    public static func subtract(_ a: Matrix<Float>, _ b: Matrix<Float>) -> Matrix<Float> {
        var mat = Matrix(like: a)
        vDSP.subtract(a.buffer, b.buffer, result: &mat.buffer)
        return mat
    }

    public static func multiply(_ a: Matrix<Float>, _ k: Float) -> Matrix<Float> {
        var mat = Matrix(like: a)
        vDSP.multiply(k, a.buffer, result: &mat.buffer)
        return mat
    }

    public static func multiply(_ a: Matrix<Float>, _ b: Matrix<Float>) -> Matrix<Float> {
        var mat = Matrix(like: a)
        vDSP.multiply(a.buffer, b.buffer, result: &mat.buffer)
        return mat
    }

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

    public static func divide(_ k: Self, _ b: Matrix<Self>) -> Matrix<Self> {
        var mat = Matrix(like: b)
        vDSP.divide(k, b.buffer, result: &mat.buffer)
        return mat
    }

    public static func divide(_ a: Matrix<Self>, _ k: Self) -> Matrix<Self> {
        var mat = Matrix(like: a)
        vDSP.divide(a.buffer, k, result: &mat.buffer)
        return mat
    }

    public static func divide(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self> {
        var mat = Matrix(like: a)
        vDSP.divide(a.buffer, b.buffer, result: &mat.buffer)
        return mat
    }

    // ShapedArray

    public static func add(_ a: ShapedArray<Float>, _ k: Float) -> ShapedArray<Float> {
        var arr = ShapedArray<Float>(shape: a.shape)
        vDSP.add(k, a.buffer, result: &arr.buffer)
        return arr
    }

    public static func add(_ a: ShapedArray<Float>, _ b: ShapedArray<Float>) -> ShapedArray<Float> {
        var arr = ShapedArray<Float>(shape: a.shape)
        vDSP.add(a.buffer, b.buffer, result: &arr.buffer)
        return arr
    }

    public static func subtract(_ k: Float, _ a: ShapedArray<Float>) -> ShapedArray<Float> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var result = ShapedArray<Float>(shape: a.shape)
        vDSP.subtract(arr, a.buffer, result: &result.buffer)
        return result
    }

    public static func subtract(_ a: ShapedArray<Float>, _ k: Float) -> ShapedArray<Float> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var result = ShapedArray<Float>(shape: a.shape)
        vDSP.subtract(arr, a.buffer, result: &result.buffer)
        return result
    }

    public static func subtract(_ a: ShapedArray<Float>, _ b: ShapedArray<Float>) -> ShapedArray<Float> {
        precondition(a.shape == b.shape, "Shaped arrays must have same shape")
        var result = ShapedArray<Float>(shape: a.shape)
        vDSP.subtract(a.buffer, b.buffer, result: &result.buffer)
        return result
    }

    public static func multiply(_ a: ShapedArray<Float>, _ k: Float) -> ShapedArray<Float> {
        var array = ShapedArray<Float>(shape: a.shape)
        vDSP.multiply(k, a.buffer, result: &array.buffer)
        return array
    }

    public static func multiply(_ a: ShapedArray<Float>, _ b: ShapedArray<Float>) -> ShapedArray<Float> {
        var array = ShapedArray<Float>(shape: a.shape)
        vDSP.multiply(a.buffer, b.buffer, result: &array.buffer)
        return array
    }

    public static func divide(_ k: Float, _ b: ShapedArray<Float>) -> ShapedArray<Float> {
        var arr = ShapedArray<Float>(shape: b.shape)
        vDSP.divide(k, b.buffer, result: &arr.buffer)
        return arr
    }

    public static func divide(_ a: ShapedArray<Float>, _ k: Float) -> ShapedArray<Float> {
        var arr = ShapedArray<Float>(shape: a.shape)
        vDSP.divide(a.buffer, k, result: &arr.buffer)
        return arr
    }

    public static func divide(_ a: ShapedArray<Float>, _ b: ShapedArray<Float>) -> ShapedArray<Float> {
        var arr = ShapedArray<Float>(shape: a.shape)
        vDSP.divide(a.buffer, b.buffer, result: &arr.buffer)
        return arr
    }
}

@_documentation(visibility: private)
extension Double: Arithmetic {

    // Vector

    public static func add(_ a: Vector<Double>, _ k: Double) -> Vector<Double> {
        var vec = Vector(like: a)
        vDSP.add(k, a.buffer, result: &vec.buffer)
        return vec
    }

    public static func add(_ a: Vector<Double>, _ b: Vector<Double>) -> Vector<Double> {
        var vec = Vector(like: a)
        vDSP.add(a.buffer, b.buffer, result: &vec.buffer)
        return vec
    }

    public static func subtract(_ k: Double, _ a: Vector<Double>) -> Vector<Double> {
        let arr = Array(repeating: k, count: a.size)
        var res = Vector(like: a)
        vDSP.subtract(arr, a.buffer, result: &res.buffer)
        return res
    }

    public static func subtract(_ a: Vector<Double>, _ k: Double) -> Vector<Double> {
        let arr = Array(repeating: k, count: a.size)
        var res = Vector(like: a)
        vDSP.subtract(a.buffer, arr, result: &res.buffer)
        return res
    }

    public static func subtract(_ a: Vector<Double>, _ b: Vector<Double>) -> Vector<Double> {
        var res = Vector(like: a)
        vDSP.subtract(a.buffer, b.buffer, result: &res.buffer)
        return res
    }

    public static func multiply(_ a: Vector<Double>, _ k: Double) -> Vector<Double> {
        var vec = Vector(like: a)
        vDSP.multiply(k, a.buffer, result: &vec.buffer)
        return vec
    }

    public static func multiply(_ a: Vector<Double>, _ b: Vector<Double>) -> Vector<Double> {
        var vec = Vector(like: a)
        vDSP.multiply(a.buffer, b.buffer, result: &vec.buffer)
        return vec
    }

    public static func divide(_ k: Self, _ b: Vector<Self>) -> Vector<Self> {
        var vec = Vector(like: b)
        for i in 0..<b.size {
            vec[i] = k / b[i]
        }
        return vec
    }

    public static func divide(_ a: Vector<Self>, _ k: Self) -> Vector<Self> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] / k
        }
        return vec
    }

    public static func divide(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] / b[i]
        }
        return vec
    }

    // Matrix

    public static func add(_ a: Matrix<Double>, _ k: Double) -> Matrix<Double> {
        var mat = Matrix(like: a)
        vDSP.add(k, a.buffer, result: &mat.buffer)
        return mat
    }

    public static func add(_ a: Matrix<Double>, _ b: Matrix<Double>) -> Matrix<Double> {
        var mat = Matrix(like: a)
        vDSP.add(a.buffer, b.buffer, result: &mat.buffer)
        return mat
    }

    public static func subtract(_ k: Double, _ a: Matrix<Double>) -> Matrix<Double> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var mat = Matrix(like: a)
        vDSP.subtract(arr, a.buffer, result: &mat.buffer)
        return mat
    }

    public static func subtract(_ a: Matrix<Double>, _ k: Double) -> Matrix<Double> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var mat = Matrix(like: a)
        vDSP.subtract(a.buffer, arr, result: &mat.buffer)
        return mat
    }

    public static func subtract(_ a: Matrix<Double>, _ b: Matrix<Double>) -> Matrix<Double> {
        var mat = Matrix(like: a)
        vDSP.subtract(a.buffer, b.buffer, result: &mat.buffer)
        return mat
    }

    public static func multiply(_ a: Matrix<Double>, _ k: Double) -> Matrix<Double> {
        var mat = Matrix(like: a)
        vDSP.multiply(k, a.buffer, result: &mat.buffer)
        return mat
    }

    public static func multiply(_ a: Matrix<Double>, _ b: Matrix<Double>) -> Matrix<Double> {
        var mat = Matrix(like: a)
        vDSP.multiply(a.buffer, b.buffer, result: &mat.buffer)
        return mat
    }

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

    public static func divide(_ k: Self, _ b: Matrix<Self>) -> Matrix<Self> {
        var mat = Matrix(like: b)
        vDSP.divide(k, b.buffer, result: &mat.buffer)
        return mat
    }

    public static func divide(_ a: Matrix<Self>, _ k: Self) -> Matrix<Self> {
        var mat = Matrix(like: a)
        vDSP.divide(a.buffer, k, result: &mat.buffer)
        return mat
    }

    public static func divide(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self> {
        var mat = Matrix(like: a)
        vDSP.divide(a.buffer, b.buffer, result: &mat.buffer)
        return mat
    }

    // ShapedArray

    public static func add(_ a: ShapedArray<Double>, _ k: Double) -> ShapedArray<Double> {
        var arr = ShapedArray<Double>(shape: a.shape)
        vDSP.add(k, a.buffer, result: &arr.buffer)
        return arr
    }

    public static func add(_ a: ShapedArray<Double>, _ b: ShapedArray<Double>) -> ShapedArray<Double> {
        var arr = ShapedArray<Double>(shape: a.shape)
        vDSP.add(a.buffer, b.buffer, result: &arr.buffer)
        return arr
    }

    public static func subtract(_ k: Double, _ a: ShapedArray<Double>) -> ShapedArray<Double> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var result = ShapedArray<Double>(shape: a.shape)
        vDSP.subtract(arr, a.buffer, result: &result.buffer)
        return result
    }

    public static func subtract(_ a: ShapedArray<Double>, _ k: Double) -> ShapedArray<Double> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var result = ShapedArray<Double>(shape: a.shape)
        vDSP.subtract(arr, a.buffer, result: &result.buffer)
        return result
    }

    public static func subtract(_ a: ShapedArray<Double>, _ b: ShapedArray<Double>) -> ShapedArray<Double> {
        precondition(a.shape == b.shape, "Shaped arrays must have same shape")
        var result = ShapedArray<Double>(shape: a.shape)
        vDSP.subtract(a.buffer, b.buffer, result: &result.buffer)
        return result
    }

    public static func multiply(_ a: ShapedArray<Double>, _ k: Double) -> ShapedArray<Double> {
        var array = ShapedArray<Double>(shape: a.shape)
        vDSP.multiply(k, a.buffer, result: &array.buffer)
        return array
    }

    public static func multiply(_ a: ShapedArray<Double>, _ b: ShapedArray<Double>) -> ShapedArray<Double> {
        var array = ShapedArray<Double>(shape: a.shape)
        vDSP.multiply(a.buffer, b.buffer, result: &array.buffer)
        return array
    }

    public static func divide(_ k: Double, _ b: ShapedArray<Double>) -> ShapedArray<Double> {
        var arr = ShapedArray<Double>(shape: b.shape)
        vDSP.divide(k, b.buffer, result: &arr.buffer)
        return arr
    }

    public static func divide(_ a: ShapedArray<Double>, _ k: Double) -> ShapedArray<Double> {
        var arr = ShapedArray<Double>(shape: a.shape)
        vDSP.divide(a.buffer, k, result: &arr.buffer)
        return arr
    }

    public static func divide(_ a: ShapedArray<Double>, _ b: ShapedArray<Double>) -> ShapedArray<Double> {
        var arr = ShapedArray<Double>(shape: a.shape)
        vDSP.divide(a.buffer, b.buffer, result: &arr.buffer)
        return arr
    }
}

extension Vector where Scalar: Arithmetic {

    /// Element-wise addition of a scalar and vector using real numbers.
    /// - Parameters:
    ///   - lhs: Left-hand side scalar value.
    ///   - rhs: Right-hand side vector.
    /// - Returns: Element-wise sum of a scalar and vector.
    public static func + (lhs: Scalar, rhs: Vector) -> Vector {
        Scalar.add(rhs, lhs)
    }

    public static func + (lhs: Vector, rhs: Scalar) -> Vector {
        Scalar.add(lhs, rhs)
    }

    public static func + (lhs: Vector, rhs: Vector) -> Vector {
        Scalar.add(lhs, rhs)
    }

    public static func += (lhs: inout Vector, rhs: Vector) {
        lhs = lhs + rhs
    }

    public static func - (lhs: Scalar, rhs: Vector) -> Vector {
        Scalar.subtract(lhs, rhs)
    }

    public static func - (lhs: Vector, rhs: Scalar) -> Vector {
        Scalar.subtract(lhs, rhs)
    }

    public static func - (lhs: Vector, rhs: Vector) -> Vector {
        Scalar.subtract(lhs, rhs)
    }

    public static func * (lhs: Scalar, rhs: Vector) -> Vector {
        Scalar.multiply(rhs, lhs)
    }

    public static func * (lhs: Vector, rhs: Scalar) -> Vector {
        Scalar.multiply(lhs, rhs)
    }

    public static func * (lhs: Vector, rhs: Vector) -> Vector {
        Scalar.multiply(lhs, rhs)
    }

    public static func *= (lhs: inout Vector, rhs: Scalar) {
        lhs = lhs * rhs
    }

    public static func / (lhs: Scalar, rhs: Vector) -> Vector {
        Scalar.divide(lhs, rhs)
    }

    public static func / (lhs: Vector, rhs: Scalar) -> Vector {
        Scalar.divide(lhs, rhs)
    }

    public static func / (lhs: Vector, rhs: Vector) -> Vector {
        Scalar.divide(lhs, rhs)
    }
}

extension Matrix where Scalar: Arithmetic {

    /// Element-wise addition of a scalar value and matrix.
    /// - Parameters:
    ///   - lhs: The left-hand side scalar value.
    ///   - rhs: The right-hand side matrix.
    /// - Returns: Element-wise sum of a scalar value and matrix.
    public static func + (lhs: Scalar, rhs: Matrix) -> Matrix {
        Scalar.add(rhs, lhs)
    }

    public static func + (lhs: Matrix, rhs: Scalar) -> Matrix {
        Scalar.add(lhs, rhs)
    }

    public static func + (lhs: Matrix, rhs: Matrix) -> Matrix {
        Scalar.add(lhs, rhs)
    }

    public static func += (lhs: inout Matrix, rhs: Matrix) {
        lhs = lhs + rhs
    }

    public static func - (lhs: Scalar, rhs: Matrix) -> Matrix {
        Scalar.subtract(lhs, rhs)
    }

    public static func - (lhs: Matrix, rhs: Scalar) -> Matrix {
        Scalar.subtract(lhs, rhs)
    }

    public static func - (lhs: Matrix, rhs: Matrix) -> Matrix {
        Scalar.subtract(lhs, rhs)
    }

    /// Matrix multiplication of two matrices.
    /// - Parameters:
    ///   - lhs: The left-hand side matrix.
    ///   - rhs: The right-hand side matrix.
    /// - Returns: Matrix product of the two matrices.
    public static func * (lhs: Matrix, rhs: Matrix) -> Matrix {
        Scalar.matrixMultiply(lhs, rhs)
    }

    /// Element-wise multiplication of a scalar value and matrix.
    /// - Parameters:
    ///   - lhs: The left-hand side scalar value.
    ///   - rhs: The right-hand side matrix.
    /// - Returns: Element-wise product of a scalar value and matrix.
    public static func .* (lhs: Scalar, rhs: Matrix) -> Matrix {
        Scalar.multiply(rhs, lhs)
    }

    public static func .* (lhs: Matrix, rhs: Scalar) -> Matrix {
        Scalar.multiply(lhs, rhs)
    }

    public static func .* (lhs: Matrix, rhs: Matrix) -> Matrix {
        Scalar.multiply(lhs, rhs)
    }

    /// Element-wise matrix multiplication of two matrices.
    ///
    /// Matrices must have same dimensions m × n. This is also known as the Hadamard product or Schur product.
    ///
    /// - Parameters:
    ///   - lhs: Left matrix with dimension of m × n.
    ///   - rhs: Right matrix with dimension m × n.
    /// - Returns: Element-wise matrix product with same dimensions as input matrices.
    public static func ⊙ (lhs: Matrix, rhs: Matrix) -> Matrix {
        precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must have same dimensions")
        return Scalar.multiply(lhs, rhs)
    }

    public static func / (lhs: Scalar, rhs: Matrix) -> Matrix {
        Scalar.divide(lhs, rhs)
    }

    public static func / (lhs: Matrix, rhs: Scalar) -> Matrix {
        Scalar.divide(lhs, rhs)
    }

    public static func / (lhs: Matrix, rhs: Matrix) -> Matrix {
        Scalar.divide(lhs, rhs)
    }
}

extension ShapedArray where Scalar: Arithmetic {

    /// Element-wise addition of a scalar and shaped array.
    /// - Parameters:
    ///   - lhs: The left-hand side scalar value `k`.
    ///   - rhs: The right-hand side shaped array `A`.
    /// - Returns: A shaped array that is the result of `k + A`.
    public static func + (lhs: Scalar, rhs: ShapedArray) -> ShapedArray {
        Scalar.add(rhs, lhs)
    }

    /// Element-wise addition of a scalar and shaped array.
    /// - Parameters:
    ///   - lhs: The left-hand side shaped array `A`.
    ///   - rhs: The right-hand side scalar value `k`.
    /// - Returns: A shaped array that is the result of `A + k`.
    public static func + (lhs: ShapedArray, rhs: Scalar) -> ShapedArray {
        Scalar.add(lhs, rhs)
    }

    /// Element-wise addition of two shaped arrays.
    /// - Parameters:
    ///   - lhs: The left-hand side shaped array `A`.
    ///   - rhs: The right-hand side shaped array `B`.
    /// - Returns: A shaped array that is the result of `A + B`.
    public static func + (lhs: ShapedArray, rhs: ShapedArray) -> ShapedArray {
        Scalar.add(lhs, rhs)
    }

    /// In-place element-wise addition of a shaped array and scalar.
    /// - Parameters:
    ///   - left: The left-hand side mutable shaped array.
    ///   - right: The right-hand side scalar value.
    public static func += (left: inout ShapedArray, right: Scalar) {
        left = left + right
    }

    /// In-place element-wise addition of two shaped arrays.
    /// - Parameters:
    ///   - left: The left-hand side mutable input shaped array.
    ///   - right: The right-hand side shaped array to add to the left-hand side mutable shaped array.
    public static func += (left: inout ShapedArray, right: ShapedArray) {
        precondition(left.shape == right.shape, "Shaped arrays must have same shape")
        left = left + right
    }

    /// Element-wise subtraction of a scalar and shaped array.
    /// - Parameters:
    ///   - lhs: The left-hand side scalar value `k`.
    ///   - rhs: The right-hand side shaped array `A`.
    /// - Returns: A shaped array that is the result of `k - A`.
    public static func - (lhs: Scalar, rhs: ShapedArray) -> ShapedArray {
        Scalar.subtract(lhs, rhs)
    }

    /// Element-wise subtraction of a scalar and shaped array.
    /// - Parameters:
    ///   - lhs: The left-hand side shaped array `A`.
    ///   - rhs: The right-hand side scalar value `k`.
    /// - Returns: A shaped array that is the result of `A - k`.
    public static func - (lhs: ShapedArray, rhs: Scalar) -> ShapedArray {
        Scalar.subtract(lhs, rhs)
    }

    /// Element-wise subtraction of two shaped arrays.
    /// - Parameters:
    ///   - lhs: The left-hand side shaped array `A`.
    ///   - rhs: The right-hand side shaped array `B`.
    /// - Returns: A shaped array that is the result of `A + B`.
    public static func - (lhs: ShapedArray, rhs: ShapedArray) -> ShapedArray {
        Scalar.subtract(lhs, rhs)
    }

    /// Element-wise multiplication of a scalar value and a shaped array.
    /// - Parameters:
    ///   - lhs: The input scalar value `k` on the left-hand side.
    ///   - rhs: The input shaped array `A` on the right-hand side.
    /// - Returns: The output shaped array `B` where `k * A = B`.
    public static func * (lhs: Scalar, rhs: ShapedArray) -> ShapedArray {
        Scalar.multiply(rhs, lhs)
    }

    /// Element-wise multiplication of a shaped array and a scalar value.
    /// - Parameters:
    ///   - lhs: The input shaped array `A` on the left-hand side.
    ///   - rhs: The input scalar value `k` on the right-hand side.
    /// - Returns: The output shaped array `B` where `k * A = B`.
    public static func * (lhs: ShapedArray, rhs: Scalar) -> ShapedArray {
        Scalar.multiply(lhs, rhs)
    }

    /// Element-wise multiplication of two shaped arrays.
    /// - Parameters:
    ///   - lhs: The input shaped array `A` on the left-hand side.
    ///   - rhs: The input shaped array `B` on the right-hand side.
    /// - Returns: The output shaped array `C` where `A * B = C`.
    public static func * (lhs: ShapedArray, rhs: ShapedArray) -> ShapedArray {
        Scalar.multiply(lhs, rhs)
    }

    /// Element-wise division operator for dividing a scalar by a shaped array.
    /// - Parameters:
    ///   - lhs: The scalar value.
    ///   - rhs: The shaped array.
    /// - Returns: The element-wise division of a scalar by a shaped array.
    public static func / (lhs: Scalar, rhs: ShapedArray) -> ShapedArray {
        Scalar.divide(lhs, rhs)
    }

    /// Element-wise division operator for dividing a scalar by a shaped array.
    /// - Parameters:
    ///   - lhs: The shaped array.
    ///   - rhs: The scalar value.
    /// - Returns: The element-wise division of a scalar by a shaped array.
    public static func / (lhs: ShapedArray, rhs: Scalar) -> ShapedArray {
        Scalar.divide(lhs, rhs)
    }

    /// Element-wise division operator for dividing two shaped arrays. Shaped
    /// arrays must have the same shape.
    /// - Parameters:
    ///   - lhs: The left shaped array.
    ///   - rhs: The right shaped array.
    /// - Returns: The element-wise division of two shaped arrays.
    public static func / (lhs: ShapedArray, rhs: ShapedArray) -> ShapedArray {
        Scalar.divide(lhs, rhs)
    }

    /// In-place element-wise division of a shaped array and scalar.
    /// - Parameters:
    ///   - lhs: The left-hand side mutable shaped array.
    ///   - rhs: The right-hand side scalar value.
    public static func /= (lhs: inout ShapedArray, rhs: Scalar) {
        lhs = lhs / rhs
    }

    /// In-place element-wise division of two shaped arrays.
    /// - Parameters:
    ///   - lhs: The left-hand side mutable shaped array.
    ///   - rhs: The right-hand side shaped array.
    public static func /= (lhs: inout ShapedArray, rhs: ShapedArray) {
        precondition(lhs.shape == rhs.shape, "Shaped arrays must have the same shape")
        lhs = lhs / rhs
    }
}
