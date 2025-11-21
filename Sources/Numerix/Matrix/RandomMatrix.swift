/*
Random matrix protocol and associated extensions.
*/

import Accelerate

@_documentation(visibility: private)
public protocol RandomMatrix {
    static func random(rows: Int, columns: Int, seed: UInt64?) -> Matrix<Self>
    static func random<G: RandomNumberGenerator>(rows: Int, columns: Int, rng: inout G) -> Matrix<Self>
}

@_documentation(visibility: private)
extension Double: RandomMatrix {

    public static func random(rows: Int, columns: Int, seed: UInt64?) -> Matrix<Double> {
        var mat = Matrix<Double>(rows: rows, columns: columns)
        var rng = Wyrand(seed: seed)
        for i in 0..<rows {
            for j in 0..<columns {
                mat[i, j] = rng.next()
            }
        }
        return mat
    }

    public static func random<G: RandomNumberGenerator>(rows: Int, columns: Int, rng: inout G) -> Matrix<Double> {
        var mat = Matrix<Double>(rows: rows, columns: columns)
        for i in 0..<rows {
            for j in 0..<columns {
                mat[i, j] = Double(rng.next() >> 11) * 0x1.0p-53
            }
        }
        return mat
    }
}

@_documentation(visibility: private)
extension Float: RandomMatrix {

    public static func random(rows: Int, columns: Int, seed: UInt64?) -> Matrix<Float> {
        var mat = Matrix<Float>(rows: rows, columns: columns)
        var rng = Wyrand(seed: seed)
        for i in 0..<rows {
            for j in 0..<columns {
                mat[i, j] = rng.next()
            }
        }
        return mat
    }

    public static func random<G: RandomNumberGenerator>(rows: Int, columns: Int, rng: inout G) -> Matrix<Float> {
        var mat = Matrix<Float>(rows: rows, columns: columns)
        for i in 0..<rows {
            for j in 0..<columns {
                mat[i, j] = Float(rng.next() >> 40) * 0x1.0p-24
            }
        }
        return mat
    }
}

extension Matrix where Scalar: RandomMatrix {

    /// Create a matrix of random values from a uniform distribution over [0, 1).
    /// ```swift
    /// let a = Matrix<Float>.random(2, 3)
    /// let b = Matrix<Double>.random(2, 2, seed: 123456)
    /// ```
    /// This method uses the ``Wyrand`` pseudorandom number generator (PRNG) to generate the random values in the
    /// matrix. The values are sampled from a uniform distribution [0, 1) which includes zero but excludes one. An
    /// optional seed can be provided for reproducible results.
    /// - Parameters:
    ///   - rows: Number of matrix rows.
    ///   - columns: Number of matrix columns.
    ///   - seed: Seed for the Wyrand generator.
    /// - Returns: Matrix of random values.
    public static func random(_ rows: Int, _ columns: Int, seed: UInt64? = nil) -> Matrix {
        Scalar.random(rows: rows, columns: columns, seed: seed)
    }

    /// Create a matrix of random values from a uniform distribution over [0, 1) using a random number generator.
    /// ```swift
    /// var rng = Xoroshiro128Plus(seed: (1227493545477, 7213431619994))
    /// let a = Matrix<Double>.random(5, 4, using: &rng)
    /// ```
    /// The example uses the ``Xoroshiro128Plus`` pseudorandom number generator (PRNG) to generate random values to
    /// fill the matrix. The generator is seeded with two integers otherwise random seeds are used if none are given.
    /// - Parameters:
    ///   - rows: Number of matrix rows.
    ///   - columns: Number of matrix columns.
    ///   - rng: Random number generator.
    /// - Returns: Matrix of random values.
    public static func random<G: RandomNumberGenerator>(_ rows: Int, _ columns: Int, using rng: inout G) -> Matrix {
        Scalar.random(rows: rows, columns: columns, rng: &rng)
    }
}
