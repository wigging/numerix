/*
 Matrix arithmetic protocol.
 */

public protocol MatrixArithmetic {
    static func add(_ a: Matrix<Self>, _ k: Self) -> Matrix<Self>
    static func add(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self>
}

extension Int: MatrixArithmetic {

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
}
