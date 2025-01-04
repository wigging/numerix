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

    subscript(item: Int) -> Scalar {
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

extension Vector where Scalar: VectorArithmetic {

    /// Element-wise addition of a scalar and vector using real numbers.
    /// - Parameters:
    ///   - lhs: Left-hand side scalar value.
    ///   - rhs: Right-hand side vector.
    /// - Returns: Element-wise sum of a scalar and vector.
    public static func + (lhs: Scalar, rhs: Vector) -> Vector {
        Scalar.add(rhs, lhs)
    }

    public static func + (lhs: Vector, rhs: Scalar) -> Vector {
        Scalar.add(lhs, rhs)
    }

    public static func + (lhs: Vector, rhs: Vector) -> Vector {
        Scalar.add(lhs, rhs)
    }

    public static func += (lhs: inout Vector, rhs: Vector) {
        lhs = lhs + rhs
    }

    public static func - (lhs: Scalar, rhs: Vector) -> Vector {
        Scalar.subtract(lhs, rhs)
    }

    public static func - (lhs: Vector, rhs: Scalar) -> Vector {
        Scalar.subtract(lhs, rhs)
    }

    public static func - (lhs: Vector, rhs: Vector) -> Vector {
        Scalar.subtract(lhs, rhs)
    }

    public static func * (lhs: Scalar, rhs: Vector) -> Vector {
        Scalar.multiply(rhs, lhs)
    }

    public static func * (lhs: Vector, rhs: Scalar) -> Vector {
        Scalar.multiply(lhs, rhs)
    }

    public static func * (lhs: Vector, rhs: Vector) -> Vector {
        Scalar.multiply(lhs, rhs)
    }

    public static func *= (lhs: inout Vector, rhs: Scalar) {
        lhs = lhs * rhs
    }
}

extension Vector where Scalar: VectorAlgebra {

    /// Calculate the dot product of two vectors.
    ///
    /// This calculates the dot product as `c = aᵀb` where `a` and `b` are vectors
    /// that must be the same length.
    /// ```swift
    /// let a: Vector<Float> = [1, 2, 3, 4, 5]
    /// let b: Vector<Float> = [9, 2, 3, 4, 5]
    /// let c = a.dot(b)
    /// // c is 63.0
    /// ```
    ///
    /// - Parameter b: The second vector.
    /// - Returns: The dot product of two vectors
    public func dot(_ b: Vector) -> Scalar {
        precondition(self.size == b.size, "Vectors must be same size")
        return Scalar.dot(self, b)
    }

    /// The Euclidean norm of the vector. Also known as the L² norm, 2-norm,
    /// vector magnitude, or Euclidean length.
    /// - Returns: The vector norm.
    public func norm() -> Scalar {
        Scalar.norm(self)
    }

    /// Multiply each value in the vector by a constant.
    ///
    /// For integer vectors, this performs element-wise multiplication. For
    /// single and double precision vectors this uses BLAS routines `sscal`
    /// and `dscal` respectively.
    ///
    /// - Parameter k: The scaling factor.
    public mutating func scale(by k: Scalar) {
        Scalar.scale(&self, by: k)
    }

    /// Sum of the vector values.
    ///
    /// This example calculates the sum of the values in vector `a`.
    /// ```swift
    /// let a = Vector([1, 2, 3, 4, 5])
    /// let c = a.sum()
    /// // c is 15
    /// ```
    ///
    /// - Returns: Sum of the values.
    public func sum() -> Scalar {
        Scalar.sum(self)
    }

    /// Sum of the absolute values in the vector.
    ///
    /// This examples calculates the absolute sum of the values in vector `a`.
    /// ```swift
    /// let a = Vector<Float>([1, 2, -3, 4, -6.8])
    /// let c = a.absoluteSum()
    /// // c is 16.8
    /// ```
    ///
    /// - Returns: Sum of absolute values.
    public func absoluteSum() -> Scalar {
        Scalar.absoluteSum(self)
    }

    /// Calculate the cumulative sum of the vector.
    ///
    /// This returns a vector that is the cumulative sum of the scalar values.
    /// ```swift
    /// let a = Vector([1, 2, 3, 4, 5])
    /// let c = a.cumulativeSum()
    /// // c is Vector with values [1, 3, 6, 10, 15]
    /// ```
    /// 
    /// - Returns: Cumulative sum vector.
    public func cumulativeSum() -> Vector {
        Scalar.cumulativeSum(self)
    }
}
