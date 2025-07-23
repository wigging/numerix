/*
Matrix extension for Padded protocol.
*/

extension Matrix where Scalar: Padded, Scalar: Numeric {
    /// Create a padded matrix with a constant value.
    /// - Parameters:
    ///   - top: Number of rows to add at the top.
    ///   - bottom: Number of rows to add at the bottom.
    ///   - left: Number of columns to add at the left.
    ///   - right: Number of columns to add at the right.
    ///   - value: The value used for padding. Default value is zero.
    /// - Returns: A new padded matrix.
    public func padded(top: Int, bottom: Int, left: Int, right: Int, with value: Scalar = 0) -> Matrix {
        Scalar.padded(a: self, top: top, bottom: bottom, left: left, right: right, value: value)
    }
    
    /// Create a uniformly padded matrix with a constant value.
    /// - Parameters:
    ///   - padding: Number of rows/columns to add on each side. Default is one.
    ///   - value: The value used for padding. Default value is zero.
    /// - Returns: A new padded matrix.
    public func padded(by padding: Int = 1, with value: Scalar = 0) -> Matrix {
        Scalar.padded(a: self, top: padding, bottom: padding, left: padding, right: padding, value: value)
    }
}
