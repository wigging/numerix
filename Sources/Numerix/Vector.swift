//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 3/26/24.
//

import Accelerate

/// A one-dimensional collection of numerical values.
public struct Vector<T> {

    /// Scalar elements in the vector.
    //public var values: [T]

    /// Number of elements in the vector.
    public var length: Int {
        self.buffer.count
    }

    // Class reference to a mutable buffer for underlying data storage
    private let data: DataBuffer<T>

    /// Mutable buffer for underlying data storge and access.
    var buffer: UnsafeMutableBufferPointer<T> {
        get { self.data.buffer }
        set { self.data.buffer = newValue }
    }
    
    /// Create an empty vector of a certain length.
    /// - Parameter length: Length of the vector.
    public init(length: Int) {
        self.data = DataBuffer(count: length)
    }

    /// Create a vector from an array of values.
    /// - Parameter values: Values of the vector.
    public init(_ values: [T]) {
        //self.values = values
        self.data = DataBuffer(array: values)
    }

    /// Create a vector of a certain length filled with the given value.
    /// - Parameters:
    ///   - length: Length of the vector.
    ///   - fill: Value to fill the vector.
    public init(length: Int, fill: T) {
        //self.values = [T](repeating: fill, count: length)
        self.data = DataBuffer(count: length, fill: fill)
    }

    public subscript(item: Int) -> T {
        get { return self.buffer[item] }
        set { self.buffer[item] = newValue }
    }

    /// Find the index of the largest absolute value in the vector with single precision.
    /// - Parameter stride: Stride within the vector. Default is 1 for every element.
    /// - Returns: Index corresponding to the largest absolute value.
    public func maxAbsIndex(stride: Int = 1) -> Int where T == Float {
        let index = cblas_isamax(self.length, self.buffer.baseAddress, stride)
        return index
    }

    /// Find the index of the largest absolute value in the vector with double precision.
    /// - Parameter stride: Stride within the vector. Default is 1 for every element.
    /// - Returns: Index corresponding to the largest absolute value.
    public func maxAbsIndex(stride: Int = 1) -> Int where T == Double {
        let index = cblas_idamax(self.length, self.buffer.baseAddress, stride)
        return index
    }
}

extension Vector: ExpressibleByArrayLiteral {

    /// Create a vector using an array literal.
    ///
    /// Examples of using an array literal to create a vector.
    ///
    /// ```swift
    /// // Create a vector of integers
    /// let vec: Vector = [1, 2, 3, 4]
    ///
    /// // Create a vector of doubles
    /// let vec: Vector = [4.2, 5, 6, 7.31, 8]
    ///
    /// // Create vector of doubles where values given as integers
    /// let vec: Vector<Double> = [4, 5, 6, 7, 8]
    /// ```
    ///
    /// - Parameter elements: Values in the vector.
    public init(arrayLiteral elements: T...) {
        self.init(elements)
    }
}

extension Vector: Equatable where T: Equatable {

    /// Compare two vectors for equality.
    /// - Parameters:
    ///   - lhs: The first vector.
    ///   - rhs: The second vector.
    /// - Returns: True if both vectors are same length and contain the same values.
    public static func == (lhs: Vector, rhs: Vector) -> Bool {
        return lhs.length == rhs.length && Array(lhs.buffer) == Array(rhs.buffer)
    }
}
