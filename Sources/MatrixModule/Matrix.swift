/*
 Matrix structure.
 */

import Accelerate

public struct Matrix<Scalar> {

    private let data: DataBuffer<Scalar>

    var buffer: UnsafeMutableBufferPointer<Scalar> {
        get { self.data.buffer }
        set { self.data.buffer = newValue }
    }

    public let rows: Int
    public let columns: Int

    public init(_ content: [[Scalar]]) {
        self.rows = content.count
        self.columns = content[0].count
        self.data = DataBuffer(array: content.flatMap { $0 })
    }

    public init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.data = DataBuffer(count: rows * columns)
    }

    public init(like matrix: Matrix) {
        self.rows = matrix.rows
        self.columns = matrix.columns
        self.data = DataBuffer(count: matrix.buffer.count)
    }

    subscript(row: Int, column: Int) -> Scalar {
        get { return self.buffer[(row * self.columns) + column] }
        set { self.buffer[(row * self.columns) + column] = newValue }
    }
}

extension Matrix where Scalar: MatrixArithmetic {

    /// Element-wise addition of a scalar and matrix using integers.
    /// - Parameters:
    ///   - lhs: The left-hand side scalar value.
    ///   - rhs: The right-hand side matrix.
    /// - Returns: Element-wise sum of a scalar and matrix.
    public static func + (lhs: Scalar, rhs: Matrix) -> Matrix {
        Scalar.add(rhs, lhs)
    }

    public static func + (lhs: Matrix, rhs: Scalar) -> Matrix {
        Scalar.add(lhs, rhs)
    }

    public static func + (lhs: Matrix, rhs: Matrix) -> Matrix {
        Scalar.add(lhs, rhs)
    }

    public static func += (lhs: inout Matrix, rhs: Matrix) {
        lhs = lhs + rhs
    }
}

extension Matrix: Equatable where Scalar: Equatable {

    /// Compare two matrices for equality.
    /// - Parameters:
    ///   - lhs: The first matrix.
    ///   - rhs: The second matrix.
    /// - Returns: True if both matrices are same dimension and contain the same values.
    public static func == (lhs: Matrix, rhs: Matrix) -> Bool {
        let n = lhs.buffer.count
        let cmp = memcmp(lhs.buffer.baseAddress, rhs.buffer.baseAddress, MemoryLayout<Scalar>.size * n)
        let buffersEqual = cmp == 0 ? true : false
        return lhs.rows == rhs.rows && lhs.columns == rhs.columns && buffersEqual
    }
}
