/*
Vector extension to conform to Algebra protocol.
*/

extension Vector where Scalar: Algebra {

    /// Sum of the absolute values in the vector.
    ///
    /// This examples calculates the absolute sum of the values in vector `a`.
    /// ```swift
    /// let a = Vector<Float>([1, 2, -3, 4, -6.8])
    /// let c = a.absoluteSum()
    /// // c is 16.8
    /// ```
    ///
    /// - Returns: Sum of absolute values.
    public func absoluteSum() -> Scalar {
        Scalar.absoluteSum(a: self)
    }

    /// Copy contents of vector `b` into vector `a` such that `a == b`.
    ///
    /// This uses the BLAS `copy` routine for Float and Double values.
    /// - Parameter b: The vector that is copied.
    public func copy(_ b: Vector) {
        Scalar.copy(a: self, b: b)
    }

    /// Calculate the cumulative sum of the vector.
    ///
    /// This returns a vector that is the cumulative sum of the scalar values.
    /// ```swift
    /// let a = Vector([1, 2, 3, 4, 5])
    /// let c = a.cumulativeSum()
    /// // c is Vector with values [1, 3, 6, 10, 15]
    /// ```
    ///
    /// - Returns: Cumulative sum vector.
    public func cumulativeSum() -> Vector {
        Scalar.cumulativeSum(a: self)
    }

    /// Calculate the dot product of two vectors.
    ///
    /// This calculates the dot product as `c = aᵀb` where `a` and `b` are vectors
    /// that must be the same length.
    /// ```swift
    /// let a: Vector<Float> = [1, 2, 3, 4, 5]
    /// let b: Vector<Float> = [9, 2, 3, 4, 5]
    /// let c = a.dot(b)
    /// // c is 63.0
    /// ```
    ///
    /// - Parameter b: The second vector.
    /// - Returns: The dot product of two vectors
    public func dot(_ b: Vector) -> Scalar {
        precondition(self.size == b.size, "Vectors must be same size")
        return Scalar.dot(a: self, b: b)
    }

    /// The Euclidean norm of the vector. Also known as the L² norm, 2-norm,
    /// vector magnitude, or Euclidean length.
    /// - Returns: The vector norm.
    public func norm() -> Scalar {
        Scalar.norm(a: self)
    }

    /// Multiply each value in the vector by a constant.
    ///
    /// For integer vectors, this performs element-wise multiplication. For
    /// single and double precision vectors this uses BLAS routines `sscal`
    /// and `dscal` respectively.
    ///
    /// - Parameter k: The scaling factor.
    public mutating func scale(by k: Scalar) {
        Scalar.scale(a: &self, by: k)
    }

    /// Sum of the vector values.
    ///
    /// This example calculates the sum of the values in vector `a`.
    /// ```swift
    /// let a = Vector([1, 2, 3, 4, 5])
    /// let c = a.sum()
    /// // c is 15
    /// ```
    ///
    /// - Returns: Sum of the values.
    public func sum() -> Scalar {
        Scalar.sum(a: self)
    }

    /// Update the vector with element-wise addition of another vector multiplied by a scalar value.
    ///
    /// This performs the Level 1 BLAS operation axpy which is represented by equation `y = y + αx` where `y` and `x`
    /// are vectors and `α` is a scalar value.
    /// - Parameters:
    ///   - b: The vector `b` in `a = a + b * k`.
    ///   - k: The scalar value `k` in `a = a + b * k`.
    public mutating func update(with b: Vector, times k: Scalar = 1) where Scalar: Numeric {
        Scalar.update(a: &self, k: k, b: b)
    }
}
