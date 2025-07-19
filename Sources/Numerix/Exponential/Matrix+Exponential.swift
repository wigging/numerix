/*
Matrix extension for Exponential protocol.
*/

extension Matrix where Scalar: Exponential {

    /// Calculate the exponential for each matrix element.
    /// - Returns: Element-wise exponential matrix.
    public func exp() -> Matrix {
        Scalar.exp(a: self)
    }

    /// Calculate 2 raised to the power of each matrix element.
    /// - Returns: Element-wise 2 raised to the power matrix.
    public func exp2() -> Matrix {
        Scalar.exp2(a: self)
    }

    /// Calculate the exponential minus one of each matrix element.
    /// - Returns: Element-wise exponential minus one matrix.
    public func expm1() -> Matrix {
        Scalar.expm1(a: self)
    }
}
