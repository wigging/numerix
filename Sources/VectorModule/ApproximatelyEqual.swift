/*
 Vector extension for approximate equality method.
 */

extension Vector {

    /// Compare two vectors of single precision for approximate equality.
    ///
    /// Returns true when `norm(x - y) ≤ max(atol, rtol × max(norm(x), norm(y)))`
    /// where `x` and `y` are vectors, `atol` is absolute tolerance, and `rtol`
    /// is relative tolerance.
    ///
    /// - Parameters:
    ///   - other: The other vector used for comparison.
    ///   - absoluteTolerance: The absolute tolerance, default is 0.
    ///   - relativeTolerance: The relative tolerance, default is 1e-6.
    /// - Returns: True when two vectors are approximately equal.
    public func isApproximatelyEqual(
        to other: Vector, absoluteTolerance: Float = 0, relativeTolerance: Float = 1e-6
    ) -> Bool where Scalar == Float {
        let delta = (self - other).norm()
        let scale = max(self.norm(), other.norm())
        return delta <= max(absoluteTolerance, relativeTolerance * scale)
    }

    /// Compare two vectors of double precision for approximate equality.
    ///
    /// Returns true when `norm(x - y) ≤ max(atol, rtol × max(norm(x), norm(y)))`
    /// where `x` and `y` are vectors, `atol` is absolute tolerance, and `rtol`
    /// is relative tolerance.
    ///
    /// - Parameters:
    ///   - other: The other vector used for comparison.
    ///   - absoluteTolerance: The absolute tolerance, default is 0.
    ///   - relativeTolerance: The relative tolerance, default is 1e-8.
    /// - Returns: True when two vectors are approximately equal.
    public func isApproximatelyEqual(
        to other: Vector, absoluteTolerance: Double = 0, relativeTolerance: Double = 1e-8
    ) -> Bool where Scalar == Double {
        let delta = (self - other).norm()
        let scale = max(self.norm(), other.norm())
        return delta <= max(absoluteTolerance, relativeTolerance * scale)
    }
}
