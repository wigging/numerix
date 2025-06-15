/*
Linear algebra protocol.
Linear algebra extensions for Int, Float, and Double.
Linear algebra extensions for Vector and Matrix.
Linear algebra swap functions.
*/

import Accelerate

@_documentation(visibility: private)
public protocol Algebra {

    static func dot(_ a: Vector<Self>, _ b: Vector<Self>) -> Self
    static func norm(_ a: Vector<Self>) -> Self
    static func scale(_ a: inout Vector<Self>, by k: Self)
    static func sum(_ a: Vector<Self>) -> Self
    static func absoluteSum(_ a: Vector<Self>) -> Self
    static func cumulativeSum(_ a: Vector<Self>) -> Vector<Self>
    static func swapValues(a: inout Vector<Self>, b: inout Vector<Self>)

    static func norm(_ a: Matrix<Self>) -> Self
    static func scale(_ a: inout Matrix<Self>, by k: Self)
    static func transpose(_ a: Matrix<Self>) -> Matrix<Self>
    static func swapValues(a: inout Matrix<Self>, b: inout Matrix<Self>)
}

@_documentation(visibility: private)
extension Int: Algebra {

    // Vector

    public static func swapValues(a: inout Vector<Int>, b: inout Vector<Int>) {
        precondition(a.size == b.size, "Vectors must be same size")
        swap(&a.buffer, &b.buffer)
    }

    public static func dot(_ a: Vector<Int>, _ b: Vector<Int>) -> Int {
        var res = Int.zero
        for (x, y) in zip(a.buffer, b.buffer) {
            res += x * y
        }
        return res
    }

    public static func norm(_ a: Vector<Int>) -> Int {
        var sumOfSquares = 0

        for i in 0..<a.size {
            sumOfSquares &+= a[i] * a[i]
        }

        let result = sqrt(Float(sumOfSquares))
        return Int(result)
    }

    public static func scale(_ a: inout Vector<Int>, by k: Int) {
        a *= k
    }

    public static func sum(_ a: Vector<Int>) -> Int {
        var res = Int.zero
        for i in 0..<a.size {
            res += a[i]
        }
        return res
    }

    public static func absoluteSum(_ a: Vector<Int>) -> Int {
        var res = Int.zero
        for i in 0..<a.size {
            res += abs(a[i])
        }
        return res
    }

    public static func cumulativeSum(_ a: Vector<Int>) -> Vector<Int> {
        var cumulative = Vector(like: a)
        var runningTotal = 0
        for i in 0..<a.size {
            runningTotal += a[i]
            cumulative[i] = runningTotal
        }
        return cumulative
    }

    // Matrix

    public static func swapValues(a: inout Matrix<Int>, b: inout Matrix<Int>) {
        precondition(a.rows == b.rows && a.columns == b.columns, "Matrices must have same shape")
        swap(&a, &b)
    }

    public static func norm(_ a: Matrix<Int>) -> Int {
        var sumOfSquares = 0
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                sumOfSquares &+= a[i, j] * a[i, j]
            }
        }
        let result = sqrt(Float(sumOfSquares))
        return Int(result)
    }

    public static func scale(_ a: inout Matrix<Int>, by k: Int) {
        a = a .* k
    }

    public static func transpose(_ a: Matrix<Int>) -> Matrix<Int> {
        var transposed = Matrix<Int>(rows: a.columns, columns: a.rows)
        for i in 0..<a.rows {
            for j in 0..<a.columns {
                transposed[j, i] = a[i, j]
            }
        }
        return transposed
    }
}

@_documentation(visibility: private)
extension Float: Algebra {

    // Vector

