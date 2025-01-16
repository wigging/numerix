/*
Arithmetic protocol and extensions for the Matrix struct.
*/

import Accelerate

infix operator .* : MultiplicationPrecedence

public protocol Arithmetic {
    static func add(_ a: Matrix<Self>, _ k: Self) -> Matrix<Self>
    static func add(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self>
    static func subtract(_ k: Self, _ a: Matrix<Self>) -> Matrix<Self>
    static func subtract(_ a: Matrix<Self>, _ k: Self) -> Matrix<Self>
    static func subtract(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self>
    static func multiply(_ a: Matrix<Self>, _ k: Self) -> Matrix<Self>
    static func multiply(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self>
    static func matrixMultiply(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self>
}

extension Int: Arithmetic {

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
}

extension Float: Arithmetic {

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
}

extension Double: Arithmetic {

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
}
