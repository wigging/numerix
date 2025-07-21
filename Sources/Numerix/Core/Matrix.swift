/*
 Matrix structure.
 */

import Accelerate

/// A two-dimensional structure for numerical data.
public struct Matrix<Scalar> {

    /// Number of rows in the matrix.
    public let rows: Int

    /// Number of columns in the matrix.
    public let columns: Int

    /// Number of elements in the matrix.
    public var count: Int {
        self.rows * self.columns
    }

    // Private reference to mutable buffer for underlying data storage
    private let data: DataBuffer<Scalar>

    var buffer: UnsafeMutableBufferPointer<Scalar> {
        get { self.data.buffer }
        set { self.data.buffer = newValue }
    }

    // This is used by the iterator, see next() function in Sequence, IteratorProtocol extension
    private var nextRowStartIndex = 0

    /// Create a matrix using embedded Swift arrays.
    /// - Parameter content: Arrays containing scalar values.
    public init(_ content: [[Scalar]]) {
        self.rows = content.count
        self.columns = content[0].count
        self.data = DataBuffer(array: content.flatMap { $0 })
    }

    /// Create an empty matrix with size `m×n` where `m` is number of rows and `n` is number of columns.
    /// - Parameters:
    ///   - rows: Number of rows in the matrix.
    ///   - columns: Number of columns in the matrix.
    public init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.data = DataBuffer(count: rows * columns)
    }

    /// Create an empty matrix with the same size as another matrix.
    /// - Parameter matrix: The other matrix.
    public init(like matrix: Matrix) {
        self.rows = matrix.rows
        self.columns = matrix.columns
        self.data = DataBuffer(count: matrix.buffer.count)
    }

    /// Create a matrix filled with a given value.
    /// - Parameters:
    ///   - rows: Number of rows in the matrix.
    ///   - columns: Number of columns in the matrix.
    ///   - fill: Scalar value to fill each matrix element.
    public init(rows: Int, columns: Int, fill: Scalar) {
        self.rows = rows
        self.columns = columns
        self.data = DataBuffer(count: rows * columns, fill: fill)
    }

    /// Create a matrix from an array of scalar values. The matrix size is m x n where
    /// m is number of rows and n is number of columns.
    /// - Parameters:
    ///   - rows: Number of rows in the matrix.
    ///   - columns: Number of columns in the matrix.
    ///   - values: Array of scalar values for each matrix element.
    public init(rows: Int, columns: Int, values: [Scalar]) {
        self.rows = rows
        self.columns = columns
        self.data = DataBuffer(array: values)
    }

    // Create matrix from a mutable memory buffer. Internal use only.
    init(rows: Int, columns: Int, buffer: UnsafeMutableBufferPointer<Scalar>) {
        self.rows = rows
        self.columns = columns
        self.data = DataBuffer(buffer: buffer)
    }

    /// Get and set a matrix value using the row and column index.
    public subscript(row: Int, column: Int) -> Scalar {
        get { return self.buffer[(row * self.columns) + column] }
        set { self.buffer[(row * self.columns) + column] = newValue }
    }

    /// Get and set row values using the row index.
    public subscript(row row: Int) -> Matrix {
        get {
            let start = row * self.columns
            let end = row * self.columns + self.columns
            let mat = Matrix(rows: 1, columns: self.columns)
            mat.buffer[0..<self.columns] = self.buffer[start..<end]
            return mat
        }
        set {
            let start = row * self.columns
            let end = row * self.columns + self.columns
            self.buffer[start..<end] = newValue.buffer[0..<self.columns]
        }
    }

    /// Get and set column values using the column index.
    public subscript(column column: Int) -> [Scalar] {
        get {
            var result = [Scalar](repeating: 0 as! Scalar, count: self.rows)
            for i in 0..<self.rows {
                let index = i * self.columns + column
                result[i] = self.buffer[index]
            }
            return result
        }
        set {
            for i in 0..<rows {
                let index = i * self.columns + column
                self.buffer[index] = newValue[i]
            }
        }
    }

    /// Make a copy of the matrix along with its underlying data buffer.
    /// - Returns: A copy of the matrix.
    public func copy() -> Matrix {
        Matrix(rows: self.rows, columns: self.columns, buffer: self.buffer)
    }
}

extension Matrix: ExpressibleByArrayLiteral {

    public init(arrayLiteral elements: [Scalar]...) {
        self.init(elements)
    }
}

extension Matrix: Sequence, IteratorProtocol {

    public mutating func next() -> [Scalar]? {
        if nextRowStartIndex == self.count {
            return nil
        } else {
            let currentRowStartIndex = nextRowStartIndex
            nextRowStartIndex += self.columns
            let a = Array(self.buffer[currentRowStartIndex..<nextRowStartIndex])
            return a
        }
    }
}
