/*
Vector extension for power functions.
*/

import Accelerate

public protocol Power {
    static func power(a: Vector<Self>, exp: Self) -> Vector<Self>
    static func power(a: Vector<Self>, exp: [Self]) -> Vector<Self>
}

extension Float: Power {
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
}

extension Double: Power {
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
