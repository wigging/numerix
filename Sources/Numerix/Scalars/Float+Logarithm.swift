/*
Float extension to conform to Logarithm protocol.
*/

import Accelerate

@_documentation(visibility: private)
extension Float: Logarithm {

    // Vector

    public static func log(a: Vector<Float>) -> Vector<Float> {
        var result = Vector(like: a)
        vForce.log(a.buffer, result: &result.buffer)
        return result
    }

    public static func log1p(a: Vector<Float>) -> Vector<Float> {
        var result = Vector(like: a)
        vForce.log1p(a.buffer, result: &result.buffer)
        return result
    }

    public static func log10(a: Vector<Float>) -> Vector<Float> {
        var result = Vector(like: a)
        vForce.log10(a.buffer, result: &result.buffer)
        return result
    }

    public static func log2(a: Vector<Float>) -> Vector<Float> {
        var result = Vector(like: a)
        vForce.log2(a.buffer, result: &result.buffer)
        return result
    }

    public static func logb(a: Vector<Float>) -> Vector<Float> {
        var result = Vector(like: a)
        vForce.logb(a.buffer, result: &result.buffer)
        return result
    }

    // Matrix

    public static func log(a: Matrix<Float>) -> Matrix<Float> {
        var result = Matrix(like: a)
        vForce.log(a.buffer, result: &result.buffer)
        return result
    }

    public static func log1p(a: Matrix<Float>) -> Matrix<Float> {
        var result = Matrix(like: a)
        vForce.log1p(a.buffer, result: &result.buffer)
        return result
    }

    public static func log10(a: Matrix<Float>) -> Matrix<Float> {
        var result = Matrix(like: a)
        vForce.log10(a.buffer, result: &result.buffer)
        return result
    }

    public static func log2(a: Matrix<Float>) -> Matrix<Float> {
        var result = Matrix(like: a)
        vForce.log2(a.buffer, result: &result.buffer)
        return result
    }

    public static func logb(a: Matrix<Float>) -> Matrix<Float> {
        var result = Matrix(like: a)
        vForce.logb(a.buffer, result: &result.buffer)
        return result
    }
}
