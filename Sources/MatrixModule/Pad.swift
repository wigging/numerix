/*
 Matrix extension for pad method.
 Currently only supports Float and Double matrices.
 This is inspired my the NumPy pad function https://numpy.org/doc/stable/reference/generated/numpy.pad.html
 */

import Accelerate

public protocol Pad {
    static func pad(a: Matrix<Self>, value: Self) -> Matrix<Self>
}

extension Float: Pad {
    public static func pad(a: Matrix<Float>, value: Float) -> Matrix<Float> {
        let m = vDSP_Length(a.columns)       // number of columns to copy
        let n = vDSP_Length(a.rows)          // number of rows to copy
        let ta = vDSP_Length(a.columns)      // number of columns in a
        let tc = vDSP_Length(a.columns + 2)  // number of columns in c

        let c = Matrix<Float>(rows: a.rows + 2, columns: a.columns + 2, fill: value)
        vDSP_mmov(a.buffer.baseAddress!, c.buffer.baseAddress! + (a.columns + 3), m, n, ta, tc)

        return c
    }
}

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

extension Matrix where Scalar: Pad, Scalar: Numeric {

    /// Pad a matrix with a constant value.
    ///
    /// Create a padded matrix with zeros.
    /// ```swift
    /// let a: Matrix<Float> = [[1, 2],
    ///                         [3, 4]]
    /// let p = a.pad()
    /// // The matrix p has values of
    /// // 0 0 0 0
    /// // 0 1 2 0
    /// // 0 3 4 0
    /// // 0 0 0 0
    /// ```
    /// Create a padded matrix using a value of 9.
    /// ```swift
    /// let a: Matrix<Float> = [[1, 2],
    ///                         [3, 4]]
    /// let p = a.pad(with: 9)
    /// // The matrix p has values of
    /// // 9 9 9 9
    /// // 9 1 2 9
    /// // 9 3 4 9
    /// // 9 9 9 9
    /// ```
    ///
    /// - Parameter value: The scalar value for padding the matrix. Default is 0.
    /// - Returns: A padded matrix with zeros or some other value along its border.
    public func pad(with value: Scalar = .zero) -> Matrix {
        Scalar.pad(a: self, value: value)
    }
}
