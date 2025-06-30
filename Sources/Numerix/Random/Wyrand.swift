/*
Wyrand pseudorandom number generator (PRNG).
Based on the wyrand and wyhash functions by Wang Yi.

References:
https://github.com/wangyi-fudan/wyhash
https://lemire.me/blog/2019/03/19/the-fastest-conventional-random-number-generator-that-can-pass-big-crush/
*/

import Foundation

/// Wyrand is a fast 64-bit pseudorandom number generator (PRNG) for floating-point numbers. This is the default PRNG
/// for Vector, Matrix, and ShapedArray types in Numerix.
public struct Wyrand: RandomNumberGenerator {
    private var state: UInt64

    /// Initialize the state of the generator.
    /// - Parameter seed: Seed with a 64-bit unsigned integer.
    public init(seed: UInt64? = nil) {
        state = seed ?? UInt64.random(in: 0..<UInt64.max)
    }

    /// Generate a random 64-bit unsigned integer.
    /// - Returns: Random 64-bit unsigned integer value.
    public mutating func next() -> UInt64 {
        state &+= 0x2d358dccaa6c78a5
        let mul = state.multipliedFullWidth(by: state ^ 0x8bb84b93962eacc9)
        return mul.low ^ mul.high
    }

    /// Generate a random single-precision value from a uniform distribution over [0, 1) which includes zero but
    /// excludes one.
    /// - Returns: Random single-precision value.
    public mutating func next() -> Float {
        Float(next() >> 40) * 0x1.0p-24
    }

    /// Generate a random double-precision value from a uniform distribution over [0, 1) which includes zero but
    /// excludes one.
    /// - Returns: Random double-precision value.
    public mutating func next() -> Double {
        Double(next() >> 11) * 0x1.0p-53
    }
}
