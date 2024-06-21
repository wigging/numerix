//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 5/18/24.
//

import Accelerate

/// Element-wise division of a scalar by a matrix using double precision.
///
/// This divides a scalar value A by each value in matrix B and returns the 
/// result as matrix C such that A / B[i] = C[i] where i is the index of the
/// matrix. The operation is performed using double precision values.
///
/// - Parameters:
///   - scalar: The input scalar A in A / B[i] = C[i].
///   - matrix: The input matrix B in A / B[i] = C[i].
/// - Returns: The output matrix C in A / B[i] = C[i].
public func divide(_ scalar: Double, _ matrix: Matrix<Double>) -> Matrix<Double> {
    let result = Matrix(rows: matrix.rows, columns: matrix.columns) { buffer in
        vDSP.divide(scalar, matrix.values, result: &buffer)
    }
    return result
}

/// Element-wise division of a scalar by a matrix using double precision.
///
/// This divides a scalar value A by each value in matrix B and returns the 
/// result as matrix C such that A / B[i] = C[i] where i is the index of the
/// matrix. The operation is performed using double precision values.
///
/// - Parameters:
///   - lhs: The input scalar A in A / B[i] = C[i].
///   - rhs: The input matrix B in A / B[i] = C[i].
/// - Returns: The output matrix C in A / B[i] = C[i].
public func / (lhs: Double, rhs: Matrix<Double>) -> Matrix<Double> {
    let result = Matrix(rows: rhs.rows, columns: rhs.columns) { buffer in
        vDSP.divide(lhs, rhs.values, result: &buffer)
    }
    return result
}

/// Element-wise division of a matrix by a scalar using double precision.
///
/// This divides each value in matrix A by a scalar value B and returns the 
/// result as matrix C such that A[i] / B = C[i] where i is the index of the
/// matrix. The operation is performed using double precision values.
///
/// - Parameters:
///   - matrix: The input matrix A in A[i] / B = C[i].
///   - scalar: The input scalar B in A[i] / B = C[i].
/// - Returns: The output matrix C in A[i] / B = C[i].
public func divide(_ matrix: Matrix<Double>, _ scalar: Double) -> Matrix<Double> {
    let result = Matrix(rows: matrix.rows, columns: matrix.columns) { buffer in
        vDSP.divide(matrix.values, scalar, result: &buffer)
    }
    return result
}

/// Element-wise division of a matrix by a scalar using double precision.
///
/// This divides each value in matrix A by a scalar value B and returns the 
/// result as matrix C such that A[i] / B = C[i] where i is the index of the
/// matrix. The operation is performed using double precision values.
///
/// - Parameters:
///   - lhs: The input matrix A in A[i] / B = C[i].
///   - rhs: The input scalar B in A[i] / B = C[i].
/// - Returns: The output matrix C in A[i] / B = C[i].
public func / (lhs: Matrix<Double>, rhs: Double) -> Matrix<Double> {
    let result = Matrix(rows: lhs.rows, columns: lhs.columns) { buffer in
        vDSP.divide(lhs.values, rhs, result: &buffer)
    }
    return result
}
