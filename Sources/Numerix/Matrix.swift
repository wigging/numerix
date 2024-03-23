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
    
    /// Underlying matrix values as Array of Float or Double.
    public var values: [T]
    
    public init(rows: Int, columns: Int, values: [T]) {
        self.rows = rows
        self.columns = columns
        self.values = values
    }
    
    public init(rows: Int, columns: Int, fill: T = 0) {
        self.rows = rows
        self.columns = columns
        self.values = Array(repeating: fill, count: rows * columns)
    }
    
    public subscript(row: Int, column: Int) -> T {
        get { return values[(row * columns) + column] }
        set { values[(row * columns) + column] = newValue }
    }
}
