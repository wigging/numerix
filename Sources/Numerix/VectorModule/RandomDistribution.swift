/*
 Function to create a random distribution vector using LAPACK.
 */

import Accelerate

@_documentation(visibility: private)
public protocol RandomDistribution {
    static func randomDist(size: Int, dist: Int) -> Vector<Self>
}

@_documentation(visibility: private)
extension Float: RandomDistribution {

    public static func randomDist(size: Int, dist: Int) -> Vector<Float> {
        var idist = dist
        var num = size

        // Must be between 0 and 4095, and iseed[3] must be odd
        // See https://netlib.org/lapack/explore-html/d5/dd2/group__larnv.html
        var iseed: [Int] = (0..<3).map { _ in Int.random(in: 1..<4095) }
        iseed += [2 * (Int.random(in: 1..<4095) / 2) + 1 ]

        let vec = Vector<Float>(size: size)
        slarnv_(&idist, &iseed, &num, vec.buffer.baseAddress)
        return vec
    }
}

@_documentation(visibility: private)
extension Double: RandomDistribution {

    public static func randomDist(size: Int, dist: Int) -> Vector<Double> {
        var idist = dist
        var num = size

        // Must be between 0 and 4095, and iseed[3] must be odd
        // See https://netlib.org/lapack/explore-html/d5/dd2/group__larnv.html
        var iseed: [Int] = (0..<3).map { _ in Int.random(in: 1..<4095) }
        iseed += [2 * (Int.random(in: 1..<4095) / 2) + 1 ]

        let vec = Vector<Double>(size: size)
        dlarnv_(&idist, &iseed, &num, vec.buffer.baseAddress)
        return vec
    }
}

extension Vector {

    /// Create a vector containing a random distribution of values.
    /// - Parameters:
    ///   - size: Size of the vector.
    ///   - dist: Distribution of random numbers where a value of `1` is for a
    ///   uniform distribution `(0, 1)`, a value of `2` is for a uniform distribution
    ///   `(-1, 1)`, and `3` is for a normal distribution `(0, 1)`. Default is `1`.
    /// - Returns: Vector of randomly distributed values.
    public static func randomDistribution(size: Int, dist: Int = 1) -> Vector where Scalar: RandomDistribution {
        Scalar.randomDist(size: size, dist: dist)
    }
}
