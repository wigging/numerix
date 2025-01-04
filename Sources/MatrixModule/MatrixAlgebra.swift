/*
 Matrix algebra protocol.
 */

import Accelerate

public protocol MatrixAlgebra {
    static func norm(_ a: Matrix<Self>) -> Self
    static func scale(_ a: inout Matrix<Self>, by k: Self)
    static func transpose(_ a: Matrix<Self>) -> Matrix<Self>
}

extension Int: MatrixAlgebra {

    public static func norm(_ a: Matrix<Int>) -> Int {
        var sumOfSquares = 0
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                sumOfSquares &+= a[i, j] * a[i, j]
            }
        }
        let result = sqrt(Float(sumOfSquares))
        return Int(result)
    }

    public static func scale(_ a: inout Matrix<Int>, by k: Int) {
        a = a .* k
    }

    public static func transpose(_ a: Matrix<Int>) -> Matrix<Int> {
        var transposed = Matrix<Int>(rows: a.columns, columns: a.rows)
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                transposed[j, i] = a[i, j]
            }
        }
        return transposed
    }
}

extension Float: MatrixAlgebra {

    public static func norm(_ a: Matrix<Float>) -> Float {
        cblas_snrm2(a.buffer.count, a.buffer.baseAddress, 1)
    }

    public static func scale(_ a: inout Matrix<Float>, by k: Float) {
        cblas_sscal(a.rows * a.columns, k, a.buffer.baseAddress, 1)
    }

    public static func transpose(_ a: Matrix<Float>) -> Matrix<Float> {
        let m = vDSP_Length(a.columns)
        let n = vDSP_Length(a.rows)
        let mat = Matrix<Float>(rows: a.columns, columns: a.rows)
        vDSP_mtrans(a.buffer.baseAddress!, 1, mat.buffer.baseAddress!, 1, m, n)
        return mat
    }
}

extension Double: MatrixAlgebra {

    public static func norm(_ a: Matrix<Double>) -> Double {
        cblas_dnrm2(a.buffer.count, a.buffer.baseAddress, 1)
    }

    public static func scale(_ a: inout Matrix<Double>, by k: Double) {
        cblas_dscal(a.rows * a.columns, k, a.buffer.baseAddress, 1)
    }

    public static func transpose(_ a: Matrix<Double>) -> Matrix<Double> {
        let m = vDSP_Length(a.columns)
        let n = vDSP_Length(a.rows)
        let mat = Matrix<Double>(rows: a.columns, columns: a.rows)
        vDSP_mtransD(a.buffer.baseAddress!, 1, mat.buffer.baseAddress!, 1, m, n)
        return mat
    }
}
