/*
Vector extension for Exponential protocol.
*/

extension Vector where Scalar: Exponential {

    /// Calculate the exponential for each vector element.
    /// - Returns: Element-wise exponential vector.
    public func exp() -> Vector {
        Scalar.exp(a: self)
    }

    /// Calculate 2 raised to the power of each vector element.
    /// - Returns: Element-wise 2 raised to the power vector.
    public func exp2() -> Vector {
        Scalar.exp2(a: self)
    }

    /// Calculate the exponential minus one of each vector element.
    /// - Returns: Element-wise exponential minus one vector.
    public func expm1() -> Vector {
        Scalar.expm1(a: self)
    }
}
