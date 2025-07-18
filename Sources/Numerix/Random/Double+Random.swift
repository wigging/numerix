/*
Double extension to conform to Random protocol.
*/

import Accelerate

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

    public static func random<G: RandomNumberGenerator>(size: Int, rng: inout G) -> Vector<Double> {
        var vec = Vector<Double>(size: size)
        for i in 0..<size {
            vec[i] = Double(rng.next() >> 11) * 0x1.0p-53
        }
        return vec
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

    public static func randomBNNS(
        size: Int, bounds: (Double, Double),
        seed: UInt64, buffer: UnsafeMutableBufferPointer<Double>
    ) {
        fatalError("BNNS does not support doubles")
    }

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
