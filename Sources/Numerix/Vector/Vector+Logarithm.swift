/*
Vector extension for Logarithm protocol.
*/

extension Vector where Scalar: Logarithm {

    /// Calculate the natural logarithm for each vector element.
    /// - Returns: Element-wise log vector.
    public func log() -> Vector {
        Scalar.log(a: self)
    }

    /// Calculate the log(1+x) for each vector element.
    /// - Returns: Element-wise log(1+x) vector.
    public func log1p() -> Vector {
        Scalar.log1p(a: self)
    }

    /// Calculate the base 10 logarithm for each vector element.
    /// - Returns: Element-wise base 10 logarithm vector.
    public func log10() -> Vector {
        Scalar.log10(a: self)
    }

    /// Calculate the base 2 logarithm for each vector element.
    /// - Returns: Element-wise base 2 logarithm vector.
    public func log2() -> Vector {
        Scalar.log2(a: self)
    }

    /// Calculate the unbiased exponent for each vector element.
    /// - Returns: Element-wise unbiased exponent vector.
    public func logb() -> Vector {
        Scalar.logb(a: self)
    }
}
