/*
Matrix extension to conform to Equatable protocol.
*/

import Accelerate

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
