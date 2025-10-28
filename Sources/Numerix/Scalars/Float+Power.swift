/*
Float extension to conform to Power protocol.
*/

import Accelerate

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
