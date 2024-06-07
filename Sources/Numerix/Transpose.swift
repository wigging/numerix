//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 6/4/24.
//

import Accelerate

/// Transpose a matrix with single precision.
/// - Parameter a: The input matrix.
/// - Returns: The transposed output matrix.
public func transpose(_ a: Matrix<Float>) -> Matrix<Float> {
    var c = Matrix<Float>(rows: a.columns, columns: a.rows, fill: 0.0)
    let m = vDSP_Length(a.columns)
    let n = vDSP_Length(a.rows)
    vDSP_mtrans(a.values, 1, &c.values, 1, m, n)
    return c
}

/// Transpose a matrix with double precision.
/// - Parameter a: The input matrix.
/// - Returns: The transposed output matrix.
public func transpose(_ a: Matrix<Double>) -> Matrix<Double> {
    var c = Matrix(rows: a.columns, columns: a.rows)
    let m = vDSP_Length(a.columns)
    let n = vDSP_Length(a.rows)
    vDSP_mtransD(a.values, 1, &c.values, 1, m, n)
    return c
}
