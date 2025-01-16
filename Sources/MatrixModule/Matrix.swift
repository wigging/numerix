/*
 Matrix structure.
 */

import Accelerate

/// A two-dimensional structure for numerical data.
public struct Matrix<Scalar> {

    private let data: DataBuffer<Scalar>

    var buffer: UnsafeMutableBufferPointer<Scalar> {
        get { self.data.buffer }
        set { self.data.buffer = newValue }
    }

    public let rows: Int
    public let columns: Int

    /// Create a matrix using standard Swift arrays.
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

    init(rows: Int, columns: Int, fill: Scalar) {
        self.rows = rows
        self.columns = columns
        self.data = DataBuffer(count: rows * columns, fill: fill)
    }

    // Create matrix from a buffer. Internal use only.
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

extension Matrix: CustomStringConvertible where Scalar: NumberStyle {

    public var description: String {
        // Max integer width and fraction width for each matrix column
        var maxIntWidth = Array(repeating: 0, count: self.columns)
        var maxFracWidth = Array(repeating: 0, count: self.columns)

        for i in 0..<self.rows {
            for j in 0..<self.columns {
                maxIntWidth[j] = max(maxIntWidth[j], self[i, j].integerLength)
                maxFracWidth[j] = max(maxFracWidth[j], self[i, j].fractionLength)
            }
        }

        // Matrix values as strings with padding
        var desc = ""

        for i in 0..<self.rows {
            switch i {
            case 0:
                desc += "⎛ "
            case self.rows - 1:
                desc += "⎝ "
            default:
                desc += "⎜ "
            }

            for j in 0..<self.columns {
                let leftPad = String(repeating: " ", count: maxIntWidth[j] - self[i, j].integerLength)
                let rightPad = String(repeating: " ", count: maxFracWidth[j] - self[i, j].fractionLength)
                let valDesc = leftPad + self[i, j].stringDescription + rightPad

                if j != self.columns - 1 {
                    desc += valDesc + "  "
                } else {
                    desc += valDesc
                }
            }

            switch i {
            case 0:
                desc += " ⎞\n"
            case self.rows - 1:
                desc += " ⎠"
            default:
                desc += " ⎟\n"
            }
        }

        return desc
    }
}

extension Matrix: CustomDebugStringConvertible where Scalar: NumberStyle {

    public var debugDescription: String {
        """
        \(self.rows)x\(self.columns) \(type(of: self))
        \(self.description)
        """
    }
}

extension Matrix: Equatable {

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
