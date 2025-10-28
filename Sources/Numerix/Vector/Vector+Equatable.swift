/*
Vector extension to conform to Equatable protocol.
*/

import Accelerate

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
