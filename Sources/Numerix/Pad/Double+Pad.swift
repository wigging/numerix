/*
Double extension to conform to Pad protocol.
*/

import Accelerate

@_documentation(visibility: private)
extension Double: Pad {
    public static func pad(a: Matrix<Double>, value: Double) -> Matrix<Double> {
        let m = vDSP_Length(a.columns)       // number of columns to copy
        let n = vDSP_Length(a.rows)          // number of rows to copy
        let ta = vDSP_Length(a.columns)      // number of columns in a
        let tc = vDSP_Length(a.columns + 2)  // number of columns in c

        let c = Matrix<Double>(rows: a.rows + 2, columns: a.columns + 2, fill: value)
        vDSP_mmovD(a.buffer.baseAddress!, c.buffer.baseAddress! + (a.columns + 3), m, n, ta, tc)

        return c
    }
}
