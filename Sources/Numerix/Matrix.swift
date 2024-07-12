/*
 Matrix structure for two-dimensional numerical data. The underlying data storage
 is a mutable buffer handled by the DataBuffer class.
 */

import Accelerate

/// A two-dimensional collection of numerical values.
public struct Matrix<T> {

    /// Number of rows in the matrix.
    public let rows: Int

    /// Number of columns in the matrix.
    public let columns: Int

    // This is used by the iterator, see next() function in Sequence, IteratorProtocol extension
    private var nextRowStartIndex = 0

    // Class reference to a mutable buffer for underlying data storage.
    private let data: DataBuffer<T>

    /// Mutable buffer for underlying data storge and access.
    var buffer: UnsafeMutableBufferPointer<T> {
        get { self.data.buffer }
        set { self.data.buffer = newValue }
    }
    
    /// Create an empty matrix with size m x n where m is number of rows and n is number of columns.
    /// - Parameters:
    ///   - rows: Number of rows in the matrix.
    ///   - columns: Number of columns in the matrix.
    public init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.data = DataBuffer(count: rows * columns)
    }

    /// Create a matrix from an array of values. The matrix size is m x n where m is number of rows and n is number of columns.
    /// - Parameters:
    ///   - rows: Number of rows in the matrix.
    ///   - columns: Number of columns in the matrix.
    ///   - values: Array of values for each matrix element.
    public init(rows: Int, columns: Int, values: Array<T>) {
        self.rows = rows
        self.columns = columns
        self.data = DataBuffer(array: values)
    }

    /// Create a matrix filled with a given value.
    /// - Parameters:
    ///   - rows: Number of rows in the matrix.
    ///   - columns: Number of columns in the matrix.
    ///   - fill: Value to fill each matrix element.
    public init(rows: Int, columns: Int, fill: T) {
        self.rows = rows
        self.columns = columns
        self.data = DataBuffer(count: rows * columns, fill: fill)
    }

    /// Create a matrix using embedded arrays such as [[1, 2], [3, 4]].
    /// - Parameter content: Embedded arrays.
    public init(_ content: [[T]]) {
        self.rows = content.count
        self.columns = content[0].count
        self.data = DataBuffer(array: content.flatMap { $0 })
    }

    /// Get and set value at row and column index.
    public subscript(row: Int, column: Int) -> T {
        get { return self.buffer[(row * self.columns) + column] }
        set { self.buffer[(row * self.columns) + column] = newValue }
    }

    /// Get and set values at row index.
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

    /// Get and set values at column index.
    public subscript(column column: Int) -> [T] {
        get {
            var result = [T](repeating: 0 as! T, count: self.rows)
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

    /// Find the index of the largest absolute value in the matrix with single precision.
    /// - Parameter stride: Stride within the flattened matrix. Default is 1 for every element.
    /// - Returns: Row and column index corresponding to the largest absolute value.
    public func maxAbsIndex(stride: Int = 1) -> (Int, Int) where T == Float {
        //let index = cblas_isamax(self.values.count, self.values, stride)
        let index = cblas_isamax(self.buffer.count, self.buffer.baseAddress, stride)
        let row = index % self.rows
        let col = index / self.columns
        return (row, col)
    }

    /// Find the index of the largest absolute value in the matrix with double precision.
    /// - Parameter stride: Stride within the flattened matrix. Default is 1 for every element.
    /// - Returns: Row and column index corresponding to the largest absolute value.
    public func maxAbsIndex(stride: Int = 1) -> (Int, Int) where T == Double {
        //let index = cblas_idamax(self.values.count, self.values, stride)
        let index = cblas_idamax(self.buffer.count, self.buffer.baseAddress, stride)
        let row = index / self.rows
        let col = index % self.columns
        return (row, col)
    }
}

extension Matrix: ExpressibleByArrayLiteral {

    /// Create a matrix using an array literal.
    ///
    /// Examples of using an array literal to create a matrix.
    ///
    /// ```swift
    /// // Create a matrix of integers
    /// let mat: Matrix = [[1, 2, 3], [4, 5, 6]]
    ///
    /// // Create a matrix of doubles
    /// let mat: Matrix = [[1, 2, 3.8],
    ///                    [4, 5.1, 6]]
    ///
    /// // Create matrix of doubles where values given as integers
    /// let mat: Matrix<Double> = [[1, 2, 3],
    ///                            [4, 5, 6]]
    /// ```
    ///
    /// - Parameter elements: Values in the vector.
    public init(arrayLiteral elements: [T]...) {
        self.init(elements)
    }
}

extension Matrix: Equatable where T: Equatable {

    /// Compare two matrices for equality.
    /// - Parameters:
    ///   - lhs: The first matrix.
    ///   - rhs: The second matrix.
    /// - Returns: True if both matrices are same dimension and contain the same values.
    public static func == (lhs: Matrix, rhs: Matrix) -> Bool {
        let n = lhs.rows * lhs.columns
        let cmp = memcmp(lhs.buffer.baseAddress, rhs.buffer.baseAddress, MemoryLayout<T>.size * n)
        let buffersEqual = cmp == 0 ? true : false
        return lhs.rows == rhs.rows && lhs.columns == rhs.columns && buffersEqual
    }
}

extension Matrix: Sequence, IteratorProtocol {

    public mutating func next() -> [T]? {
        if nextRowStartIndex == self.rows * self.columns {
            return nil
        } else {
            let currentRowStartIndex = nextRowStartIndex
            nextRowStartIndex += self.columns
            let a = Array(self.buffer[currentRowStartIndex..<nextRowStartIndex])
            return a
        }
    }
}
