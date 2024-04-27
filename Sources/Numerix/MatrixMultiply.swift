//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 4/23/24.
//

import Accelerate

infix operator .*
infix operator ⊙

extension Matrix {
    
    /// Matrix multiplication for double precision. Number of columns in the left matrix must be
    /// equal to the number of rows in the right matrix.
    /// - Parameters:
    ///   - lhs: Left matrix with dimensions of m x n.
    ///   - rhs: Right matrix with dimensions of n x p.
    /// - Returns: Matrix with dimensions of m x p.
    public static func * (lhs: Matrix, rhs: Matrix) -> Matrix where T == Double {
        precondition(lhs.columns == rhs.rows, "Number of columns in left matrix must equal number of rows in right matrix")
        var a = lhs.values
        var b = rhs.values
        var c = [Double](repeating: 0.0, count: lhs.rows * rhs.columns)

        let m = lhs.rows     // number of rows in matrices A and C
        let n = rhs.columns  // number of columns in matrices B and C
        let k = lhs.columns  // number of columns in matrix A; number of rows in matrix B
        let alpha = 1.0
        let beta = 0.0

        // matrix multiplication where C ← αAB + βC
        cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, m, n, k, alpha, &a, k, &b, n, beta, &c, n)

        let mat = Matrix(rows: lhs.rows, columns: rhs.columns, values: c)
        return mat
    }

    /// Matrix multiplication for single precision. Number of columns in the left matrix must be
    /// equal to the number of rows in the right matrix.
    /// - Parameters:
    ///   - lhs: Left matrix with dimensions of m x n.
    ///   - rhs: Right matrix with dimensions of n x p.
    /// - Returns: Matrix with dimensions of m x p.
    public static func * (lhs: Matrix, rhs: Matrix) -> Matrix where T == Float {
        precondition(lhs.columns == rhs.rows, "Number of columns in left matrix must equal number of rows in right matrix")
        var a = lhs.values
        var b = rhs.values
        var c = [Float](repeating: 0.0, count: lhs.rows * rhs.columns)

        let m = lhs.rows     // number of rows in matrices A and C
        let n = rhs.columns  // number of columns in matrices B and C
        let k = lhs.columns  // number of columns in matrix A; number of rows in matrix B
        let alpha: Float = 1.0
        let beta: Float = 0.0

        // matrix multiplication where C ← αAB + βC
        cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, m, n, k, alpha, &a, k, &b, n, beta, &c, n)

        let mat = Matrix(rows: lhs.rows, columns: rhs.columns, values: c)
        return mat
    }

    /// Element-wise matrix multiplication for double precision matrices. Matrices must have same dimensions.
    /// This is also known as the Hadamard product or Schur product.
    /// - Parameters:
    ///   - lhs: Left matrix with dimension of m x n.
    ///   - rhs: Right matrix with dimension m x n.
    /// - Returns: Matrix of the same dimensions.
    public static func .* (lhs: Matrix, rhs: Matrix) -> Matrix where T == Double {
        precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must have same dimensions")
        let vec = vDSP.multiply(lhs.values, rhs.values)
        let mat = Matrix(rows: lhs.rows, columns: lhs.columns, values: vec)
        return mat
    }

    /// Element-wise matrix multiplication for single precision matrices. Matrices must have same dimensions.
    /// This is also known as the Hadamard product or Schur product.
    /// - Parameters:
    ///   - lhs: Left matrix with dimension of m x n.
    ///   - rhs: Right matrix with dimension m x n.
    /// - Returns: Matrix of the same dimensions.
    public static func .* (lhs: Matrix, rhs: Matrix) -> Matrix where T == Float {
        precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must have same dimensions")
        let vec = vDSP.multiply(lhs.values, rhs.values)
        let mat = Matrix(rows: lhs.rows, columns: lhs.columns, values: vec)
        return mat
    }

    /// Element-wise matrix multiplication for double precision matrices. Matrices must have same dimensions.
    /// This is also known as the Hadamard product or Schur product.
    /// - Parameters:
    ///   - lhs: Left matrix with dimension of m x n.
    ///   - rhs: Right matrix with dimension m x n.
    /// - Returns: Matrix of the same dimensions.
    public static func ⊙ (lhs: Matrix, rhs: Matrix) -> Matrix where T == Double {
        precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must have same dimensions")
        let vec = vDSP.multiply(lhs.values, rhs.values)
        let mat = Matrix(rows: lhs.rows, columns: lhs.columns, values: vec)
        return mat
    }

    /// Element-wise matrix multiplication for single precision matrices. Matrices must have same dimensions.
    /// This is also known as the Hadamard product or Schur product.
    /// - Parameters:
    ///   - lhs: Left matrix with dimension of m x n.
    ///   - rhs: Right matrix with dimension m x n.
    /// - Returns: Matrix of the same dimensions.
    public static func ⊙ (lhs: Matrix, rhs: Matrix) -> Matrix where T == Float {
        precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must have same dimensions")
        let vec = vDSP.multiply(lhs.values, rhs.values)
        let mat = Matrix(rows: lhs.rows, columns: lhs.columns, values: vec)
        return mat
    }
}
