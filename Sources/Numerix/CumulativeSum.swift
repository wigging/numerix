/*
 Cumulative sum for single and double precision Vector.
 */

import Accelerate

/// Cumulative sum of a single-precision vector.
/// ```swift
/// let a: Vector<Float> = [1, 2, 3, 4, 5]
/// let c = cumulativeSum(a)
/// // c is single-precision vector [1, 3, 6, 10, 15]
/// ```
/// - Parameter a: The input vector.
/// - Returns: The output vector.
public func cumulativeSum(_ a: Vector<Float>) -> Vector<Float> {
    let ia = 1                     // stride for A
    var s: Float = 1.0             // scalar weighting factor for A
    let ic = 1                     // stride for C
    let n = vDSP_Length(a.length)  // number of elements to process

    var result = Vector<Float>(length: a.length)
    vDSP_vrsum(a.buffer.baseAddress!, ia, &s, result.buffer.baseAddress!, ic, n)
    vDSP.add(a[0], result.buffer, result: &result.buffer)

    return result
}

/// Cumulative sum of a double-precision vector.
/// ```swift
/// let a: Vector<Float> = [1, 2, 3, 4, 5]
/// let c = cumulativeSum(a)
/// // c is double-precision vector [1, 3, 6, 10, 15]
/// ```
/// - Parameter a: The input vector.
/// - Returns: The output vector.
public func cumulativeSum(_ a: Vector<Double>) -> Vector<Double> {
    let ia = 1                     // stride for A
    var s = 1.0                    // scalar weighting factor for A
    let ic = 1                     // stride for C
    let n = vDSP_Length(a.length)  // number of elements to process

    var result = Vector<Double>(length: a.length)
    vDSP_vrsumD(a.buffer.baseAddress!, ia, &s, result.buffer.baseAddress!, ic, n)
    vDSP.add(a[0], result.buffer, result: &result.buffer)

    return result
}
