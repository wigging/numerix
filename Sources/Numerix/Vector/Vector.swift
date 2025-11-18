/*
 Vector structure.
 */

import Accelerate

/// A one-dimensional structure for numerical data.
///
/// Create a vector with double-precision values:
/// ```swift
/// let vec = Vector<Double>([1, 2, 3, 4, 5])
/// ```
///
/// Array literal syntax is also supported:
/// ```swift
/// let vec: Vector<Double> = [2, 3, 4, 5, 6, 7]
/// ```
public struct Vector<Scalar> {

    // Class reference to mutable buffer for underlying data storage
    private let data: DataBuffer<Scalar>

    /// Mutable buffer for underlying data storge and access.
    var buffer: UnsafeMutableBufferPointer<Scalar> {
        get { self.data.buffer }
        set { self.data.buffer = newValue }
    }

    /// Number of elements in the vector.
    public var size: Int {
        self.buffer.count
    }

    /// Create a vector from an array of values.
    /// - Parameter values: Scalar values of the vector.
    public init(_ values: [Scalar]) {
        self.data = DataBuffer(array: values)
    }

    /// Create an empty vector that is the same size as another vector.
    /// - Parameter vector: Another vector.
    public init(like vector: Vector) {
        self.data = DataBuffer(count: vector.size)
    }

    /// Create an empty vector of a certain size.
    /// - Parameter size: Number of elements in the vector.
    public init(size: Int) {
        self.data = DataBuffer(count: size)
    }

    /// Create a vector of a certain size filled with the given value.
    /// - Parameters:
    ///   - size: Numbers of elements in the vector.
    ///   - fill: Scalar value to fill the vector.
    public init(size: Int, fill: Scalar) {
        self.data = DataBuffer(count: size, fill: fill)
    }

    // Create a vector from a buffer, internal use only
    public init(from buffer: UnsafeMutableBufferPointer<Scalar>) {
        self.data = DataBuffer(buffer: buffer)
    }

    public subscript(item: Int) -> Scalar {
        get { return self.buffer[item] }
        set { self.buffer[item] = newValue }
    }

    /// Make a copy of the vector along with its underlying data buffer.
    /// - Returns: A copy of the vector.
    public func copy() -> Vector {
        Vector(from: self.buffer)
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
    /// - Parameter elements: Scalar values in the vector.
    public init(arrayLiteral elements: Scalar...) {
        self.init(elements)
    }
}

extension Vector {
    /// Compare two vectors of single precision for approximate equality.
    ///
    /// Returns true when `norm(x - y) ≤ max(atol, rtol × max(norm(x), norm(y)))`
    /// where `x` and `y` are vectors, `atol` is absolute tolerance, and `rtol`
    /// is relative tolerance.
    ///
    /// - Parameters:
    ///   - other: The other vector used for comparison.
    ///   - absoluteTolerance: The absolute tolerance, default is 0.
    ///   - relativeTolerance: The relative tolerance, default is 1e-6.
    /// - Returns: True when two vectors are approximately equal.
    public func isApproximatelyEqual(
        to other: Vector, absoluteTolerance: Float = 0, relativeTolerance: Float = 1e-6
    ) -> Bool where Scalar == Float {
        let delta = (self - other).norm()
        let scale = max(self.norm(), other.norm())
        return delta <= max(absoluteTolerance, relativeTolerance * scale)
    }

    /// Compare two vectors of double precision for approximate equality.
    ///
    /// Returns true when `norm(x - y) ≤ max(atol, rtol × max(norm(x), norm(y)))`
    /// where `x` and `y` are vectors, `atol` is absolute tolerance, and `rtol`
    /// is relative tolerance.
    ///
    /// - Parameters:
    ///   - other: The other vector used for comparison.
    ///   - absoluteTolerance: The absolute tolerance, default is 0.
    ///   - relativeTolerance: The relative tolerance, default is 1e-8.
    /// - Returns: True when two vectors are approximately equal.
    public func isApproximatelyEqual(
        to other: Vector, absoluteTolerance: Double = 0, relativeTolerance: Double = 1e-8
    ) -> Bool where Scalar == Double {
        let delta = (self - other).norm()
        let scale = max(self.norm(), other.norm())
        return delta <= max(absoluteTolerance, relativeTolerance * scale)
    }
}
