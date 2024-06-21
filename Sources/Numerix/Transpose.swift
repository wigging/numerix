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
    let m = vDSP_Length(a.columns)
    let n = vDSP_Length(a.rows)

    let result = Matrix(rows: a.columns, columns: a.rows) { buffer in
        vDSP_mtrans(a.values, 1, buffer.baseAddress!, 1, m, n)
    }
    return result
}

/// Transpose a matrix with double precision.
/// - Parameter a: The input matrix.
/// - Returns: The transposed output matrix.
public func transpose(_ a: Matrix<Double>) -> Matrix<Double> {
    let m = vDSP_Length(a.columns)
    let n = vDSP_Length(a.rows)
    
    let result = Matrix(rows: a.columns, columns: a.rows) { buffer in
        vDSP_mtransD(a.values, 1, buffer.baseAddress!, 1, m, n)
    }
    return result
}
