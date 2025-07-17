/*
ShapedArray extension to conform to Arithmetic protocol.
*/

extension ShapedArray where Scalar: Arithmetic {

    /// Element-wise addition of a scalar and shaped array.
    /// - Parameters:
    ///   - lhs: The left-hand side scalar value `k`.
    ///   - rhs: The right-hand side shaped array `A`.
    /// - Returns: A shaped array that is the result of `k + A`.
    public static func + (lhs: Scalar, rhs: ShapedArray) -> ShapedArray {
        Scalar.add(rhs, lhs)
    }

    /// Element-wise addition of a scalar and shaped array.
    /// - Parameters:
    ///   - lhs: The left-hand side shaped array `A`.
    ///   - rhs: The right-hand side scalar value `k`.
    /// - Returns: A shaped array that is the result of `A + k`.
    public static func + (lhs: ShapedArray, rhs: Scalar) -> ShapedArray {
        Scalar.add(lhs, rhs)
    }

    /// Element-wise addition of two shaped arrays.
    /// - Parameters:
    ///   - lhs: The left-hand side shaped array `A`.
    ///   - rhs: The right-hand side shaped array `B`.
    /// - Returns: A shaped array that is the result of `A + B`.
    public static func + (lhs: ShapedArray, rhs: ShapedArray) -> ShapedArray {
        Scalar.add(lhs, rhs)
    }

    /// In-place element-wise addition of a shaped array and scalar.
    /// - Parameters:
    ///   - left: The left-hand side mutable shaped array.
    ///   - right: The right-hand side scalar value.
    public static func += (left: inout ShapedArray, right: Scalar) {
        left = left + right
    }

    /// In-place element-wise addition of two shaped arrays.
    /// - Parameters:
    ///   - left: The left-hand side mutable input shaped array.
    ///   - right: The right-hand side shaped array to add to the left-hand side mutable shaped array.
    public static func += (left: inout ShapedArray, right: ShapedArray) {
        precondition(left.shape == right.shape, "Shaped arrays must have same shape")
        left = left + right
    }

    /// Element-wise subtraction of a scalar and shaped array.
    /// - Parameters:
    ///   - lhs: The left-hand side scalar value `k`.
    ///   - rhs: The right-hand side shaped array `A`.
    /// - Returns: A shaped array that is the result of `k - A`.
    public static func - (lhs: Scalar, rhs: ShapedArray) -> ShapedArray {
        Scalar.subtract(lhs, rhs)
    }

    /// Element-wise subtraction of a scalar and shaped array.
    /// - Parameters:
    ///   - lhs: The left-hand side shaped array `A`.
    ///   - rhs: The right-hand side scalar value `k`.
    /// - Returns: A shaped array that is the result of `A - k`.
    public static func - (lhs: ShapedArray, rhs: Scalar) -> ShapedArray {
        Scalar.subtract(lhs, rhs)
    }

    /// Element-wise subtraction of two shaped arrays.
    /// - Parameters:
    ///   - lhs: The left-hand side shaped array `A`.
    ///   - rhs: The right-hand side shaped array `B`.
    /// - Returns: A shaped array that is the result of `A + B`.
    public static func - (lhs: ShapedArray, rhs: ShapedArray) -> ShapedArray {
        Scalar.subtract(lhs, rhs)
    }

    /// Element-wise multiplication of a scalar value and a shaped array.
    /// - Parameters:
    ///   - lhs: The input scalar value `k` on the left-hand side.
    ///   - rhs: The input shaped array `A` on the right-hand side.
    /// - Returns: The output shaped array `B` where `k * A = B`.
    public static func * (lhs: Scalar, rhs: ShapedArray) -> ShapedArray {
        Scalar.multiply(rhs, lhs)
    }

    /// Element-wise multiplication of a shaped array and a scalar value.
    /// - Parameters:
    ///   - lhs: The input shaped array `A` on the left-hand side.
    ///   - rhs: The input scalar value `k` on the right-hand side.
    /// - Returns: The output shaped array `B` where `k * A = B`.
    public static func * (lhs: ShapedArray, rhs: Scalar) -> ShapedArray {
        Scalar.multiply(lhs, rhs)
    }

    /// Element-wise multiplication of two shaped arrays.
    /// - Parameters:
    ///   - lhs: The input shaped array `A` on the left-hand side.
    ///   - rhs: The input shaped array `B` on the right-hand side.
    /// - Returns: The output shaped array `C` where `A * B = C`.
    public static func * (lhs: ShapedArray, rhs: ShapedArray) -> ShapedArray {
        Scalar.multiply(lhs, rhs)
    }

    /// Element-wise division operator for dividing a scalar by a shaped array.
    /// - Parameters:
    ///   - lhs: The scalar value.
    ///   - rhs: The shaped array.
    /// - Returns: The element-wise division of a scalar by a shaped array.
    public static func / (lhs: Scalar, rhs: ShapedArray) -> ShapedArray {
        Scalar.divide(lhs, rhs)
    }

    /// Element-wise division operator for dividing a scalar by a shaped array.
    /// - Parameters:
    ///   - lhs: The shaped array.
    ///   - rhs: The scalar value.
    /// - Returns: The element-wise division of a scalar by a shaped array.
    public static func / (lhs: ShapedArray, rhs: Scalar) -> ShapedArray {
        Scalar.divide(lhs, rhs)
    }

    /// Element-wise division operator for dividing two shaped arrays. Shaped
    /// arrays must have the same shape.
    /// - Parameters:
    ///   - lhs: The left shaped array.
    ///   - rhs: The right shaped array.
    /// - Returns: The element-wise division of two shaped arrays.
    public static func / (lhs: ShapedArray, rhs: ShapedArray) -> ShapedArray {
        Scalar.divide(lhs, rhs)
    }

    /// In-place element-wise division of a shaped array and scalar.
    /// - Parameters:
    ///   - lhs: The left-hand side mutable shaped array.
    ///   - rhs: The right-hand side scalar value.
    public static func /= (lhs: inout ShapedArray, rhs: Scalar) {
        lhs = lhs / rhs
    }

    /// In-place element-wise division of two shaped arrays.
    /// - Parameters:
    ///   - lhs: The left-hand side mutable shaped array.
    ///   - rhs: The right-hand side shaped array.
    public static func /= (lhs: inout ShapedArray, rhs: ShapedArray) {
        precondition(lhs.shape == rhs.shape, "Shaped arrays must have the same shape")
        lhs = lhs / rhs
    }
}
