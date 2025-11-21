/*
Vector algebra procotol and associated extensions.

Note that there is already an `inverse` function in Swift.

Note that the `inv` implementation here uses LAPACK `dgetrf` and `dgetri` functions.
In LAPACK the INFO value is used as the index `i` in the error message, this index
is one-based so it needs to be zero-based (INFO - 1) for the Swift error message.
*/

import Accelerate

@_documentation(visibility: private)
public protocol VectorAlgebra {
    static func absoluteSum(a: Vector<Self>) -> Self
    static func copy(a: Vector<Self>, b: Vector<Self>)
    static func cumulativeSum(a: Vector<Self>) -> Vector<Self>
    static func dot(a: Vector<Self>, b: Vector<Self>) -> Self
    static func norm(a: Vector<Self>) -> Self
    static func scale(a: inout Vector<Self>, by k: Self)
    static func sum(a: Vector<Self>) -> Self
    static func swapValues(a: inout Vector<Self>, b: inout Vector<Self>)
    static func update(a: inout Vector<Self>, k: Self, b: Vector<Self>)
}

@_documentation(visibility: private)
extension Double: VectorAlgebra {

    public static func absoluteSum(a: Vector<Double>) -> Double {
        cblas_dasum(a.size, a.buffer.baseAddress, 1)
    }

    public static func copy(a: Vector<Double>, b: Vector<Double>) {
        cblas_dcopy(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func cumulativeSum(a: Vector<Double>) -> Vector<Double> {
        var s = 1.0                    // scalar weighting factor for A
        let n = vDSP_Length(a.size)    // number of elements to process

        var result = Vector(like: a)
        vDSP_vrsumD(a.buffer.baseAddress!, 1, &s, result.buffer.baseAddress!, 1, n)
        vDSP.add(a[0], result.buffer, result: &result.buffer)

        return result
    }

    public static func dot(a: Vector<Double>, b: Vector<Double>) -> Double {
        cblas_ddot(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func norm(a: Vector<Double>) -> Double {
        cblas_dnrm2(a.size, a.buffer.baseAddress, 1)
    }

    public static func scale(a: inout Vector<Double>, by k: Double) {
        cblas_dscal(a.size, k, a.buffer.baseAddress, 1)
    }

    public static func sum(a: Vector<Double>) -> Double {
        vDSP.sum(a.buffer)
    }

    public static func swapValues(a: inout Vector<Double>, b: inout Vector<Double>) {
        precondition(a.size == b.size, "Vectors must be same size")
        cblas_dswap(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func update(a: inout Vector<Double>, k: Double, b: Vector<Double>) {
        cblas_daxpy(b.size, k, b.buffer.baseAddress, 1, a.buffer.baseAddress, 1)
    }
}

@_documentation(visibility: private)
extension Float: VectorAlgebra {

    public static func absoluteSum(a: Vector<Float>) -> Float {
        cblas_sasum(a.size, a.buffer.baseAddress, 1)
    }

    public static func copy(a: Vector<Float>, b: Vector<Float>) {
        cblas_scopy(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func cumulativeSum(a: Vector<Float>) -> Vector<Float> {
        var s: Float = 1.0             // scalar weighting factor for A
        let n = vDSP_Length(a.size)    // number of elements to process

        var result = Vector(like: a)
        vDSP_vrsum(a.buffer.baseAddress!, 1, &s, result.buffer.baseAddress!, 1, n)
        vDSP.add(a[0], result.buffer, result: &result.buffer)

        return result
    }

    public static func dot(a: Vector<Float>, b: Vector<Float>) -> Float {
        cblas_sdot(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func norm(a: Vector<Float>) -> Float {
        cblas_snrm2(a.size, a.buffer.baseAddress, 1)
    }

    public static func scale(a: inout Vector<Float>, by k: Float) {
        cblas_sscal(a.size, k, a.buffer.baseAddress, 1)
    }

    public static func sum(a: Vector<Float>) -> Float {
        vDSP.sum(a.buffer)
    }

    public static func swapValues(a: inout Vector<Float>, b: inout Vector<Float>) {
        precondition(a.size == b.size, "Vectors must be same size")
        cblas_sswap(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func update(a: inout Vector<Float>, k: Float, b: Vector<Float>) {
        cblas_saxpy(b.size, k, b.buffer.baseAddress, 1, a.buffer.baseAddress, 1)
    }
}

@_documentation(visibility: private)
extension Int: VectorAlgebra {

    public static func absoluteSum(a: Vector<Int>) -> Int {
        var res = Int.zero
        for i in 0..<a.size {
            res += abs(a[i])
        }
        return res
    }

    public static func copy(a: Vector<Int>, b: Vector<Int>) {
        fatalError("Not supported for integer vectors")
    }

    public static func cumulativeSum(a: Vector<Int>) -> Vector<Int> {
        var cumulative = Vector(like: a)
        var runningTotal = 0
        for i in 0..<a.size {
            runningTotal += a[i]
            cumulative[i] = runningTotal
        }
        return cumulative
    }

    public static func dot(a: Vector<Int>, b: Vector<Int>) -> Int {
        var res = Int.zero
        for (x, y) in zip(a.buffer, b.buffer) {
            res += x * y
        }
        return res
    }

    public static func norm(a: Vector<Int>) -> Int {
        var sumOfSquares = 0

        for i in 0..<a.size {
            sumOfSquares &+= a[i] * a[i]
        }

        let result = sqrt(Float(sumOfSquares))
        return Int(result)
    }

    public static func scale(a: inout Vector<Int>, by k: Int) {
        a *= k
    }

    public static func sum(a: Vector<Int>) -> Int {
        var res = Int.zero
        for i in 0..<a.size {
            res += a[i]
        }
        return res
    }

    public static func swapValues(a: inout Vector<Int>, b: inout Vector<Int>) {
        precondition(a.size == b.size, "Vectors must be same size")
        swap(&a.buffer, &b.buffer)
    }

    public static func update(a: inout Vector<Int>, k: Int, b: Vector<Int>) {
        fatalError("Not supported for integer values")
    }
}

extension Vector where Scalar: VectorAlgebra {

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
