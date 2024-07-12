/*
 Pad functions for Matrix structures. Single and double precision values are
 supported.
 */

import Accelerate

/// Pad a single-precision matrix with a constant value.
///
/// Padding a matrix with zeros.
/// ```swift
/// let mat: Matrix<Float> = [[1, 2],
///                           [3, 4]]
/// let p = pad(mat)
/// // matrix p has values of
/// // 0 0 0 0
/// // 0 1 2 0
/// // 0 3 4 0
/// // 0 0 0 0
/// ```
/// Padding a matrix with sevens.
/// ```swift
/// let mat: Matrix<Float> = [[1, 2],
///                           [3, 4]]
/// let p = pad(mat, with: 7)
/// // matrix p has values of
/// // 7 7 7 7
/// // 7 1 2 7
/// // 7 3 4 7
/// // 7 7 7 7
/// ```
/// - Parameter mat: The input matrix.
/// - Parameter value: The padded value. Default value is 0.
/// - Returns: A padded matrix with zeros (or other value) along the border.
public func pad(_ mat: Matrix<Float>, with value: Float = 0) -> Matrix<Float> {
    let m = vDSP_Length(mat.columns)       // number of columns to copy
    let n = vDSP_Length(mat.rows)          // number of rows to copy
    let ta = vDSP_Length(mat.columns)      // number of columns in a
    let tc = vDSP_Length(mat.columns + 2)  // number of columns in c

    let c = Matrix<Float>(rows: mat.rows + 2, columns: mat.columns + 2, fill: value)
    vDSP_mmov(mat.buffer.baseAddress!, c.buffer.baseAddress! + (mat.columns + 3), m, n, ta, tc)

    return c
}

/// Pad a double-precision matrix with a constant value.
///
/// Padding a matrix with zeros.
/// ```swift
/// let mat: Matrix<Double> = [[1, 2],
///                            [3, 4]]
/// let p = pad(mat)
/// // matrix p has values of
/// // 0 0 0 0
/// // 0 1 2 0
/// // 0 3 4 0
/// // 0 0 0 0
/// ```
/// Padding a matrix with sevens.
/// ```swift
/// let mat: Matrix<Double> = [[1, 2],
///                            [3, 4]]
/// let p = pad(mat, with: 7)
/// // matrix p has values of
/// // 7 7 7 7
/// // 7 1 2 7
/// // 7 3 4 7
/// // 7 7 7 7
/// ```
/// - Parameter mat: The input matrix.
/// - Parameter value: The padded value. Default value is 0.
/// - Returns: A padded matrix with zeros (or other value) along the border.
public func pad(_ mat: Matrix<Double>, with value: Double = 0) -> Matrix<Double> {
    let m = vDSP_Length(mat.columns)       // number of columns to copy
    let n = vDSP_Length(mat.rows)          // number of rows to copy
    let ta = vDSP_Length(mat.columns)      // number of columns in a
    let tc = vDSP_Length(mat.columns + 2)  // number of columns in c

    let c = Matrix<Double>(rows: mat.rows + 2, columns: mat.columns + 2, fill: value)
    vDSP_mmovD(mat.buffer.baseAddress!, c.buffer.baseAddress! + (mat.columns + 3), m, n, ta, tc)

    return c
}
