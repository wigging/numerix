/*
Integer extension to conform to Algebra protocol.
*/

import Accelerate

@_documentation(visibility: private)
extension Int: Algebra {

    public static func absoluteSum(a: Vector<Int>) -> Int {
        var res = Int.zero
        for i in 0..<a.size {
            res += abs(a[i])
        }
        return res
    }

    public static func copy(a: Matrix<Int>, b: Matrix<Int>) {
        fatalError("Not supported for integer matrices")
    }

    public static func copy(a: Vector<Int>, b: Vector<Int>) {
        fatalError("Not supported for integer vectors")
    }

    public static func cumulativeSum(a: Vector<Int>) -> Vector<Int> {
        var cumulative = Vector(like: a)
        var runningTotal = 0
        for i in 0..<a.size {
            runningTotal += a[i]
            cumulative[i] = runningTotal
        }
        return cumulative
    }

    public static func det(a: Matrix<Int>) -> Int {
        fatalError("Determinant of integer matrix is not supported")
    }

    public static func dot(a: Vector<Int>, b: Vector<Int>) -> Int {
        var res = Int.zero
        for (x, y) in zip(a.buffer, b.buffer) {
            res += x * y
        }
        return res
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

    public static func norm(a: Vector<Int>) -> Int {
        var sumOfSquares = 0

        for i in 0..<a.size {
            sumOfSquares &+= a[i] * a[i]
        }

        let result = sqrt(Float(sumOfSquares))
        return Int(result)
    }

    public static func scale(a: inout Matrix<Int>, by k: Int) {
        a = a .* k
    }

    public static func scale(a: inout Vector<Int>, by k: Int) {
        a *= k
    }

    public static func sum(a: Vector<Int>) -> Int {
        var res = Int.zero
        for i in 0..<a.size {
            res += a[i]
        }
        return res
    }

    public static func swapValues(a: inout Matrix<Int>, b: inout Matrix<Int>) {
        precondition(a.rows == b.rows && a.columns == b.columns, "Matrices must have same shape")
        swap(&a, &b)
    }

    public static func swapValues(a: inout Vector<Int>, b: inout Vector<Int>) {
        precondition(a.size == b.size, "Vectors must be same size")
        swap(&a.buffer, &b.buffer)
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

    public static func update(a: inout Vector<Int>, k: Int, b: Vector<Int>) {
        fatalError("Not supported for integer values")
    }
}
