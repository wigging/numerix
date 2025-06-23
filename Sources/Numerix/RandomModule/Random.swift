/*
Random vector protocol using WyRand.
*/

import Accelerate

@_documentation(visibility: private)
public protocol Random {
    static func random(size: Int, seed: UInt64?) -> Vector<Self>
    static func randomBNNS(size: Int, bounds: (Self, Self), seed: UInt64, buffer: UnsafeMutableBufferPointer<Self>)
}

@_documentation(visibility: private)
extension Float: Random {
    public static func random(size: Int, seed: UInt64?) -> Vector<Float> {
        var vec = Vector<Float>(size: size)
        var rng = WyRand(seed: seed)
        for i in 0..<size {
            vec[i] = rng.nextUniform()
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
        var rng = WyRand(seed: seed)
        for i in 0..<size {
            vec[i] = rng.nextUniform()
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

    /// Create a vector of random values from a uniform distrubtion over [0, 1).
    /// ```swift
    /// let vec = Vector<Double>.random(size: 5)
    /// ```
    /// This uses the WyRand pseudorandom number generator (PRNG) to generate the random values in the vector.
    /// Values are a uniform distribution over 0 to 1 excluding 1 which is denoted as [0, 1).
    /// Provide a seed input value to create a reproducible random vector.
    /// - Parameters:
    ///   - size: Size of the vector.
    ///   - seed: Seed for the random number generator.
    /// - Returns: Vector of random values.
    public static func random(size: Int, seed: UInt64? = nil) -> Vector {
        Scalar.random(size: size, seed: seed)
    }

    /// Create a vector of random float values using BNNS.
    /// - Parameters:
    ///   - size: Size of the vector.
    ///   - bounds: The lower and upper bounds of the uniform random distribution.
    ///   - seed: Seed for the random number generator.
    /// - Returns: Vector of random float values.
    public static func randomBNNS(size: Int, bounds: (Scalar, Scalar), seed: UInt64? = nil) -> Vector {
        let s = seed ?? UInt64(abs(UUID().hashValue))
        let vec = Vector<Scalar>(size: size)
        Scalar.randomBNNS(size: size, bounds: bounds, seed: s, buffer: vec.buffer)
        return vec
    }
}
