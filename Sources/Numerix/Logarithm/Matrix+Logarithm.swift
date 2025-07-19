/*
Matrix extension for Logarithm protocol.
*/

extension Matrix where Scalar: Logarithm {

    /// Calculate the natural logarithm for each matrix element.
    /// - Returns: Element-wise log matrix.
    public func log() -> Matrix {
        Scalar.log(a: self)
    }

    /// Calculate the log(1+x) for each matrix element.
    /// - Returns: Element-wise log(1+x) matrix.
    public func log1p() -> Matrix {
        Scalar.log1p(a: self)
    }

    /// Calculate the base 10 logarithm for each matrix element.
    /// - Returns: Element-wise base 10 logarithm matrix.
    public func log10() -> Matrix {
        Scalar.log10(a: self)
    }

    /// Calculate the base 2 logarithm for each matrix element.
    /// - Returns: Element-wise base 2 logarithm matrix.
    public func log2() -> Matrix {
        Scalar.log2(a: self)
    }

    /// Calculate the unbiased exponent for each matrix element.
    /// - Returns: Element-wise unbiased exponent matrix.
    public func logb() -> Matrix {
        Scalar.logb(a: self)
    }
}
