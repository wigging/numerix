/*
Xoshiro128+ pseudorandom number generator (PRNG).
*/

import Accelerate

/// Xoshiro128+ is a 32-bit pseudorandom number generator (PRNG) for single-precision (floating point) values.
public struct Xoshiro128Plus {
    private var state: (UInt32, UInt32, UInt32, UInt32)

    public init(seed: (UInt32, UInt32, UInt32, UInt32)? = nil) {
        state = seed ?? (arc4random(), arc4random(), arc4random(), arc4random())
    }

    public mutating func next() -> UInt32 {
        let result = state.0 &+ state.3
        let t = state.1 << 9

        state.2 ^= state.0
        state.3 ^= state.1
        state.1 ^= state.2
        state.0 ^= state.3

        state.2 ^= t

        state.3 = (state.3 << 11) | (state.3 >> (32 - 11))

        return result
    }

    /// Generate a random single-precision value from a uniform distribution over [0, 1) which includes zero but
    /// excludes one.
    /// - Returns: Random single-precision value.
    public mutating func next() -> Float {
        Float(next() >> 8) * 0x1.0p-24
    }
}
