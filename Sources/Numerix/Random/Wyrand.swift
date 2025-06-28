/*
Wyrand pseudorandom number generator (PRNG).
Based on the wyrand and wyhash functions by Wang Yi.

References:
https://github.com/wangyi-fudan/wyhash
https://lemire.me/blog/2019/03/19/the-fastest-conventional-random-number-generator-that-can-pass-big-crush/
*/

import Foundation

public struct Wyrand: RandomNumberGenerator {
    private var state: UInt64

    public init(seed: UInt64? = nil) {
        state = seed ?? UInt64(abs(UUID().hashValue))
    }

    public mutating func next() -> UInt64 {
        state &+= 0x2d358dccaa6c78a5
        let mul = state.multipliedFullWidth(by: state ^ 0x8bb84b93962eacc9)
        return mul.low ^ mul.high
    }

    /// Generate a random single-precision value from a uniform distribution over [0, 1) which includes zero but
    /// excludes one.
    /// - Returns: Random single-precision value.
    public mutating func nextUniform() -> Float {
        let x = self.next()
        return Float(x >> 40) * 0x1.0p-24
    }

    /// Generate a random double-precision value from a uniform distribution over [0, 1) which includes zero but
    /// excludes one.
    /// - Returns: Random double-precision value.
    public mutating func nextUniform() -> Double {
        let x = self.next()
        return Double(x >> 11) * 0x1.0p-53
    }
}
