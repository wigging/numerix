/*
Complex number structure.
*/

public struct Complex<Scalar> {
    public let real: Scalar
    public let imaginary: Scalar

    public init(_ real: Scalar, _ imaginary: Scalar) {
        self.real = real
        self.imaginary = imaginary
    }
}
