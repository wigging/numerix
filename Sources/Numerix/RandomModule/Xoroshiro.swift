/*
Xoroshiro128+ and Xoroshiro128++ pseudorandom number generators (PRNGs).
*/

import Accelerate

func rotl(_ x: UInt64, _ k: Int) -> UInt64 {
    (x &<< k) | (x &>> (64 &- k))
}

/// Xoroshiro128+ is a 64-bit pseudorandom number generator (PRNG) for double-precision values.
public struct Xoroshiro128Plus: RandomNumberGenerator {
    private var state: (UInt64, UInt64)

    public init(seed: (UInt64, UInt64)? = nil) {
        let a = UInt64.random(in: 0..<UInt64.max)
        let b = UInt64.random(in: 0..<UInt64.max)
        state = seed ?? (a, b)
    }

    public mutating func next() -> UInt64 {
        let s0 = state.0
        var s1 = state.1
        let result = s0 &+ s1

        s1 ^= s0
        state.0 = rotl(s0, 24) ^ s1 ^ (s1 << 16)
        state.1 = rotl(s1, 37)

        return result
    }

    /// Generate a random double-precision value from a uniform distribution over [0, 1) which includes zero but
    /// excludes one.
    /// - Returns: Random double-precision value.
    public mutating func next() -> Double {
        Double(next() >> 11) * 0x1.0p-53
    }
}

/// Xoroshiro128++ is a 64-bit pseudorandom number generator (PRNG) for double-precision values.
public struct Xoroshiro128PlusPlus: RandomNumberGenerator {
    private var state: (UInt64, UInt64)

    public init(seed: (UInt64, UInt64)? = nil) {
        let a = UInt64.random(in: 0..<UInt64.max)
        let b = UInt64.random(in: 0..<UInt64.max)
        state = seed ?? (a, b)
    }

    public mutating func next() -> UInt64 {
        let s0 = state.0
        var s1 = state.1
        let result = rotl(s0 &+ s1, 17) &+ s0

        s1 ^= s0
        state.0 = rotl(s0, 49) ^ s1 ^ (s1 << 21)
        state.1 = rotl(s1, 28)

        return result
    }
    
    /// Generate a random double-precision value from a uniform distribution over [0, 1) which includes zero but
    /// excludes one.
    /// - Returns: Random double-precision value.
    public mutating func next() -> Double {
        Double(next() >> 11) * 0x1.0p-53
    }
}
