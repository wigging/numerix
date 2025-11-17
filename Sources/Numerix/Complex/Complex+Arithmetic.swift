/*
Complex number extension to conform to Arithmetic protocol.
*/

extension Complex where Scalar: Arithmetic {

    public static func + (lhs: Scalar, rhs: Complex) -> Complex {
        Scalar.add(rhs, lhs)
    }

    public static func + (lhs: Complex, rhs: Scalar) -> Complex {
        Scalar.add(lhs, rhs)
    }

    public static func + (lhs: Complex, rhs: Complex) -> Complex {
        Scalar.add(lhs, rhs)
    }
}
