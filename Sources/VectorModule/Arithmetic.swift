/*
Arithmetic protocol and extensions for the Vector struct.
*/

import Accelerate

@_documentation(visibility: private)
public protocol Arithmetic {
    static func add(_ a: Vector<Self>, _ k: Self) -> Vector<Self>
    static func add(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self>
    static func subtract(_ k: Self, _ a: Vector<Self>) -> Vector<Self>
    static func subtract(_ a: Vector<Self>, _ k: Self) -> Vector<Self>
    static func subtract(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self>
    static func multiply(_ a: Vector<Self>, _ k: Self) -> Vector<Self>
    static func multiply(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self>
    static func divide(_ k: Self, _ b: Vector<Self>) -> Vector<Self>
    static func divide(_ a: Vector<Self>, _ k: Self) -> Vector<Self>
    static func divide(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self>
}

@_documentation(visibility: private)
extension Int: Arithmetic {

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

    public static func divide(_ k: Self, _ b: Vector<Self>) -> Vector<Self> {
        var vec = Vector(like: b)
        for i in 0..<b.size {
            vec[i] = k / b[i]
        }
        return vec
    }

    public static func divide(_ a: Vector<Self>, _ k: Self) -> Vector<Self> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] / k
        }
        return vec
    }

    public static func divide(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] / b[i]
        }
        return vec
    }
}

@_documentation(visibility: private)
extension Float: Arithmetic {

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

    public static func divide(_ k: Self, _ b: Vector<Self>) -> Vector<Self> {
        var vec = Vector(like: b)
        for i in 0..<b.size {
            vec[i] = k / b[i]
        }
        return vec
    }

    public static func divide(_ a: Vector<Self>, _ k: Self) -> Vector<Self> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] / k
        }
        return vec
    }

    public static func divide(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] / b[i]
        }
        return vec
    }
}

@_documentation(visibility: private)
extension Double: Arithmetic {

    public static func add(_ a: Vector<Double>, _ k: Double) -> Vector<Double> {
        var vec = Vector(like: a)
        vDSP.add(k, a.buffer, result: &vec.buffer)
        return vec
    }

    public static func add(_ a: Vector<Double>, _ b: Vector<Double>) -> Vector<Double> {
        var vec = Vector(like: a)
        vDSP.add(a.buffer, b.buffer, result: &vec.buffer)
        return vec
    }

    public static func subtract(_ k: Double, _ a: Vector<Double>) -> Vector<Double> {
        let arr = Array(repeating: k, count: a.size)
        var res = Vector(like: a)
        vDSP.subtract(arr, a.buffer, result: &res.buffer)
        return res
    }

    public static func subtract(_ a: Vector<Double>, _ k: Double) -> Vector<Double> {
        let arr = Array(repeating: k, count: a.size)
        var res = Vector(like: a)
        vDSP.subtract(a.buffer, arr, result: &res.buffer)
        return res
    }

    public static func subtract(_ a: Vector<Double>, _ b: Vector<Double>) -> Vector<Double> {
        var res = Vector(like: a)
        vDSP.subtract(a.buffer, b.buffer, result: &res.buffer)
        return res
    }

    public static func multiply(_ a: Vector<Double>, _ k: Double) -> Vector<Double> {
        var vec = Vector(like: a)
        vDSP.multiply(k, a.buffer, result: &vec.buffer)
        return vec
    }

    public static func multiply(_ a: Vector<Double>, _ b: Vector<Double>) -> Vector<Double> {
        var vec = Vector(like: a)
        vDSP.multiply(a.buffer, b.buffer, result: &vec.buffer)
        return vec
    }

    public static func divide(_ k: Self, _ b: Vector<Self>) -> Vector<Self> {
        var vec = Vector(like: b)
        for i in 0..<b.size {
            vec[i] = k / b[i]
        }
        return vec
    }

    public static func divide(_ a: Vector<Self>, _ k: Self) -> Vector<Self> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] / k
        }
        return vec
    }

    public static func divide(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self> {
        var vec = Vector(like: a)
        for i in 0..<a.size {
            vec[i] = a[i] / b[i]
        }
        return vec
    }
}

extension Vector where Scalar: Arithmetic {

    /// Element-wise addition of a scalar and vector using real numbers.
    /// - Parameters:
    ///   - lhs: Left-hand side scalar value.
    ///   - rhs: Right-hand side vector.
    /// - Returns: Element-wise sum of a scalar and vector.
    public static func + (lhs: Scalar, rhs: Vector) -> Vector {
        Scalar.add(rhs, lhs)
    }

    public static func + (lhs: Vector, rhs: Scalar) -> Vector {
        Scalar.add(lhs, rhs)
    }

    public static func + (lhs: Vector, rhs: Vector) -> Vector {
        Scalar.add(lhs, rhs)
    }

    public static func += (lhs: inout Vector, rhs: Vector) {
        lhs = lhs + rhs
    }

    public static func - (lhs: Scalar, rhs: Vector) -> Vector {
        Scalar.subtract(lhs, rhs)
    }

    public static func - (lhs: Vector, rhs: Scalar) -> Vector {
        Scalar.subtract(lhs, rhs)
    }

    public static func - (lhs: Vector, rhs: Vector) -> Vector {
        Scalar.subtract(lhs, rhs)
    }

    public static func * (lhs: Scalar, rhs: Vector) -> Vector {
        Scalar.multiply(rhs, lhs)
    }

    public static func * (lhs: Vector, rhs: Scalar) -> Vector {
        Scalar.multiply(lhs, rhs)
    }

    public static func * (lhs: Vector, rhs: Vector) -> Vector {
        Scalar.multiply(lhs, rhs)
    }

    public static func *= (lhs: inout Vector, rhs: Scalar) {
        lhs = lhs * rhs
    }

    public static func / (lhs: Scalar, rhs: Vector) -> Vector {
        Scalar.divide(lhs, rhs)
    }

    public static func / (lhs: Vector, rhs: Scalar) -> Vector {
        Scalar.divide(lhs, rhs)
    }

    public static func / (lhs: Vector, rhs: Vector) -> Vector {
        Scalar.divide(lhs, rhs)
    }
}
