/*
Vector extension for exponential functions.
*/

import Accelerate

public protocol Exponential {
    static func exp(a: Vector<Self>) -> Vector<Self>
    static func exp2(a: Vector<Self>) -> Vector<Self>
    static func expm1(a: Vector<Self>) -> Vector<Self>
}

extension Float: Exponential {
    public static func exp(a: Vector<Float>) -> Vector<Float> {
        var mat = Vector(like: a)
        vForce.exp(a.buffer, result: &mat.buffer)
        return mat
    }

    public static func exp2(a: Vector<Float>) -> Vector<Float> {
        var mat = Vector(like: a)
        vForce.exp2(a.buffer, result: &mat.buffer)
        return mat
    }

    public static func expm1(a: Vector<Float>) -> Vector<Float> {
        var mat = Vector(like: a)
        vForce.expm1(a.buffer, result: &mat.buffer)
        return mat
    }
}

extension Double: Exponential {
    public static func exp(a: Vector<Double>) -> Vector<Double> {
        var mat = Vector(like: a)
        vForce.exp(a.buffer, result: &mat.buffer)
        return mat
    }

    public static func exp2(a: Vector<Double>) -> Vector<Double> {
        var mat = Vector(like: a)
        vForce.exp2(a.buffer, result: &mat.buffer)
        return mat
    }

    public static func expm1(a: Vector<Double>) -> Vector<Double> {
        var mat = Vector(like: a)
        vForce.expm1(a.buffer, result: &mat.buffer)
        return mat
    }
}

extension Vector where Scalar: Exponential {

    /// Calculate the exponential for each vector element.
    /// - Returns: Element-wise exponential vector.
    public func exp() -> Vector {
        Scalar.exp(a: self)
    }

    /// Calculate 2 raised to the power of each vector element.
    /// - Returns: Element-wise 2 raised to the power vector.
    public func exp2() -> Vector {
        Scalar.exp2(a: self)
    }

    /// Calculate the exponential minus one of each vector element.
    /// - Returns: Element-wise exponential minus one vector.
    public func expm1() -> Vector {
        Scalar.expm1(a: self)
    }
}
