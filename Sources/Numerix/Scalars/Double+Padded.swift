/*
Double extension to conform to Padded protocol.
*/

import Accelerate

@_documentation(visibility: private)
extension Double: Padded {
    public static func padded(
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
