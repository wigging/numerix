/*
 Vector arithmetic protocol.
 */

import Accelerate

public protocol VectorArithmetic {
    static func add(_ a: Vector<Self>, _ k: Self) -> Vector<Self>
    static func add(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self>
    static func subtract(_ k: Self, _ a: Vector<Self>) -> Vector<Self>
    static func subtract(_ a: Vector<Self>, _ k: Self) -> Vector<Self>
    static func subtract(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self>
    static func multiply(_ a: Vector<Self>, _ k: Self) -> Vector<Self>
    static func multiply(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self>
}

extension Int: VectorArithmetic {

    public static func add(_ a: Vector<Int>, _ k: Int) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &+ k
        }
        return vec
    }

    public static func add(_ a: Vector<Int>, _ b: Vector<Int>) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &+ b[i]
        }
        return vec
    }

    public static func subtract(_ k: Int, _ a: Vector<Int>) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = k &- a[i]
        }
        return vec
    }

    public static func subtract(_ a: Vector<Int>, _ k: Int) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &- k
        }
        return vec
    }

    public static func subtract(_ a: Vector<Int>, _ b: Vector<Int>) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &- b[i]
        }
        return vec
    }

    public static func multiply(_ a: Vector<Int>, _ k: Int) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &* k
        }
        return vec
    }

    public static func multiply(_ a: Vector<Int>, _ b: Vector<Int>) -> Vector<Int> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] &* b[i]
        }
        return vec
    }
}

extension Float: VectorArithmetic {

    public static func add(_ a: Vector<Float>, _ k: Float) -> Vector<Float> {
        var vec = Vector(like: a)
        vDSP.add(k, a.buffer, result: &vec.buffer)
        return vec
    }

    public static func add(_ a: Vector<Float>, _ b: Vector<Float>) -> Vector<Float> {
        var vec = Vector(like: a)
        vDSP.add(a.buffer, b.buffer, result: &vec.buffer)
        return vec
    }

    public static func subtract(_ k: Float, _ a: Vector<Float>) -> Vector<Float> {
        let arr = Array(repeating: k, count: a.size)
        var res = Vector(like: a)
        vDSP.subtract(arr, a.buffer, result: &res.buffer)
        return res
    }

    public static func subtract(_ a: Vector<Float>, _ k: Float) -> Vector<Float> {
        let arr = Array(repeating: k, count: a.size)
        var res = Vector(like: a)
        vDSP.subtract(a.buffer, arr, result: &res.buffer)
        return res
    }

    public static func subtract(_ a: Vector<Float>, _ b: Vector<Float>) -> Vector<Float> {
        var res = Vector(like: a)
        vDSP.subtract(a.buffer, b.buffer, result: &res.buffer)
        return res
    }

    public static func multiply(_ a: Vector<Float>, _ k: Float) -> Vector<Float> {
        var vec = Vector(like: a)
        vDSP.multiply(k, a.buffer, result: &vec.buffer)
        return vec
    }

    public static func multiply(_ a: Vector<Float>, _ b: Vector<Float>) -> Vector<Float> {
        var vec = Vector(like: a)
        vDSP.multiply(a.buffer, b.buffer, result: &vec.buffer)
        return vec
    }
}
