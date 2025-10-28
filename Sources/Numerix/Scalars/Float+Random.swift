/*
Float extension to conform to Random protocol.
*/

import Accelerate

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

    public static func random<G: RandomNumberGenerator>(size: Int, rng: inout G) -> Vector<Float> {
        var vec = Vector<Float>(size: size)
        for i in 0..<size {
            vec[i] = Float(rng.next() >> 40) * 0x1.0p-24
        }
        return vec
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

    public static func randomBNNS(
        size: Int, bounds: (Float, Float),
        seed: UInt64, buffer: UnsafeMutableBufferPointer<Float>
    ) {
        var desc = BNNSNDArrayDescriptor(data: buffer, shape: .vector(size))!
        let rng = BNNSCreateRandomGeneratorWithSeed(BNNSRandomGeneratorMethodAES_CTR, seed, nil)
        BNNSRandomFillUniformFloat(rng, &desc, bounds.0, bounds.1)
    }

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
