/*
Power protocol and extensions.
*/

import Accelerate

@_documentation(visibility: private)
public protocol Power {
    static func power(a: Vector<Self>, exp: Self) -> Vector<Self>
    static func power(a: Vector<Self>, exp: [Self]) -> Vector<Self>

    static func power(a: Matrix<Self>, exp: Self) -> Matrix<Self>
    static func power(a: Matrix<Self>, exp: [Self]) -> Matrix<Self>
}

@_documentation(visibility: private)
extension Float: Power {

    // Vector

    public static func power(a: Vector<Float>, exp: Float) -> Vector<Float> {
        let output = Vector(like: a)
        withUnsafePointer(to: exp) { expPtr in
            withUnsafePointer(to: Int32(a.size)) { lengthPtr in
                vvpowsf(output.buffer.baseAddress!, expPtr, a.buffer.baseAddress!, lengthPtr)
            }
        }
        return output
    }

    public static func power(a: Vector<Float>, exp: [Float]) -> Vector<Float> {
        precondition(a.size == exp.count, "Vector size must correspond to number of exponents")
        var result = Vector(like: a)
        vForce.pow(bases: a.buffer, exponents: exp, result: &result.buffer)
        return result
    }

    // Matrix

    public static func power(a: Matrix<Float>, exp: Float) -> Matrix<Float> {
        let output = Matrix(like: a)
        withUnsafePointer(to: exp) { expPtr in
            withUnsafePointer(to: Int32(a.buffer.count)) { lengthPtr in
                vvpowsf(output.buffer.baseAddress!, expPtr, a.buffer.baseAddress!, lengthPtr)
            }
        }
        return output
    }

    public static func power(a: Matrix<Float>, exp: [Float]) -> Matrix<Float> {
        precondition(a.buffer.count == exp.count, "Matrix size must correspond to number of exponents")
        var result = Matrix(like: a)
        vForce.pow(bases: a.buffer, exponents: exp, result: &result.buffer)
        return result
    }
}

@_documentation(visibility: private)
extension Double: Power {

    // Vector

    public static func power(a: Vector<Double>, exp: Double) -> Vector<Double> {
        let output = Vector(like: a)
        withUnsafePointer(to: exp) { expPtr in
            withUnsafePointer(to: Int32(a.size)) { lengthPtr in
                vvpows(output.buffer.baseAddress!, expPtr, a.buffer.baseAddress!, lengthPtr)
            }
        }
        return output
    }

    public static func power(a: Vector<Double>, exp: [Double]) -> Vector<Double> {
        precondition(a.size == exp.count, "Vector size must correspond to number of exponents")
        var result = Vector(like: a)
        vForce.pow(bases: a.buffer, exponents: exp, result: &result.buffer)
        return result
    }

    // Matrix

    public static func power(a: Matrix<Double>, exp: Double) -> Matrix<Double> {
        let output = Matrix(like: a)
        withUnsafePointer(to: exp) { expPtr in
            withUnsafePointer(to: Int32(a.buffer.count)) { lengthPtr in
                vvpows(output.buffer.baseAddress!, expPtr, a.buffer.baseAddress!, lengthPtr)
            }
        }
        return output
    }

    public static func power(a: Matrix<Double>, exp: [Double]) -> Matrix<Double> {
        precondition(a.buffer.count == exp.count, "Matrix size must correspond to number of exponents")
        var result = Matrix(like: a)
        vForce.pow(bases: a.buffer, exponents: exp, result: &result.buffer)
        return result
    }
}

extension Vector where Scalar: Power {

    /// Raise each vector element to the power of a constant exponent.
    /// - Parameter k: A constant exponent value.
    /// - Returns: Vector from the bases raised to a constant power.
    public func power(_ k: Scalar) -> Vector {
        Scalar.power(a: self, exp: k)
    }

    /// Raise each vector element to the power of several exponents.
    /// - Parameter k: Array of exponent values.
    /// - Returns: Vector from the bases raised to several powers.
    public func power(_ k: [Scalar]) -> Vector {
        Scalar.power(a: self, exp: k)
    }
}

extension Matrix where Scalar: Power {

    /// Raise each matrix element to the power of a constant exponent.
    /// - Parameter k: A constant exponent value.
    /// - Returns: Matrix from the bases raised to a constant power.
    public func power(_ k: Scalar) -> Matrix {
        Scalar.power(a: self, exp: k)
    }

    /// Raise each matrix element to the power of several exponents.
    /// - Parameter k: Array of exponent values.
    /// - Returns: Matrix from the bases raised to several powers.
    public func power(_ k: [Scalar]) -> Matrix {
        Scalar.power(a: self, exp: k)
    }
}
