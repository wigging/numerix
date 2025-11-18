/*
Complex arithmetic protocol and associated extensions.
*/

@_documentation(visibility: private)
public protocol ComplexArithmetic {
    static func add(_ a: Complex<Self>, _ k: Self) -> Complex<Self>
    static func add(_ a: Complex<Self>, _ b: Complex<Self>) -> Complex<Self>
}

@_documentation(visibility: private)
extension Double: ComplexArithmetic {

    public static func add(_ a: Complex<Double>, _ k: Double) -> Complex<Double> {
        Complex(a.real + k, a.imaginary)
    }

    public static func add(_ a: Complex<Double>, _ b: Complex<Double>) -> Complex<Double> {
        Complex(a.real + b.real, a.imaginary + b.imaginary)
    }
}

@_documentation(visibility: private)
extension Float: ComplexArithmetic {

    public static func add(_ a: Complex<Float>, _ k: Float) -> Complex<Float> {
        Complex(a.real + k, a.imaginary)
    }

    public static func add(_ a: Complex<Float>, _ b: Complex<Float>) -> Complex<Float> {
        Complex(a.real + b.real, a.imaginary + b.imaginary)
    }
}

@_documentation(visibility: private)
extension Int: ComplexArithmetic {

    public static func add(_ a: Complex<Int>, _ k: Int) -> Complex<Int> {
        Complex(a.real + k, a.imaginary)
    }

    public static func add(_ a: Complex<Int>, _ b: Complex<Int>) -> Complex<Int> {
        Complex(a.real + b.real, a.imaginary + b.imaginary)
    }
}

extension Complex where Scalar: ComplexArithmetic {

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
