/*
Double extension to conform to Trigonometry protocol.
*/

import Accelerate

@_documentation(visibility: private)
extension Double: Trigonometry {

    // Vector

    public static func sin(_ a: Vector<Double>) -> Vector<Double> {
        var result = Vector(like: a)
        vForce.sin(a.buffer, result: &result.buffer)
        return result
    }

    public static func cos(_ a: Vector<Double>) -> Vector<Double> {
        var result = Vector(like: a)
        vForce.cos(a.buffer, result: &result.buffer)
        return result
    }

    public static func tan(_ a: Vector<Double>) -> Vector<Double> {
        var result = Vector(like: a)
        vForce.tan(a.buffer, result: &result.buffer)
        return result
    }

    public static func asin(_ a: Vector<Double>) -> Vector<Double> {
        var result = Vector(like: a)
        vForce.asin(a.buffer, result: &result.buffer)
        return result
    }

    public static func acos(_ a: Vector<Double>) -> Vector<Double> {
        var result = Vector(like: a)
        vForce.acos(a.buffer, result: &result.buffer)
        return result
    }

    public static func atan(_ a: Vector<Double>) -> Vector<Double> {
        var result = Vector(like: a)
        vForce.atan(a.buffer, result: &result.buffer)
        return result
    }

    public static func csc(_ a: Vector<Double>) -> Vector<Double> {
        var result = Vector(like: a)
        vForce.sin(a.buffer, result: &result.buffer)
        vForce.reciprocal(result.buffer, result: &result.buffer)
        return result
    }

    public static func sec(_ a: Vector<Double>) -> Vector<Double> {
        var result = Vector(like: a)
        vForce.cos(a.buffer, result: &result.buffer)
        vForce.reciprocal(result.buffer, result: &result.buffer)
        return result
    }

    public static func cot(_ a: Vector<Double>) -> Vector<Double> {
        var result = Vector(like: a)
        vForce.tan(a.buffer, result: &result.buffer)
        vForce.reciprocal(result.buffer, result: &result.buffer)
        return result
    }

    // Matrix

    public static func sin(_ a: Matrix<Double>) -> Matrix<Double> {
        var result = Matrix(like: a)
        vForce.sin(a.buffer, result: &result.buffer)
        return result
    }

    public static func cos(_ a: Matrix<Double>) -> Matrix<Double> {
        var result = Matrix(like: a)
        vForce.cos(a.buffer, result: &result.buffer)
        return result
    }

    public static func tan(_ a: Matrix<Double>) -> Matrix<Double> {
        var result = Matrix(like: a)
        vForce.tan(a.buffer, result: &result.buffer)
        return result
    }
}
