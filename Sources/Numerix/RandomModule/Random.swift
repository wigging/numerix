/*
Random vector protocol using WyRand.
*/

import VectorModule

@_documentation(visibility: private)
public protocol Random {
    static func random(size: Int, seed: UInt64?) -> Vector<Self>
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
}

extension Vector {

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
    public static func random(size: Int, seed: UInt64? = nil) -> Vector where Scalar: Random {
        Scalar.random(size: size, seed: seed)
    }
}
