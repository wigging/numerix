/*
Matrix extension for Pad protocol.
*/

extension Matrix where Scalar: Pad, Scalar: Numeric {

    /// Pad a matrix with a constant value.
    ///
    /// Create a padded matrix with zeros.
    /// ```swift
    /// let a: Matrix<Float> = [[1, 2],
    ///                         [3, 4]]
    /// let p = a.pad()
    /// // The matrix p has values of
    /// // 0 0 0 0
    /// // 0 1 2 0
    /// // 0 3 4 0
    /// // 0 0 0 0
    /// ```
    /// Create a padded matrix using a value of 9.
    /// ```swift
    /// let a: Matrix<Float> = [[1, 2],
    ///                         [3, 4]]
    /// let p = a.pad(with: 9)
    /// // The matrix p has values of
    /// // 9 9 9 9
    /// // 9 1 2 9
    /// // 9 3 4 9
    /// // 9 9 9 9
    /// ```
    ///
    /// - Parameter value: The scalar value for padding the matrix. Default is 0.
    /// - Returns: A padded matrix with zeros or some other value along its border.
    public func pad(with value: Scalar = .zero) -> Matrix {
        Scalar.pad(a: self, value: value)
    }
}
