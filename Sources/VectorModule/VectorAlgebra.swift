/*
 Vector algebra protocol.
 */

import Accelerate

public protocol VectorAlgebra {
    static func dot(_ a: Vector<Self>, _ b: Vector<Self>) -> Self
    static func norm(_ a: Vector<Self>) -> Self
    static func sum(_ a: Vector<Self>) -> Self
    static func absoluteSum(_ a: Vector<Self>) -> Self
    static func cumulativeSum(_ a: Vector<Self>) -> Vector<Self>
}

extension Int: VectorAlgebra {

    public static func dot(_ a: Vector<Int>, _ b: Vector<Int>) -> Int {
        var res = Int.zero
        for (x, y) in zip(a.buffer, b.buffer) {
            res += x * y
        }
        return res
    }

    public static func norm(_ a: Vector<Int>) -> Int {
        var sumOfSquares = 0

        for i in 0..<a.size {
            sumOfSquares &+= a[i] * a[i]
        }

        let result = sqrt(Float(sumOfSquares))
        return Int(result)
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

    public static func cumulativeSum(_ a: Vector<Int>) -> Vector<Int> {
        var cumulative = Vector(like: a)
        var runningTotal = 0
        for i in 0..<a.size {
            runningTotal += a[i]
            cumulative[i] = runningTotal
        }
        return cumulative
    }
}

extension Float: VectorAlgebra {

    public static func dot(_ a: Vector<Float>, _ b: Vector<Float>) -> Float {
        cblas_sdot(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func norm(_ a: Vector<Float>) -> Float {
        cblas_snrm2(a.size, a.buffer.baseAddress, 1)
    }

    public static func sum(_ a: Vector<Float>) -> Float {
        vDSP.sum(a.buffer)
    }

    public static func absoluteSum(_ a: Vector<Float>) -> Float {
        cblas_sasum(a.size, a.buffer.baseAddress, 1)
    }

    public static func cumulativeSum(_ a: Vector<Float>) -> Vector<Float> {
        var s: Float = 1.0             // scalar weighting factor for A
        let n = vDSP_Length(a.size)    // number of elements to process

        var result = Vector(like: a)
        vDSP_vrsum(a.buffer.baseAddress!, 1, &s, result.buffer.baseAddress!, 1, n)
        vDSP.add(a[0], result.buffer, result: &result.buffer)

        return result
    }
}

extension Double: VectorAlgebra {

    public static func dot(_ a: Vector<Double>, _ b: Vector<Double>) -> Double {
        cblas_ddot(a.size, a.buffer.baseAddress, 1, b.buffer.baseAddress, 1)
    }

    public static func norm(_ a: Vector<Double>) -> Double {
        cblas_dnrm2(a.size, a.buffer.baseAddress, 1)
    }

    public static func sum(_ a: Vector<Double>) -> Double {
        vDSP.sum(a.buffer)
    }

    public static func absoluteSum(_ a: Vector<Double>) -> Double {
        cblas_dasum(a.size, a.buffer.baseAddress, 1)
    }

    public static func cumulativeSum(_ a: Vector<Double>) -> Vector<Double> {
        var s = 1.0                    // scalar weighting factor for A
        let n = vDSP_Length(a.size)    // number of elements to process

        var result = Vector(like: a)
        vDSP_vrsumD(a.buffer.baseAddress!, 1, &s, result.buffer.baseAddress!, 1, n)
        vDSP.add(a[0], result.buffer, result: &result.buffer)

        return result
    }
}
