/*
WyRand pseudorandom number generator (PRNG) based on wyrand and wyhash functions by Wang Yi.

Original code for wyrand and wyhash functions
https://github.com/wangyi-fudan/wyhash

Also see Daniel Lemire's article about wyhash
https://lemire.me/blog/2019/03/19/the-fastest-conventional-random-number-generator-that-can-pass-big-crush/
*/

import Foundation

public struct WyRand: RandomNumberGenerator {
    private var state: UInt64

    public init(seed: UInt64? = nil) {
        state = seed ?? UInt64(abs(UUID().hashValue))
    }

    public mutating func next() -> UInt64 {
        state &+= 0x2d358dccaa6c78a5
        let mul = state.multipliedFullWidth(by: state ^ 0x8bb84b93962eacc9)
        return mul.low ^ mul.high
    }

    public mutating func nextUniform() -> Float {
        let x = self.next()
        return Float(x >> 40) * 0x1.0p-24
    }

    public mutating func nextUniform() -> Double {
        let x = self.next()
        return Double(x >> 11) * 0x1.0p-53
    }
}
