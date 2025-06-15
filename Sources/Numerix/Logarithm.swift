/*
Logarithm protocol and extensions.
*/

import Accelerate

@_documentation(visibility: private)
public protocol Logarithm {
    static func log(a: Vector<Self>) -> Vector<Self>
    static func log1p(a: Vector<Self>) -> Vector<Self>
    static func log10(a: Vector<Self>) -> Vector<Self>
    static func log2(a: Vector<Self>) -> Vector<Self>
    static func logb(a: Vector<Self>) -> Vector<Self>

    static func log(a: Matrix<Self>) -> Matrix<Self>
    static func log1p(a: Matrix<Self>) -> Matrix<Self>
    static func log10(a: Matrix<Self>) -> Matrix<Self>
    static func log2(a: Matrix<Self>) -> Matrix<Self>
    static func logb(a: Matrix<Self>) -> Matrix<Self>
}

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

extension Vector where Scalar: Logarithm {

    /// Calculate the natural logarithm for each vector element.
    /// - Returns: Element-wise log vector.
    public func log() -> Vector {
        Scalar.log(a: self)
    }

    /// Calculate the log(1+x) for each vector element.
    /// - Returns: Element-wise log(1+x) vector.
    public func log1p() -> Vector {
        Scalar.log1p(a: self)
    }

    /// Calculate the base 10 logarithm for each vector element.
    /// - Returns: Element-wise base 10 logarithm vector.
    public func log10() -> Vector {
        Scalar.log10(a: self)
    }

    /// Calculate the base 2 logarithm for each vector element.
    /// - Returns: Element-wise base 2 logarithm vector.
    public func log2() -> Vector {
        Scalar.log2(a: self)
    }

    /// Calculate the unbiased exponent for each vector element.
    /// - Returns: Element-wise unbiased exponent vector.
    public func logb() -> Vector {
        Scalar.logb(a: self)
    }
}

extension Matrix where Scalar: Logarithm {

    /// Calculate the natural logarithm for each matrix element.
    /// - Returns: Element-wise log matrix.
    public func log() -> Matrix {
        Scalar.log(a: self)
    }

    /// Calculate the log(1+x) for each matrix element.
    /// - Returns: Element-wise log(1+x) matrix.
    public func log1p() -> Matrix {
        Scalar.log1p(a: self)
    }

    /// Calculate the base 10 logarithm for each matrix element.
    /// - Returns: Element-wise base 10 logarithm matrix.
    public func log10() -> Matrix {
        Scalar.log10(a: self)
    }

    /// Calculate the base 2 logarithm for each matrix element.
    /// - Returns: Element-wise base 2 logarithm matrix.
    public func log2() -> Matrix {
        Scalar.log2(a: self)
    }

    /// Calculate the unbiased exponent for each matrix element.
    /// - Returns: Element-wise unbiased exponent matrix.
    public func logb() -> Matrix {
        Scalar.logb(a: self)
    }
}