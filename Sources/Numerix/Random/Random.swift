/*
Random protocol.
Random extensions for Float and Double.
Random extensions for Vector.
*/

import Accelerate

@_documentation(visibility: private)
public protocol Random {
    static func random(size: Int, seed: UInt64?) -> Vector<Self>
    static func random<G: RandomNumberGenerator>(size: Int, rng: inout G) -> Vector<Self>
    static func randomBNNS(size: Int, bounds: (Self, Self), seed: UInt64, buffer: UnsafeMutableBufferPointer<Self>)
}

@_documentation(visibility: private)
extension Float: Random {

    public static func random(size: Int, seed: UInt64?) -> Vector<Float> {
        var vec = Vector<Float>(size: size)
        var rng = Wyrand(seed: seed)
        for i in 0..<size {
            vec[i] = rng.next()
        }
        return vec
    }

    public static func random<G: RandomNumberGenerator>(size: Int, rng: inout G) -> Vector<Float> {
        var vec = Vector<Float>(size: size)
        for i in 0..<size {
            vec[i] = Float(rng.next() >> 40) * 0x1.0p-24
        }
        return vec
    }

    public static func randomBNNS(
        size: Int, bounds: (Float, Float),
        seed: UInt64, buffer: UnsafeMutableBufferPointer<Float>
    ) {
        var desc = BNNSNDArrayDescriptor(data: buffer, shape: .vector(size))!
        let rng = BNNSCreateRandomGeneratorWithSeed(BNNSRandomGeneratorMethodAES_CTR, seed, nil)
        BNNSRandomFillUniformFloat(rng, &desc, bounds.0, bounds.1)
    }
}

@_documentation(visibility: private)
extension Double: Random {

    public static func random(size: Int, seed: UInt64?) -> Vector<Double> {
        var vec = Vector<Double>(size: size)
        var rng = Wyrand(seed: seed)
        for i in 0..<size {
            vec[i] = rng.next()
        }
        return vec
    }

    public static func random<G: RandomNumberGenerator>(size: Int, rng: inout G) -> Vector<Double> {
        var vec = Vector<Double>(size: size)
        for i in 0..<size {
            vec[i] = Double(rng.next() >> 11) * 0x1.0p-53
        }
        return vec
    }

    public static func randomBNNS(
        size: Int, bounds: (Double, Double),
        seed: UInt64, buffer: UnsafeMutableBufferPointer<Double>
    ) {
        fatalError("BNNS does not support doubles")
    }
}

extension Vector where Scalar: Random {

    /// Create a vector of random values from a uniform distribution over [0, 1).
    /// ```swift
    /// let a = Vector<Float>.random(5)
    /// let b = Vector<Double>.random(8, seed: 123456)
    /// ```
    /// This method uses the ``Wyrand`` pseudorandom number generator (PRNG) to generate the random values in the
    /// vector. The values are sampled from a uniform distribution [0, 1) which includes zero but excludes one. An
    /// optional seed can be provided for reproducible results.
    /// - Parameters:
    ///   - size: Size of the vector.
    ///   - seed: Seed for the Wyrand generator.
    /// - Returns: Vector of random values.
    public static func random(_ size: Int, seed: UInt64? = nil) -> Vector {
        Scalar.random(size: size, seed: seed)
    }

    /// Create a vector of random values from a uniform distribution over [0, 1) using a random number generator.
    /// ```swift
    /// var rng = Xoroshiro128Plus(seed: (1227493545477, 7213431619994))
    /// let a = Vector<Float>.random(5, using: &rng)
    /// ```
    /// The example uses the ``Xoroshiro128Plus`` pseudorandom number generator (PRNG) to generate random values to
    /// fill the vector. The generator is seeded with two integers otherwise random seeds are used if none are given.
    /// - Parameters:
    ///   - size: Size of the vector.
    ///   - rng: Random number generator.
    /// - Returns: Vector or random values.
    public static func random<G: RandomNumberGenerator>(_ size: Int, using rng: inout G) -> Vector {
        Scalar.random(size: size, rng: &rng)
    }

    /// Create a vector of random float values using BNNS.
    /// - Parameters:
    ///   - size: Size of the vector.
    ///   - bounds: The lower and upper bounds of the uniform random distribution.
    ///   - seed: Seed for the random number generator.
    /// - Returns: Vector of random float values.
    public static func randomBNNS(size: Int, bounds: (Scalar, Scalar), seed: UInt64? = nil) -> Vector {
        let s = seed ?? UInt64.random(in: 0..<UInt64.max)
        let vec = Vector<Scalar>(size: size)
        Scalar.randomBNNS(size: size, bounds: bounds, seed: s, buffer: vec.buffer)
        return vec
    }
}
