/*
Int extension to conform to Arithmetic protocol.
*/

import Accelerate

@_documentation(visibility: private)
extension Int: Arithmetic {
    // A + k
    public static func add(_ a: Complex<Int>, _ k: Int) -> Complex<Int> {
        Complex(a.real + k, a.imaginary)
    }

    public static func add(_ a: Vector<Int>, _ k: Int) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &+ k
        }
        return vec
    }

    public static func add(_ a: Vector<Complex<Int>>, _ k: Int) -> Vector<Complex<Int>> {
        var vec = Vector(like: a)
        for i in 0..<vec.size {
            vec[i] = Complex(a[i].real + k, a[i].imaginary)
        }
        return vec
    }

    public static func add(_ a: Matrix<Int>, _ k: Int) -> Matrix<Int> {
        var mat = Matrix(like: a)
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                mat[i, j] = a[i, j] &+ k
            }
        }
        return mat
    }

    public static func add(_ a: ShapedArray<Int>, _ k: Int) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = k &+ a.buffer[i]
        }
        return arr
    }

    // A + B
    public static func add(_ a: Complex<Int>, _ b: Complex<Int>) -> Complex<Int> {
        Complex(a.real + b.real, a.imaginary + b.imaginary)
    }

    public static func add(_ a: Vector<Int>, _ b: Vector<Int>) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &+ b[i]
        }
        return vec
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

    public static func add(_ a: ShapedArray<Int>, _ b: ShapedArray<Int>) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = a.buffer[i] &+ b.buffer[i]
        }
        return arr
    }

    // k - A
    public static func subtract(_ k: Int, _ a: Vector<Int>) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = k &- a[i]
        }
        return vec
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

    public static func subtract(_ k: Int, _ a: ShapedArray<Int>) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = k &- a.buffer[i]
        }
        return arr
    }

    // A - k
    public static func subtract(_ a: Vector<Int>, _ k: Int) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &- k
        }
        return vec
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

    public static func subtract(_ a: ShapedArray<Int>, _ k: Int) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = a.buffer[i] &- k
        }
        return arr
    }

    // A - B
    public static func subtract(_ a: Vector<Int>, _ b: Vector<Int>) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &- b[i]
        }
        return vec
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

    public static func subtract(_ a: ShapedArray<Int>, _ b: ShapedArray<Int>) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = a.buffer[i] &- b.buffer[i]
        }
        return arr
    }

    // A * k
    public static func multiply(_ a: Vector<Int>, _ k: Int) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &* k
        }
        return vec
    }

    public static func multiply(_ a: Vector<Complex<Int>>, _ k: Int) -> Vector<Complex<Int>> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = Complex(a[i].real * k, a[i].imaginary * k)
        }
        return vec
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

    public static func multiply(_ a: ShapedArray<Int>, _ k: Int) -> ShapedArray<Int> {
        let array = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            array.buffer[i] = k &* a.buffer[i]
        }
        return array
    }

    // A * B
    public static func multiply(_ a: Vector<Int>, _ b: Vector<Int>) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &* b[i]
        }
        return vec
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

    public static func multiply(_ a: ShapedArray<Int>, _ b: ShapedArray<Int>) -> ShapedArray<Int> {
        let array = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            array.buffer[i] = a.buffer[i] &* b.buffer[i]
        }
        return array
    }

    // A x B
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

    // k / A
    public static func divide(_ k: Int, _ a: Vector<Int>) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = k / a[i]
        }
        return vec
    }

    public static func divide(_ k: Int, _ a: Matrix<Int>) -> Matrix<Int> {
        var mat = Matrix(like: a)
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                mat[i, j] = k / a[i, j]
            }
        }
        return mat
    }

    public static func divide(_ k: Int, _ a: ShapedArray<Int>) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = k / a.buffer[i]
        }
        return arr
    }

    // A / k
    public static func divide(_ a: Vector<Int>, _ k: Int) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] / k
        }
        return vec
    }

    public static func divide(_ a: Matrix<Int>, _ k: Int) -> Matrix<Int> {
        var mat = Matrix(like: a)
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                mat[i, j] = a[i, j] / k
            }
        }
        return mat
    }

    public static func divide(_ a: ShapedArray<Int>, _ k: Int) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = a.buffer[i] / k
        }
        return arr
    }

    // A / B
    public static func divide(_ a: Vector<Int>, _ b: Vector<Int>) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] / b[i]
        }
        return vec
    }

    public static func divide(_ a: Matrix<Int>, _ b: Matrix<Int>) -> Matrix<Int> {
        var mat = Matrix(like: a)
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                mat[i, j] = a[i, j] / b[i, j]
            }
        }
        return mat
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
