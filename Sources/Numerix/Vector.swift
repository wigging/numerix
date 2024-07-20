/*
 Vector structure for one-dimensional numerical data. The underlying data storage
 is a mutable buffer handled by the DataBuffer class.
 */

import Accelerate

/// A one-dimensional collection of numerical values.
///
/// Create a vector of integers:
/// ```swift
/// let vec = Vector([1, 2, 3, 4, 5])
/// ```
public struct Vector<T> {

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
        self.data = DataBuffer(array: values)
    }

    /// Create a vector of a certain length filled with the given value.
    /// - Parameters:
    ///   - length: Length of the vector.
    ///   - fill: Value to fill the vector.
    public init(length: Int, fill: T) {
        self.data = DataBuffer(count: length, fill: fill)
    }

    /// Create a vector of integers from a range of values.
    ///
    /// Use the half-open range operator `..<` to create a vector containing
    /// values from 0 to 4.
    /// ```swift
    /// let vec = Vector<Int>(0..<5)
    /// // This vector contains values
    /// // 0 1 2 3 4
    /// ```
    ///
    /// A negative value can be used for the lower boundary.
    /// ```swift
    /// let vec = Vector<Int>(-2..<8)
    /// // This vector contains values
    /// // -2 -1 0 1 2 3 4 5 6 7
    /// ```
    /// - Parameters:
    ///   - rng: A half-open range of values.
    public init(_ rng: Range<T>) where T == Int {
        let arr = Array(rng)
        self.data = DataBuffer(array: arr)
    }

    /// Create a single-precision vector from a range of values.
    ///
    /// Use the half-open range operator `..<` to create a vector containing
    /// values from 0 to 4.
    /// ```swift
    /// let vec = Vector<Float>(0..<5)
    /// // This vector contains values
    /// // 0.0 1.0 2.0 3.0 4.0
    /// ```
    ///
    /// A negative value can be used for the lower boundary.
    /// ```swift
    /// let vec = Vector<Float>(-2..<8)
    /// // This vector contains values
    /// // -2.0 -1.0 0.0 1.0 2.0 3.0 4.0 5.0 6.0 7.0
    /// ```
    /// - Parameters:
    ///   - rng: A half-open range of values.
    public init(_ rng: Range<Int>) where T == Float {
        let n = rng.upperBound - rng.lowerBound
        let arr = vDSP.ramp(withInitialValue: Float(rng.lowerBound), increment: Float(1), count: n)
        self.data = DataBuffer(array: arr)
    }

    /// Create a double-precision vector from a range of values.
    ///
    /// Use the half-open range operator `..<` to create a vector containing
    /// values from 0 to 4.
    /// ```swift
    /// let vec = Vector<Double>(0..<5)
    /// // This vector contains values
    /// // 0.0 1.0 2.0 3.0 4.0
    /// ```
    ///
    /// A negative value can be used for the lower boundary.
    /// ```swift
    /// let vec = Vector<Double>(-2..<8)
    /// // This vector contains values
    /// // -2.0 -1.0 0.0 1.0 2.0 3.0 4.0 5.0 6.0 7.0
    /// ```
    /// - Parameters:
    ///   - rng: A half-open range of values.
    public init(_ rng: Range<Int>) where T == Double {
        let n = rng.upperBound - rng.lowerBound
        let arr = vDSP.ramp(withInitialValue: Double(rng.lowerBound), increment: Double(1), count: n)
        self.data = DataBuffer(array: arr)
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
        let cmp = memcmp(lhs.buffer.baseAddress, rhs.buffer.baseAddress, MemoryLayout<T>.size * lhs.length)
        let buffersEqual = cmp == 0 ? true : false
        return lhs.length == rhs.length && buffersEqual
    }
}
