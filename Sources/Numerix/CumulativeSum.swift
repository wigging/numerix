//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 6/11/24.
//

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

    let c = [Float](unsafeUninitializedCapacity: a.length) { buffer, initializedCount in
        vDSP_vrsum(a.values, ia, &s, buffer.baseAddress!, ic, n)
        vDSP.add(a[0], buffer, result: &buffer)
        initializedCount = a.length
    }

    let vec = Vector(c)
    return vec
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

    let c = [Double](unsafeUninitializedCapacity: a.length) { buffer, initializedCount in
        vDSP_vrsumD(a.values, ia, &s, buffer.baseAddress!, ic, n)
        vDSP.add(a[0], buffer, result: &buffer)
        initializedCount = a.length
    }

    let vec = Vector(c)
    return vec
}
