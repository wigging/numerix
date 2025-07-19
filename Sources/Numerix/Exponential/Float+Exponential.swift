/*
Float extension to conform to Exponential protocol.
*/

import Accelerate

@_documentation(visibility: private)
extension Float: Exponential {

    // Vector

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

    // Matrix

    public static func exp(a: Matrix<Float>) -> Matrix<Float> {
        var mat = Matrix(like: a)
        vForce.exp(a.buffer, result: &mat.buffer)
        return mat
    }

    public static func exp2(a: Matrix<Float>) -> Matrix<Float> {
        var mat = Matrix(like: a)
        vForce.exp2(a.buffer, result: &mat.buffer)
        return mat
    }

    public static func expm1(a: Matrix<Float>) -> Matrix<Float> {
        var mat = Matrix(like: a)
        vForce.expm1(a.buffer, result: &mat.buffer)
        return mat
    }
}
