//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 3/16/24.
//

import Accelerate

extension Matrix where T == Double {
    
    /// Element-wise sum of two matrices with double precision.
    /// - Parameters:
    ///   - lhs: Matrix A.
    ///   - rhs: Matrix B.
    /// - Returns: The sum of A[i] + B[i].
    public static func + (lhs: Matrix, rhs: Matrix) -> Matrix {
        precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must be same shape")
        let v = vDSP.add(lhs.values, rhs.values)
        return Matrix(rows: lhs.rows, columns: lhs.columns, values: v)
    }
    
    /// Element-wise sum of a matrix and a scalar with double precision.
    /// - Parameters:
    ///   - lhs: Matrix A.
    ///   - rhs: Scalar value.
    /// - Returns: The sum of A[i] + scalar.
    static public func + (lhs: Matrix, rhs: T) -> Matrix {
        let v = vDSP.add(rhs, lhs.values)
        return Matrix(rows: lhs.rows, columns: lhs.columns, values: v)
    }
    
    /// Element-wise sum of a matrix and a scalar with double precision.
    /// - Parameters:
    ///   - lhs: Scalar value
    ///   - rhs: Matrix B.
    /// - Returns: The sum of scalar + B[i].
    static public func + (lhs: T, rhs: Matrix) -> Matrix {
        let v = vDSP.add(lhs, rhs.values)
        return Matrix(rows: rhs.rows, columns: rhs.columns, values: v)
    }
}

extension Matrix where T == Float {
    
    /// Element-wise sum of two matrices with single precision.
    /// - Parameters:
    ///   - lhs: Matrix A.
    ///   - rhs: Matrix B.
    /// - Returns: The sum of A[i] + B[i].
    public static func + (lhs: Matrix, rhs: Matrix) -> Matrix {
        precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must be same shape")
        let v = vDSP.add(lhs.values, rhs.values)
        return Matrix(rows: lhs.rows, columns: lhs.columns, values: v)
    }
    
    /// Element-wise sum of a matrix and a scalar with double precision.
    /// - Parameters:
    ///   - lhs: Matrix A.
    ///   - rhs: Scalar value.
    /// - Returns: The sum of A[i] + scalar.
    static public func + (lhs: Matrix, rhs: T) -> Matrix {
        let v = vDSP.add(rhs, lhs.values)
        return Matrix(rows: lhs.rows, columns: lhs.columns, values: v)
    }
    
    /// Element-wise sum of a matrix and a scalar with double precision.
    /// - Parameters:
    ///   - lhs: Scalar value
    ///   - rhs: Matrix B.
    /// - Returns: The sum of scalar + B[i].
    static public func + (lhs: T, rhs: Matrix) -> Matrix {
        let v = vDSP.add(lhs, rhs.values)
        return Matrix(rows: rhs.rows, columns: rhs.columns, values: v)
    }
}
