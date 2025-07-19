/*
Vector extension for Power protocol.
*/

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
