/*
Summation functions for single and double-precision vectors.
*/

import Accelerate

/// Sum of the values in a single-precision vector.
///
/// This function returns the sum of the vector values.
/// ```swift
/// let a = Vector<Float>([1, 2, 3, 4, 5])
/// let sumA = sum(a)  // sumA is 15.0
/// ```
/// - Parameter vec: The input vector.
/// - Returns: Sum of the vector values.
public func sum(_ vec: Vector<Float>) -> Float {
    return vDSP.sum(vec.buffer)
}

/// Sum of the values in a double-precision vector.
///
/// This function returns the sum of the vector values.
/// ```swift
/// let a = Vector<Double>([1, 2, 3, 4, 5])
/// let sumA = sum(a)  // sumA is 15.0
/// ```
/// - Parameter vec: The input vector.
/// - Returns: Sum of the vector values.
public func sum(_ vec: Vector<Double>) -> Double {
    return vDSP.sum(vec.buffer)
}

/// Sum of the absolute values in a single-precision vector.
///
/// This function returns the absolute sum of the vector values.
/// ```swift
/// let a = Vector<Float>([1, 2, -3, 4, -6.8])
/// let absA = absoluteSum(a)  // absA is 16.8
/// ```
/// - Parameter vec: The input vector.
/// - Returns: Absolute sum of the vector values.
public func absoluteSum(_ vec: Vector<Float>) -> Float {
    return cblas_sasum(vec.size, vec.buffer.baseAddress, 1)
}

/// Sum of the absolute values in a double-precision vector.
///
/// This function returns the absolute sum of the vector values.
/// ```swift
/// let a = Vector<Double>([1, 2, -3, 4, -6.8])
/// let absA = absoluteSum(a)  // absA is 16.8
/// ```
/// - Parameter vec: The input vector.
/// - Returns: Absolute sum of the vector values.
public func absoluteSum(_ vec: Vector<Double>) -> Double {
    return cblas_dasum(vec.size, vec.buffer.baseAddress, 1)
}

/// Cumulative sum of a single-precision vector.
///
/// This function returns a vector that is the cumulative sum of the input vector.
/// ```swift
/// let a: Vector<Float> = [1, 2, 3, 4, 5]
/// let c = cumulativeSum(a)  // c is vector of [1, 3, 6, 10, 15]
/// ```
/// - Parameter vec: The input vector.
/// - Returns: The output vector.
public func cumulativeSum(_ vec: Vector<Float>) -> Vector<Float> {
    let ia = 1                       // stride for A
    var s: Float = 1.0               // scalar weighting factor for A
    let ic = 1                       // stride for C
    let n = vDSP_Length(vec.size)  // number of elements to process

    var result = Vector<Float>(size: vec.size)
    vDSP_vrsum(vec.buffer.baseAddress!, ia, &s, result.buffer.baseAddress!, ic, n)
    vDSP.add(vec[0], result.buffer, result: &result.buffer)

    return result
}

/// Cumulative sum of a double-precision vector.
///
/// This function returns a vector that is the cumulative sum of the input vector.
/// ```swift
/// let a: Vector<Double> = [1, 2, 3, 4, 5]
/// let c = cumulativeSum(a)  // c is vector of [1, 3, 6, 10, 15]
/// ```
/// - Parameter vec: The input vector.
/// - Returns: The output vector.
public func cumulativeSum(_ vec: Vector<Double>) -> Vector<Double> {
    let ia = 1                       // stride for A
    var s = 1.0                      // scalar weighting factor for A
    let ic = 1                       // stride for C
    let n = vDSP_Length(vec.size)  // number of elements to process

    var result = Vector<Double>(size: vec.size)
    vDSP_vrsumD(vec.buffer.baseAddress!, ia, &s, result.buffer.baseAddress!, ic, n)
    vDSP.add(vec[0], result.buffer, result: &result.buffer)

    return result
}
