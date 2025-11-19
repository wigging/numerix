/*
Matrix pad protocol and associated extensions.
*/

import Accelerate

@_documentation(visibility: private)
public protocol MatrixPad {
    static func pad(a: Matrix<Self>, top: Int, bottom: Int, left: Int, right: Int, value: Self) -> Matrix<Self>
}

@_documentation(visibility: private)
extension Double: MatrixPad {

    public static func pad(
        a: Matrix<Double>, top: Int, bottom: Int, left: Int, right: Int, value: Double
    ) -> Matrix<Double> {
        let newRows = a.rows + top + bottom
        let newCols = a.columns + left + right
        let offset = top * newCols + left

        let m = a.columns   // number of columns to move
        let n = a.rows      // number of rows to move
        let ta = a.columns  // stride between rows in source
        let tc = newCols    // stride between rows in destination

        let c = Matrix(rows: newRows, columns: newCols, fill: value)

        vDSP_mmovD(
            a.buffer.baseAddress!,
            c.buffer.baseAddress!.advanced(by: offset),
            vDSP_Length(m),
            vDSP_Length(n),
            vDSP_Length(ta),
            vDSP_Length(tc)
        )

        return c
    }
}

@_documentation(visibility: private)
extension Float: MatrixPad {

    public static func pad(
        a: Matrix<Float>, top: Int, bottom: Int, left: Int, right: Int, value: Float
    ) -> Matrix<Float> {
        let newRows = a.rows + top + bottom
        let newCols = a.columns + left + right
        let offset = top * newCols + left

        let m = a.columns   // number of columns to move
        let n = a.rows      // number of rows to move
        let ta = a.columns  // stride between rows in source
        let tc = newCols    // stride between rows in destination

        let c = Matrix(rows: newRows, columns: newCols, fill: value)

        vDSP_mmov(
            a.buffer.baseAddress!,
            c.buffer.baseAddress!.advanced(by: offset),
            vDSP_Length(m),
            vDSP_Length(n),
            vDSP_Length(ta),
            vDSP_Length(tc)
        )

        return c
    }
}

extension Matrix where Scalar: MatrixPad, Scalar: Numeric {
    /// Pad a matrix with a constant value.
    /// - Parameters:
    ///   - top: Number of rows to add at the top.
    ///   - bottom: Number of rows to add at the bottom.
    ///   - left: Number of columns to add at the left.
    ///   - right: Number of columns to add at the right.
    ///   - value: The value used for padding. Default value is zero.
    /// - Returns: A new padded matrix.
    public func pad(top: Int, bottom: Int, left: Int, right: Int, with value: Scalar = 0) -> Matrix {
        Scalar.pad(a: self, top: top, bottom: bottom, left: left, right: right, value: value)
    }

    /// Uniformly pad a matrix with a constant value.
    /// - Parameters:
    ///   - padding: Number of rows/columns to add on each side. Default is one.
    ///   - value: The value used for padding. Default value is zero.
    /// - Returns: A new padded matrix.
    public func pad(by padding: Int = 1, with value: Scalar = 0) -> Matrix {
        Scalar.pad(a: self, top: padding, bottom: padding, left: padding, right: padding, value: value)
    }
}
