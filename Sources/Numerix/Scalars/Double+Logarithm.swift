/*
Double extension to conform to Logarithm protocol.
*/

import Accelerate

@_documentation(visibility: private)
extension Double: Logarithm {

    // Vector

    public static func log(a: Vector<Double>) -> Vector<Double> {
        var result = Vector(like: a)
        vForce.log(a.buffer, result: &result.buffer)
        return result
    }

    public static func log1p(a: Vector<Double>) -> Vector<Double> {
        var result = Vector(like: a)
        vForce.log1p(a.buffer, result: &result.buffer)
        return result
    }

    public static func log10(a: Vector<Double>) -> Vector<Double> {
        var result = Vector(like: a)
        vForce.log10(a.buffer, result: &result.buffer)
        return result
    }

    public static func log2(a: Vector<Double>) -> Vector<Double> {
        var result = Vector(like: a)
        vForce.log2(a.buffer, result: &result.buffer)
        return result
    }

    public static func logb(a: Vector<Double>) -> Vector<Double> {
        var result = Vector(like: a)
        vForce.logb(a.buffer, result: &result.buffer)
        return result
    }

    // Matrix

    public static func log(a: Matrix<Double>) -> Matrix<Double> {
        var result = Matrix(like: a)
        vForce.log(a.buffer, result: &result.buffer)
        return result
    }

    public static func log1p(a: Matrix<Double>) -> Matrix<Double> {
        var result = Matrix(like: a)
        vForce.log1p(a.buffer, result: &result.buffer)
        return result
    }

    public static func log10(a: Matrix<Double>) -> Matrix<Double> {
        var result = Matrix(like: a)
        vForce.log10(a.buffer, result: &result.buffer)
        return result
    }

    public static func log2(a: Matrix<Double>) -> Matrix<Double> {
        var result = Matrix(like: a)
        vForce.log2(a.buffer, result: &result.buffer)
        return result
    }

    public static func logb(a: Matrix<Double>) -> Matrix<Double> {
        var result = Matrix(like: a)
        vForce.logb(a.buffer, result: &result.buffer)
        return result
    }
}
