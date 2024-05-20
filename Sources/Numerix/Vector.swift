//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 3/26/24.
//

import Accelerate

public struct Vector<T> {

    /// Scalar elements in the vector.
    public var values: [T]

    /// Number of elements in the vector.
    public var length: Int {
        values.count
    }

    /// Create a vector from an array of values.
    /// - Parameter values: Values of the vector.
    public init(_ values: [T]) {
        self.values = values
    }

    /// Create a vector of a certain length filled with the given value.
    /// - Parameters:
    ///   - length: Length of the vector.
    ///   - fill: Value to fill the vector.
    public init(length: Int, fill: T = 0.0) {
        self.values = [T](repeating: fill, count: length)
    }

    public subscript(item: Int) -> T {
        get { return values[item] }
        set { values[item] = newValue }
    }
}
