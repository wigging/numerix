/*
ShapedArray structure.
*/

import Accelerate

/// An N-dimensional array for working with numerical data.
public struct ShapedArray<Scalar> {

    /// Dimensions of the shaped array.
    public let shape: [Int]

    // Reference to mutable buffer for underlying data storage, use only within this struct
    private let data: DataBuffer<Scalar>

    /// Mutable buffer for underlying data storge and access.
    var buffer: UnsafeMutableBufferPointer<Scalar> {
        get { self.data.buffer }
        set { self.data.buffer = newValue }
    }

    /// Create an empty shaped array with a given shape.
    /// - Parameter shape: The shape of the shaped array.
    public init(shape: [Int]) {
        self.shape = shape
        self.data = DataBuffer(count: shape.reduce(1, *))
    }

    /// Create a shaped array from a standard array with a given shape.
    /// - Parameters:
    ///   - array: A standard array.
    ///   - shape: The shape of the shaped array.
    public init(shape: [Int], array: [Scalar]) {
        self.shape = shape
        self.data = DataBuffer(array: array)
    }

    /// Create a shaped array from nested arrays.
    ///
    /// Nested arrays (an array of arrays) can be used to create a shaped array.
    /// For example, a single-precision 2D shaped array can be created as follows:
    /// ```swift
    /// let arr = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
    /// ```
    /// The 2D shaped array can also be created as:
    /// ```swift
    /// let arr: ShapedArray<Float> = [[1, 2, 3], [4, 5, 6]]
    /// ```
    /// - Parameter arrays: A nested array literal.
    public init(_ arrays: [ShapedArrayElement<Scalar>]) {
        self.shape = getShape(arrays)
        let arr = flatten(arrays)
        self.data = DataBuffer(array: arr)
    }

    public subscript(index: Int...) -> Scalar {
        get {
            let idx = flatIndex(indices: index, shape: self.shape)
            return self.buffer[idx]
        }
        set {
            let idx = flatIndex(indices: index, shape: self.shape)
            self.buffer[idx] = newValue
        }
    }
}

extension ShapedArray: Equatable {

    /// Compare two shaped arrays for equality.
    /// - Parameters:
    ///   - lhs: The shaped array on the left-hand side.
    ///   - rhs: The shaped array on the right-hand side.
    /// - Returns: True if both shaped arrays are same shape and contain the same values.
    public static func == (lhs: ShapedArray, rhs: ShapedArray) -> Bool {
        let n = lhs.buffer.count
        let cmp = memcmp(lhs.buffer.baseAddress, rhs.buffer.baseAddress, MemoryLayout<Scalar>.size * n)
        let buffersEqual = cmp == 0 ? true : false
        return lhs.shape == rhs.shape && buffersEqual
    }
}

extension ShapedArray: ExpressibleByArrayLiteral {

    public init(arrayLiteral elements: ShapedArrayElement<Scalar>...) {
        self.init(elements)
    }
}
