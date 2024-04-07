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
