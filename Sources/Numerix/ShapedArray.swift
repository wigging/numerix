/*
ShapedArray structure for working with N-dimensional numerical data.
The underlying data storage is a mutable buffer handled by the DataBuffer class.
*/

import Accelerate

/// An N-dimensional array for working with numerical data.
public struct ShapedArray<T> {

    /// Dimensions of the ShapedArray.
    public let shape: [Int]

    // Reference to mutable buffer for underlying data storage, use only within this struct
    private let data: DataBuffer<T>

    /// Mutable buffer for underlying data storge and access.
    var buffer: UnsafeMutableBufferPointer<T> {
        get { self.data.buffer }
        set { self.data.buffer = newValue }
    }

    /// Create an empty ShapedArray with the given shape.
    /// - Parameter shape: The shape.
    public init(shape: [Int]) {
        self.shape = shape
        self.data = DataBuffer(count: shape.reduce(1, *))
    }

    /// Create a ShapedArray from a one-dimensional array literal.
    /// - Parameter array: An array literal with one dimension.
    public init(_ array: [T]) {
        self.shape = [array.count]
        self.data = DataBuffer(array: array)
    }

    /// Create a ShapedArray from a one-dimension array literal with a given shape.
    /// - Parameters:
    ///   - array: An array literal with one dimension.
    ///   - shape: The shape of the ShapedArray.
    public init(_ array: [T], shape: Int...) {
        self.shape = shape
        self.data = DataBuffer(array: array)
    }

    /// Create a ShapedArray from a one-dimension array literal with a given shape.
    /// - Parameters:
    ///   - array: An array literal with one dimension.
    ///   - shape: The shape of the ShapedArray.
    public init(_ array: [T], shape: [Int]) {
        self.shape = shape
        self.data = DataBuffer(array: array)
    }

    /// Create a ShapedArray from a two-dimensional array literal.
    /// - Parameter array2D: An array literal with two dimensions.
    public init(_ array2D: [[T]]) {
        let rows = array2D.count
        let columns = array2D[0].count
        self.shape = [rows, columns]
        self.data = DataBuffer(array: array2D.flatMap { $0 })
    }

    public subscript(index: Int...) -> T {
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

extension ShapedArray: Equatable where T: Equatable {

    /// Compare two matrices for equality.
    /// - Parameters:
    ///   - lhs: The first matrix.
    ///   - rhs: The second matrix.
    /// - Returns: True if both matrices are same dimension and contain the same values.
    public static func == (lhs: ShapedArray, rhs: ShapedArray) -> Bool {
        let n = lhs.buffer.count
        let cmp = memcmp(lhs.buffer.baseAddress, rhs.buffer.baseAddress, MemoryLayout<T>.size * n)
        let buffersEqual = cmp == 0 ? true : false
        return lhs.shape == rhs.shape && buffersEqual
    }
}

extension ShapedArray: ExpressibleByArrayLiteral {

    public init(arrayLiteral elements: [T]...) {
        self.init(elements)
    }
}
