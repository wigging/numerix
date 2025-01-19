/*
Matrix extension for power functions.
*/

import Accelerate

public protocol Power {
    static func power(a: Matrix<Self>, exp: Self) -> Matrix<Self>
    static func power(a: Matrix<Self>, exp: [Self]) -> Matrix<Self>
}

extension Float: Power {
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

extension Double: Power {
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
