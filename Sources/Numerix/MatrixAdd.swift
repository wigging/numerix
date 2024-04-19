//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 4/6/24.
//

import Accelerate

extension Matrix {

    // MARK: Matrix-Matrix addition

    /// Element-wise sum of two matrices with double precision.
    /// - Parameters:
    ///   - lhs: Matrix A.
    ///   - rhs: Matrix B.
    /// - Returns: The sum of A[i] + B[i].
    public static func + (lhs: Matrix, rhs: Matrix) -> Matrix where T == Double {
        precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must be same shape")
        let vec = vDSP.add(lhs.values, rhs.values)
        return Matrix(rows: lhs.rows, columns: lhs.columns, values: vec)
    }

    /// Element-wise sum of two matrices with single precision.
    /// - Parameters:
    ///   - lhs: Matrix A.
    ///   - rhs: Matrix B.
    /// - Returns: The sum of A[i] + B[i].
    public static func + (lhs: Matrix, rhs: Matrix) -> Matrix where T == Float {
        precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must be same shape")
        let vec = vDSP.add(lhs.values, rhs.values)
        return Matrix(rows: lhs.rows, columns: lhs.columns, values: vec)
    }

    // MARK: Matrix-Scalar addition

    /// Element-wise sum of a matrix and a scalar with double precision.
    /// - Parameters:
    ///   - lhs: Matrix A.
    ///   - rhs: Scalar value.
    /// - Returns: The sum of A[i] + scalar.
    public static func + (lhs: Matrix, rhs: T) -> Matrix where T == Double {
        let vec = vDSP.add(rhs, lhs.values)
        return Matrix(rows: lhs.rows, columns: lhs.columns, values: vec)
    }

    /// Element-wise sum of a matrix and a scalar with double precision.
    /// - Parameters:
    ///   - lhs: Scalar value
    ///   - rhs: Matrix B.
    /// - Returns: The sum of scalar + B[i].
    public static func + (lhs: T, rhs: Matrix) -> Matrix where T == Double {
        let vec = vDSP.add(lhs, rhs.values)
        return Matrix(rows: rhs.rows, columns: rhs.columns, values: vec)
    }

    /// Element-wise sum of a matrix and a scalar with double precision.
    /// - Parameters:
    ///   - lhs: Matrix A.
    ///   - rhs: Scalar value.
    /// - Returns: The sum of A[i] + scalar.
    public static func + (lhs: Matrix, rhs: T) -> Matrix where T == Float {
        let vec = vDSP.add(rhs, lhs.values)
        return Matrix(rows: lhs.rows, columns: lhs.columns, values: vec)
    }

    /// Element-wise sum of a matrix and a scalar with double precision.
    /// - Parameters:
    ///   - lhs: Scalar value
    ///   - rhs: Matrix B.
    /// - Returns: The sum of scalar + B[i].
    public static func + (lhs: T, rhs: Matrix) -> Matrix where T == Float {
        let vec = vDSP.add(lhs, rhs.values)
        return Matrix(rows: rhs.rows, columns: rhs.columns, values: vec)
    }
}
