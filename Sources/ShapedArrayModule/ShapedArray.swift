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

extension ShapedArray: CustomStringConvertible where Scalar: NumberStyle {

    public var description: String {

        // Handle one-dimension array
        if shape.count == 1 || shape.count == 2 && shape[0] == 1 {
            var descr = "( "
            descr += self.buffer.map { "\($0)" }.joined(separator: "  ")
            descr += " )"
            return descr
        }

        // Chunk size is number of columns
        let chunkSize = shape.last ?? 1

        let chunks = stride(from: 0, to: self.buffer.count, by: chunkSize).map {
            Array(self.buffer[$0..<min($0 + chunkSize, self.buffer.count)])
        }

        // Width used for the printed elements is based on max character length
        let width = self.buffer.map { "\($0)".count }.max() ?? 1

        // Get each line of the printed array, each line represents a row
        let lines = chunks.map { row in
            row.map { element in
                (String(repeating: " ", count: width) + "\(element)").suffix(width)
            }.joined(separator: "  ")
        }

        // Last rows for each sub-matrix
        var r = shape
        r.removeLast()
        r.reverse()
        let rows = getLastRows(r)

        // Counter and variable to store description
        var n = 0
        var descr = ""

        // Add a line to the description.
        func addToDescription(line: String) {

            // Prepend symbol or space to the row
            for row in rows.reversed() {
                switch n % (row + 1) {
                case 0:
                    if row == 1 { descr += "( " } else { descr += "⎛ " }
                case row - 1:
                    descr += "⎝ "
                case row:
                    descr += "  "
                default:
                    descr += "⎜ "
                }
            }

            // Add line after prepended symbol
            descr += line

            // Append symbol or space to the row
            for row in rows {
                switch n % (row + 1) {
                case 0:
                    if row == 1 { descr += " )" } else { descr += " ⎞" }
                case row - 1:
                    descr += " ⎠"
                case row:
                    descr += "  "
                default:
                    descr += " ⎟"
                }
            }

            // Line return except at end of description
            if n != rows.last! - 1 { descr += "\n" }

            n += 1
        }

        // Last row of the first sub-matrix
        let last = rows.first ?? 1

        // Create each line for the description
        for line in lines {
            if n % (last + 1) == last {
                addToDescription(line: String(repeating: " ", count: (width + 2) * chunkSize - 2))
            }
            addToDescription(line: line)
        }

        return descr
    }
}

extension ShapedArray: CustomDebugStringConvertible where Scalar: NumberStyle {

    public var debugDescription: String {
        """
        \(self.shape.map { "\($0)" }.joined(separator: "x")) \(type(of: self))
        \(self.description)
        """
    }
}
