/*
Vector exponential protocol and associated extensions.
*/

import Accelerate

@_documentation(visibility: private)
public protocol VectorExponential {
    static func exp(a: Vector<Self>) -> Vector<Self>
    static func exp2(a: Vector<Self>) -> Vector<Self>
    static func expm1(a: Vector<Self>) -> Vector<Self>
}

@_documentation(visibility: private)
extension Double: VectorExponential {

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

@_documentation(visibility: private)
extension Float: VectorExponential {

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

extension Vector where Scalar: VectorExponential {

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
