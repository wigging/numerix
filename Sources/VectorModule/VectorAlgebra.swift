/*
 Vector algebra protocol.
 */

import Accelerate

public protocol VectorAlgebra {
    static func dot(_ a: Vector<Self>, _ b: Vector<Self>) -> Self
    static func sum(_ a: Vector<Self>) -> Self
    static func absoluteSum(_ a: Vector<Self>) -> Self
}

extension Int: VectorAlgebra {

    public static func dot(_ a: Vector<Int>, _ b: Vector<Int>) -> Int {
        var res = Int.zero
        for (x, y) in zip(a.buffer, b.buffer) {
            res += x * y
        }
        return res
    }

    public static func sum(_ a: Vector<Int>) -> Int {
        var res = Int.zero
        for i in 0..<a.size {
            res += a[i]
        }
        return res
    }

    public static func absoluteSum(_ a: Vector<Int>) -> Int {
        var res = Int.zero
        for i in 0..<a.size {
            res += abs(a[i])
        }
        return res
    }
}

extension Float: VectorAlgebra {

    public static func dot(_ a: Vector<Float>, _ b: Vector<Float>) -> Float {
        cblas_sdot(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func sum(_ a: Vector<Float>) -> Float {
        vDSP.sum(a.buffer)
    }

    public static func absoluteSum(_ a: Vector<Float>) -> Float {
        cblas_sasum(a.size, a.buffer.baseAddress, 1)
    }
}

extension Double: VectorAlgebra {

    public static func dot(_ a: Vector<Double>, _ b: Vector<Double>) -> Double {
        cblas_ddot(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func sum(_ a: Vector<Double>) -> Double {
        vDSP.sum(a.buffer)
    }

    public static func absoluteSum(_ a: Vector<Double>) -> Double {
        cblas_dasum(a.size, a.buffer.baseAddress, 1)
    }
}
