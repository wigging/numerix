/*
Protocol for random vector.
Random vector protocol and init.
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
    public static func random(size: Int, seed: UInt64? = nil) -> Vector where Scalar: Random {
        Scalar.random(size: size, seed: seed)
    }
}
