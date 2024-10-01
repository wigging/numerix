/*
Summation functions for single and double-precision vectors.
*/

import Accelerate

/// Sum the values in a single-precision vector.
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

/// Sum the values in a double-precision vector.
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
    let n = vDSP_Length(vec.length)  // number of elements to process

    var result = Vector<Float>(length: vec.length)
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
    let n = vDSP_Length(vec.length)  // number of elements to process

    var result = Vector<Double>(length: vec.length)
    vDSP_vrsumD(vec.buffer.baseAddress!, ia, &s, result.buffer.baseAddress!, ic, n)
    vDSP.add(vec[0], result.buffer, result: &result.buffer)

    return result
}
