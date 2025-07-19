/*
Matrix extension for Power protocol.
*/

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
