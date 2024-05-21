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
        self.values.count
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
        get { return self.values[item] }
        set { self.values[item] = newValue }
    }
    
    /// Find the index of the largest absolute value in the vector with single precision.
    /// - Parameter stride: Stride within the vector. Default is 1 for every element.
    /// - Returns: Index corresponding to the largest absolute value.
    public func maxAbsIndex(stride: Int = 1) -> Int where T == Float {
        let index = cblas_isamax(self.length, self.values, stride)
        return index
    }

    /// Find the index of the largest absolute value in the vector with double precision.
    /// - Parameter stride: Stride within the vector. Default is 1 for every element.
    /// - Returns: Index corresponding to the largest absolute value.
    public func maxAbsIndex(stride: Int = 1) -> Int where T == Double {
        let index = cblas_idamax(self.length, self.values, stride)
        return index
    }
}
