//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 3/16/24.
//
import Accelerate

public struct Matrix<T: FloatingPoint> {

    /// Number of matrix rows.
    public let rows: Int

    /// Number of matrix columns.
    public let columns: Int

    /// Underlying matrix values as an Array.
    public var values: [T]

    /// Create a Matrix with size m x n where m is number of rows and n is
    /// number columns.
    /// - Parameters:
    ///   - rows: Number of rows.
    ///   - columns: Number of columns.
    ///   - values: Array of Doulbe or Float values.
    public init(rows: Int, columns: Int, values: [T]) {
        self.rows = rows
        self.columns = columns
        self.values = values
    }

    public init(rows: Int, columns: Int, fill: T = 0.0) {
        self.rows = rows
        self.columns = columns
        self.values = Array(repeating: fill, count: rows * columns)
    }

    /// Create a Matrix from a 2D Array such as [[1, 2], [3, 4]].
    /// - Parameter content: A two-dimensional Array.
    public init(_ content: [[T]]) {
        self.rows = content.count
        self.columns = content[0].count
        self.values = content.flatMap { $0 }
    }

    public subscript(row: Int, column: Int) -> T {
        get { return values[(row * columns) + column] }
        set { values[(row * columns) + column] = newValue }
    }
}

// MARK: - Double precision

extension Matrix where T == Double {

    /// Element-wise sum of two matrices with double precision.
    /// - Parameters:
    ///   - lhs: Matrix A.
    ///   - rhs: Matrix B.
    /// - Returns: The sum of A[i] + B[i].
    public static func + (lhs: Matrix, rhs: Matrix) -> Matrix {
        precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must be same shape")
        let vec = vDSP.add(lhs.values, rhs.values)
        return Matrix(rows: lhs.rows, columns: lhs.columns, values: vec)
    }

    /// Element-wise sum of a matrix and a scalar with double precision.
    /// - Parameters:
    ///   - lhs: Matrix A.
    ///   - rhs: Scalar value.
    /// - Returns: The sum of A[i] + scalar.
    static public func + (lhs: Matrix, rhs: T) -> Matrix {
        let vec = vDSP.add(rhs, lhs.values)
        return Matrix(rows: lhs.rows, columns: lhs.columns, values: vec)
    }

    /// Element-wise sum of a matrix and a scalar with double precision.
    /// - Parameters:
    ///   - lhs: Scalar value
    ///   - rhs: Matrix B.
    /// - Returns: The sum of scalar + B[i].
    static public func + (lhs: T, rhs: Matrix) -> Matrix {
        let vec = vDSP.add(lhs, rhs.values)
        return Matrix(rows: rhs.rows, columns: rhs.columns, values: vec)
    }
}

// MARK: - Single precision

extension Matrix where T == Float {

    /// Element-wise sum of two matrices with single precision.
    /// - Parameters:
    ///   - lhs: Matrix A.
    ///   - rhs: Matrix B.
    /// - Returns: The sum of A[i] + B[i].
    public static func + (lhs: Matrix, rhs: Matrix) -> Matrix {
        precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must be same shape")
        let vec = vDSP.add(lhs.values, rhs.values)
        return Matrix(rows: lhs.rows, columns: lhs.columns, values: vec)
    }

    /// Element-wise sum of a matrix and a scalar with double precision.
    /// - Parameters:
    ///   - lhs: Matrix A.
    ///   - rhs: Scalar value.
    /// - Returns: The sum of A[i] + scalar.
    static public func + (lhs: Matrix, rhs: T) -> Matrix {
        let vec = vDSP.add(rhs, lhs.values)
        return Matrix(rows: lhs.rows, columns: lhs.columns, values: vec)
    }

    /// Element-wise sum of a matrix and a scalar with double precision.
    /// - Parameters:
    ///   - lhs: Scalar value
    ///   - rhs: Matrix B.
    /// - Returns: The sum of scalar + B[i].
    static public func + (lhs: T, rhs: Matrix) -> Matrix {
        let vec = vDSP.add(lhs, rhs.values)
        return Matrix(rows: rhs.rows, columns: rhs.columns, values: vec)
    }
}
