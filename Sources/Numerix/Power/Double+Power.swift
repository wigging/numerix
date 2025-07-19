/*
Double extension to conform to Power protocol.
*/

import Accelerate

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
