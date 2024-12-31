/*
 Matrix algebra protocol.
 */

import Accelerate

public protocol MatrixAlgebra {
    static func norm(_ a: Matrix<Self>) -> Self
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
}

extension Float: MatrixAlgebra {

    public static func norm(_ a: Matrix<Float>) -> Float {
        cblas_snrm2(a.buffer.count, a.buffer.baseAddress, 1)
    }
}

extension Double: MatrixAlgebra {

    public static func norm(_ a: Matrix<Double>) -> Double {
        cblas_dnrm2(a.buffer.count, a.buffer.baseAddress, 1)
    }
}
