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

    public subscript(item: Int) -> Scalar {
        get { return self.buffer[item] }
        set { self.buffer[item] = newValue }
    }
}

extension Vector: ExpressibleByArrayLiteral {

    public init(arrayLiteral elements: Scalar...) {
        self.init(elements)
    }
}

extension Vector: CustomStringConvertible {

    public var description: String {
        var descr = "( "
        descr += self.buffer.map { "\($0)" }.joined(separator: "  ")
        descr += " )"
        return descr
    }
}

extension Vector: CustomDebugStringConvertible {

    public var debugDescription: String {
        var descr = "\(self.size)-element \(type(of: self))\n( "
        descr += self.buffer.map { "\($0)" }.joined(separator: "  ")
        descr += " )"
        return descr
    }
}

extension Vector: Equatable {

    /// Compare two vectors for equality.
    /// - Parameters:
    ///   - lhs: Left-hand side vector.
    ///   - rhs: Right-hand side vector.
    /// - Returns: True if both vectors are same size and contain the same values.
    public static func == (lhs: Vector, rhs: Vector) -> Bool {
        let cmp = memcmp(lhs.buffer.baseAddress, rhs.buffer.baseAddress, MemoryLayout<Scalar>.size * lhs.size)
        let buffersEqual = cmp == 0 ? true : false
        return lhs.size == rhs.size && buffersEqual
    }
}
