/*
Matrix exponential protocol and associated extensions.
*/

import Accelerate

@_documentation(visibility: private)
public protocol MatrixExponential {
    static func exp(a: Matrix<Self>) -> Matrix<Self>
    static func exp2(a: Matrix<Self>) -> Matrix<Self>
    static func expm1(a: Matrix<Self>) -> Matrix<Self>
}

@_documentation(visibility: private)
extension Double: MatrixExponential {

    public static func exp(a: Matrix<Double>) -> Matrix<Double> {
        var mat = Matrix(like: a)
        vForce.exp(a.buffer, result: &mat.buffer)
        return mat
    }

    public static func exp2(a: Matrix<Double>) -> Matrix<Double> {
        var mat = Matrix(like: a)
        vForce.exp2(a.buffer, result: &mat.buffer)
        return mat
    }

    public static func expm1(a: Matrix<Double>) -> Matrix<Double> {
        var mat = Matrix(like: a)
        vForce.expm1(a.buffer, result: &mat.buffer)
        return mat
    }
}

@_documentation(visibility: private)
extension Float: MatrixExponential {

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

extension Matrix where Scalar: MatrixExponential {

    /// Calculate the exponential for each matrix element.
    /// - Returns: Element-wise exponential matrix.
    public func exp() -> Matrix {
        Scalar.exp(a: self)
    }

    /// Calculate 2 raised to the power of each matrix element.
    /// - Returns: Element-wise 2 raised to the power matrix.
    public func exp2() -> Matrix {
        Scalar.exp2(a: self)
    }

    /// Calculate the exponential minus one of each matrix element.
    /// - Returns: Element-wise exponential minus one matrix.
    public func expm1() -> Matrix {
        Scalar.expm1(a: self)
    }
}
