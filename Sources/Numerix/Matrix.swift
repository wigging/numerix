//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 3/16/24.
//

import Accelerate

public struct Matrix<T> {

    /// Number of matrix rows.
    public let rows: Int

    /// Number of matrix columns.
    public let columns: Int

    /// Underlying matrix values as an array.
    public var values: [T]

    /// Create a Matrix with size m x n where m is number of rows and n is number of columns.
    /// - Parameters:
    ///   - rows: Number of rows in the matrix.
    ///   - columns: Number of columns in the matrix.
    ///   - values: Values in the matrix as an array of scalars.
    public init(rows: Int, columns: Int, values: [T]) {
        self.rows = rows
        self.columns = columns
        self.values = values
    }

    /// Create a matrix filled with a given value. By default, this creates a matrix of zeros with double precision.
    /// - Parameters:
    ///   - rows: Number of rows in the matrix.
    ///   - columns: Number of columns in the matrix.
    ///   - fill: Value to fill the matrix. Default value zero.
    public init(rows: Int, columns: Int, fill: T = 0.0) {
        self.rows = rows
        self.columns = columns
        self.values = Array(repeating: fill, count: rows * columns)
    }

    /// Create a matrix using embedded arrays such as [[1, 2], [3, 4]].
    /// - Parameter content: Embedded arrays.
    public init(_ content: [[T]]) {
        self.rows = content.count
        self.columns = content[0].count
        self.values = content.flatMap { $0 }
    }

    public subscript(row: Int, column: Int) -> T {
        get { return self.values[(row * self.columns) + column] }
        set { self.values[(row * self.columns) + column] = newValue }
    }

    /// Find the index of the largest absolute value in the matrix with single precision.
    /// - Parameter stride: Stride within the flattened matrix. Default is 1 for every element.
    /// - Returns: Row and column index corresponding to the largest absolute value.
    public func maxAbsIndex(stride: Int = 1) -> (Int, Int) where T == Float {
        let index = cblas_isamax(self.values.count, self.values, stride)
        let row = index % self.rows
        let col = index / self.columns
        return (row, col)
    }

    /// Find the index of the largest absolute value in the matrix with double precision.
    /// - Parameter stride: Stride within the flattened matrix. Default is 1 for every element.
    /// - Returns: Row and column index corresponding to the largest absolute value.
    public func maxAbsIndex(stride: Int = 1) -> (Int, Int) where T == Double {
        let index = cblas_idamax(self.values.count, self.values, stride)
        let row = index / self.rows
        let col = index % self.columns
        return (row, col)
    }
}
