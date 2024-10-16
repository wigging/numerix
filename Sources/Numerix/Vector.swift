/*
Vector structure for one-dimensional numerical data.
The underlying data storage is a mutable buffer handled by the DataBuffer class.
*/

import Accelerate

/// A one-dimensional structure for numerical data.
///  
/// Create a vector with double-precision values:
/// ```swift
/// let vec = Vector<Double>([1, 2, 3, 4, 5])
/// ```
/// Array literal syntax is also supported:
/// ```swift
/// let vec: Vector<Double> = [2, 3, 4, 5, 6, 7]
/// ```
public struct Vector<T> {

    /// Number of elements in the vector.
    public var size: Int {
        self.buffer.count
    }

    // Class reference to a mutable buffer for underlying data storage
    private let data: DataBuffer<T>

    /// Mutable buffer for underlying data storge and access.
    var buffer: UnsafeMutableBufferPointer<T> {
        get { self.data.buffer }
        set { self.data.buffer = newValue }
    }

    /// Create an empty vector of a certain size.
    /// - Parameter size: Number of elements in the vector.
    public init(size: Int) {
        self.data = DataBuffer(count: size)
    }

    /// Create a vector from an array of values.
    /// - Parameter values: Values of the vector.
    public init(_ values: [T]) {
        self.data = DataBuffer(array: values)
    }