    public static func swapValues(a: inout Vector<Float>, b: inout Vector<Float>) {
        precondition(a.size == b.size, "Vectors must be same size")
        cblas_sswap(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func dot(_ a: Vector<Float>, _ b: Vector<Float>) -> Float {
        cblas_sdot(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func norm(_ a: Vector<Float>) -> Float {
        cblas_snrm2(a.size, a.buffer.baseAddress, 1)
    }

    public static func scale(_ a: inout Vector<Float>, by k: Float) {
        cblas_sscal(a.size, k, a.buffer.baseAddress, 1)
    }

    public static func sum(_ a: Vector<Float>) -> Float {
        vDSP.sum(a.buffer)
    }

    public static func absoluteSum(_ a: Vector<Float>) -> Float {
        cblas_sasum(a.size, a.buffer.baseAddress, 1)
    }

    public static func cumulativeSum(_ a: Vector<Float>) -> Vector<Float> {
        var s: Float = 1.0             // scalar weighting factor for A
        let n = vDSP_Length(a.size)    // number of elements to process

        var result = Vector(like: a)
        vDSP_vrsum(a.buffer.baseAddress!, 1, &s, result.buffer.baseAddress!, 1, n)
        vDSP.add(a[0], result.buffer, result: &result.buffer)

        return result
    }

    // Matrix

    public static func swapValues(a: inout Matrix<Float>, b: inout Matrix<Float>) {
        precondition(a.rows == b.rows && a.columns == b.columns, "Matrices must have same shape")
        cblas_sswap(a.buffer.count, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func norm(_ a: Matrix<Float>) -> Float {
        cblas_snrm2(a.buffer.count, a.buffer.baseAddress, 1)
    }

    public static func scale(_ a: inout Matrix<Float>, by k: Float) {
        cblas_sscal(a.rows * a.columns, k, a.buffer.baseAddress, 1)
    }

    public static func transpose(_ a: Matrix<Float>) -> Matrix<Float> {
        let m = vDSP_Length(a.columns)
        let n = vDSP_Length(a.rows)
        let mat = Matrix<Float>(rows: a.columns, columns: a.rows)
        vDSP_mtrans(a.buffer.baseAddress!, 1, mat.buffer.baseAddress!, 1, m, n)
        return mat
    }
}

@_documentation(visibility: private)
extension Double: Algebra {

    // Vector

    public static func swapValues(a: inout Vector<Double>, b: inout Vector<Double>) {
        precondition(a.size == b.size, "Vectors must be same size")
        cblas_dswap(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func dot(_ a: Vector<Double>, _ b: Vector<Double>) -> Double {
        cblas_ddot(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func norm(_ a: Vector<Double>) -> Double {
        cblas_dnrm2(a.size, a.buffer.baseAddress, 1)
    }

    public static func scale(_ a: inout Vector<Double>, by k: Double) {
        cblas_dscal(a.size, k, a.buffer.baseAddress, 1)
    }

    public static func sum(_ a: Vector<Double>) -> Double {
        vDSP.sum(a.buffer)
    }

    public static func absoluteSum(_ a: Vector<Double>) -> Double {
        cblas_dasum(a.size, a.buffer.baseAddress, 1)
    }

    public static func cumulativeSum(_ a: Vector<Double>) -> Vector<Double> {
        var s = 1.0                    // scalar weighting factor for A
        let n = vDSP_Length(a.size)    // number of elements to process

        var result = Vector(like: a)
        vDSP_vrsumD(a.buffer.baseAddress!, 1, &s, result.buffer.baseAddress!, 1, n)
        vDSP.add(a[0], result.buffer, result: &result.buffer)

        return result
    }

    // Matrix

    public static func swapValues(a: inout Matrix<Double>, b: inout Matrix<Double>) {
        precondition(a.rows == b.rows && a.columns == b.columns, "Matrices must have same shape")
        cblas_dswap(a.buffer.count, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func norm(_ a: Matrix<Double>) -> Double {
        cblas_dnrm2(a.buffer.count, a.buffer.baseAddress, 1)
    }

    public static func scale(_ a: inout Matrix<Double>, by k: Double) {
        cblas_dscal(a.rows * a.columns, k, a.buffer.baseAddress, 1)
    }

    public static func transpose(_ a: Matrix<Double>) -> Matrix<Double> {
        let m = vDSP_Length(a.columns)
        let n = vDSP_Length(a.rows)
        let mat = Matrix<Double>(rows: a.columns, columns: a.rows)
        vDSP_mtransD(a.buffer.baseAddress!, 1, mat.buffer.baseAddress!, 1, m, n)
        return mat
    }
}

extension Vector where Scalar: Algebra {

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
        return Scalar.dot(self, b)
    }

    /// The Euclidean norm of the vector. Also known as the L² norm, 2-norm,
    /// vector magnitude, or Euclidean length.
    /// - Returns: The vector norm.
    public func norm() -> Scalar {
        Scalar.norm(self)
    }

    /// Multiply each value in the vector by a constant.
    ///
    /// For integer vectors, this performs element-wise multiplication. For
    /// single and double precision vectors this uses BLAS routines `sscal`
    /// and `dscal` respectively.
    ///
    /// - Parameter k: The scaling factor.
    public mutating func scale(by k: Scalar) {
        Scalar.scale(&self, by: k)
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
        Scalar.sum(self)
    }

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
        Scalar.absoluteSum(self)
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
        Scalar.cumulativeSum(self)
    }
}

extension Matrix where Scalar: Algebra {

    /// The Euclidean norm of the matrix. Also known as the 2-norm or maximum singular value.
    /// - Returns: The matrix norm.
    public func norm() -> Scalar {
        Scalar.norm(self)
    }

    /// Multiply each value in the matrix by a constant.
    ///
    /// For integer matrices, this performs element-wise multiplication. For
    /// single and double precision matrices this uses BLAS routines `sscal`
    /// and `dscal` respectively.
    ///
    /// - Parameter k: The scaling factor.
    public mutating func scale(by k: Scalar) {
        Scalar.scale(&self, by: k)
    }

    /// Transpose the matrix and return the result.
    /// - Returns: The transposed matrix.
    public func transpose() -> Matrix {
        Scalar.transpose(self)
    }
}

/// Swap the values of two vectors.
///
/// In this example the scalar values in `vec1` are exchanged for the values in `vec2` and vice versa.
/// ```swift
/// var vec1 = Vector<Float>([2, 3, 4, 5, 6])
/// var vec2 = Vector<Float>([9, 8, 7, 10, 12])
/// swapValues(&vec1, &vec2)
/// ```
/// - Parameters:
///   - a: The first vector.
///   - b: The second vector.
public func swapValues<Scalar: Algebra>(_ a: inout Vector<Scalar>, _ b: inout Vector<Scalar>) {
    Scalar.swapValues(a: &a, b: &b)
}

/// Swap the values of two matrices.
///
/// In this example the scalar values in `mat1` are exchanged for the values in `mat2` and vice versa.
/// ```swift
/// var mat1 = Matrix<Float>([[2, 3, 4], [5, 6, 7]])
/// var mat2 = Matrix<Float>([[9, 8, 7], [10, 12, 13]])
/// swapValues(&mat1, &mat2)
/// ```
/// - Parameters:
///   - a: The first matrix.
///   - b: The second matrix.
public func swapValues<Scalar: Algebra>(_ a: inout Matrix<Scalar>, _ b: inout Matrix<Scalar>) {
    Scalar.swapValues(a: &a, b: &b)
}
