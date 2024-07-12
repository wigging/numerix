/*
 Transpose functions for Matrix structures. Single and double precision values
 are supported.
 */

import Accelerate

/// Transpose a matrix with single precision.
/// - Parameter a: The input matrix.
/// - Returns: The transposed output matrix.
public func transpose(_ a: Matrix<Float>) -> Matrix<Float> {
    let m = vDSP_Length(a.columns)
    let n = vDSP_Length(a.rows)

    let mat = Matrix<Float>(rows: a.columns, columns: a.rows)
    vDSP_mtrans(a.buffer.baseAddress!, 1, mat.buffer.baseAddress!, 1, m, n)

    return mat
}

/// Transpose a matrix with double precision.
/// - Parameter a: The input matrix.
/// - Returns: The transposed output matrix.
public func transpose(_ a: Matrix<Double>) -> Matrix<Double> {
    let m = vDSP_Length(a.columns)
    let n = vDSP_Length(a.rows)
    
    let mat = Matrix<Double>(rows: a.columns, columns: a.rows)
    vDSP_mtransD(a.buffer.baseAddress!, 1, mat.buffer.baseAddress!, 1, m, n)

    return mat
}