    /// Create a vector of a certain size filled with the given value.
    /// - Parameters:
    ///   - size: Numbers of elements in the vector.
    ///   - fill: Value to fill the vector.
    public init(size: Int, fill: T) {
        self.data = DataBuffer(count: size, fill: fill)
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
    /// - Parameter range: A half-open range of values.
    public init(_ range: Range<T>) where T == Int {
        let arr = Array(range)
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
    /// - Parameter range: A half-open range of values.
    public init(_ range: Range<T>) where T == Float {
        let n = Int(range.upperBound - range.lowerBound)
        self.data = DataBuffer(count: n)
        vDSP.formRamp(withInitialValue: Float(range.lowerBound), increment: 1.0, result: &self.data.buffer)
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
    /// - Parameter range: A half-open range of values.
    public init(_ range: Range<T>) where T == Double {
        let n = Int(range.upperBound - range.lowerBound)
        self.data = DataBuffer(count: n)
        vDSP.formRamp(withInitialValue: Double(range.lowerBound), increment: 1.0, result: &self.data.buffer)
    }

    /// Create an integer vector from a closed range of values.
    ///
    /// Use the closed range operator `...` to create a vector containing integer
    /// values from 0 to 5.
    /// ```swift
    /// let vec = Vector(0...5)
    /// ```
    /// - Parameter closedRange: A closed range of values.
    public init(_ closedRange: ClosedRange<T>) where T == Int {
        let arr = Array(closedRange)
        self.data = DataBuffer(array: arr)
    }

    /// Create a single-precision vector from a closed range of values.
    ///
    /// Use the closed range operator `...` to create a vector containing single
    /// precision values from 0 to 5.
    /// ```swift
    /// let vec = Vector<Float>(0...5)
    /// ```
    /// - Parameter closedRange: A closed range of values.
    public init(_ closedRange: ClosedRange<T>) where T == Float {
        let n = closedRange.upperBound - closedRange.lowerBound
        self.data = DataBuffer(count: Int(n) + 1)
        vDSP.formRamp(in: closedRange, result: &self.data.buffer)
    }

    /// Create a double-precision vector from a closed range of values.
    ///
    /// Use the closed range operator `...` to create a vector containing double
    /// precision values from 1.4 to 5.4.
    /// ```swift
    /// let vec = Vector(1.4...5.4)
    /// ```
    /// - Parameter closedRange: A closed range of values.
    public init(_ closedRange: ClosedRange<T>) where T == Double {
        let n = closedRange.upperBound - closedRange.lowerBound
        self.data = DataBuffer(count: Int(n) + 1)
        vDSP.formRamp(in: closedRange, result: &self.data.buffer)
    }

    // Subscript for the vector
    public subscript(item: Int) -> T {
        get { return self.buffer[item] }
        set { self.buffer[item] = newValue }
    }

    /// Find the index of the largest absolute value in the vector with single precision.
    /// - Parameter stride: Stride within the vector. Default is 1 for every element.
    /// - Returns: Index corresponding to the largest absolute value.
    public func maxAbsIndex(stride: Int = 1) -> Int where T == Float {
        let index = cblas_isamax(self.size, self.buffer.baseAddress, stride)
        return index
    }

    /// Find the index of the largest absolute value in the vector with double precision.
    /// - Parameter stride: Stride within the vector. Default is 1 for every element.
    /// - Returns: Index corresponding to the largest absolute value.
    public func maxAbsIndex(stride: Int = 1) -> Int where T == Double {
        let index = cblas_idamax(self.size, self.buffer.baseAddress, stride)
        return index
    }

    /// Raise each element to the power of the exponent for single-precision vector.
    /// - Parameter exp: The exponent.
    public mutating func pow(_ exp: Float) where T == Float {
        withUnsafePointer(to: exp) { expPtr in
            withUnsafePointer(to: Int32(self.size)) { lengthPtr in
                vvpowsf(self.buffer.baseAddress!, expPtr, self.buffer.baseAddress!, lengthPtr)
            }
        }
    }

    /// Raise each element to the power of the exponent for double-precision vector.
    /// - Parameter exp: The exponent.
    public mutating func pow(_ exp: Double) where T == Double {
        withUnsafePointer(to: exp) { expPtr in
            withUnsafePointer(to: Int32(self.size)) { lengthPtr in
                vvpows(self.buffer.baseAddress!, expPtr, self.buffer.baseAddress!, lengthPtr)
            }
        }
    }

    /// Reverse the elements in a single-precision vector.
    public mutating func reverse() where T == Float {
        vDSP.reverse(&self.buffer)
    }

    /// Reverse the elements in a double-precision vector.
    public mutating func reverse() where T == Double {
        vDSP.reverse(&self.buffer)
    }

    /// Sort the elements in a single-precision vector.
    /// - Parameter order: Ascending or descending sorting order.
    public mutating func sort(order: vDSP.SortOrder) where T == Float {
        vDSP.sort(&self.buffer, sortOrder: order)
    }

    /// Sort the elements in a double-precision vector.
    /// - Parameter order: Ascending or descending sorting order.
    public mutating func sort(order: vDSP.SortOrder) where T == Double {
        vDSP.sort(&self.buffer, sortOrder: order)
    }

    /// Sum of the values in a single-precision vector.
    /// - Returns: Sum of the vector values.
    public func sum() -> Float where T == Float {
        return vDSP.sum(self.buffer)
    }

    /// Sum of the values in a double-precision vector.
    /// - Returns: Sum of the vector values
    public func sum() -> Double where T == Double {
        return vDSP.sum(self.buffer)
    }

    /// Sum of the absolute values in a single-precision vector.
    /// - Returns: Absolute sum of the vector values.
    public func absoluteSum() -> Float where T == Float {
        return cblas_sasum(self.size, self.buffer.baseAddress, 1)
    }

    /// Sum of the absolute values in a double-precision vector.
    /// - Returns: Absolute sum of the vector values.
    public func absoluteSum() -> Double where T == Double {
        return cblas_dasum(self.size, self.buffer.baseAddress, 1)
    }

    /// Scale the vector by a constant using single precision.
    /// - Parameter alpha: The scalar value to multiply by.
    public func scale(by alpha: Float) where T == Float {
        cblas_sscal(self.size, alpha, self.buffer.baseAddress, 1)
    }

    /// Scale the vector by a constant using double precision.
    /// - Parameter alpha: The scalar value to multiply by.
    public func scale(by alpha: Double) where T == Double {
        cblas_dscal(self.size, alpha, self.buffer.baseAddress, 1)
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
    /// - Returns: True if both vectors are same size and contain the same values.
    public static func == (lhs: Vector, rhs: Vector) -> Bool {
        let cmp = memcmp(lhs.buffer.baseAddress, rhs.buffer.baseAddress, MemoryLayout<T>.size * lhs.size)
        let buffersEqual = cmp == 0 ? true : false
        return lhs.size == rhs.size && buffersEqual
    }
}
