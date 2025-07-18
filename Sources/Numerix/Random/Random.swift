/*
Random protocol.
*/

import Accelerate

@_documentation(visibility: private)
public protocol Random {
    static func random(size: Int, seed: UInt64?) -> Vector<Self>
    static func random(rows: Int, columns: Int, seed: UInt64?) -> Matrix<Self>

    static func random<G: RandomNumberGenerator>(size: Int, rng: inout G) -> Vector<Self>
    static func random<G: RandomNumberGenerator>(rows: Int, columns: Int, rng: inout G) -> Matrix<Self>

    static func randomBNNS(size: Int, bounds: (Self, Self), seed: UInt64, buffer: UnsafeMutableBufferPointer<Self>)
    static func randomDist(size: Int, dist: Int) -> Vector<Self>
}
