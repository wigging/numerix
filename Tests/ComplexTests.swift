/*
Tests for the Complex structure.
*/

import Testing
import Numerix

struct ComplexTests {

    @Test func initialize() {
        let a = Complex(1, 2)
        #expect(a.real == 1)
        #expect(a.imaginary == 2)
    }

    @Test func equality() {
        let a = Complex(1, 2)
        let b = Complex(1, 2)
        #expect(a == b)

        let c = Complex<Float>(1, 2)
        let d = Complex<Float>(1, 2)
        #expect(c == d)

        let e = Complex(1.0, 2)
        let f = Complex(1.0, 2)
        #expect(e == f)
    }

    @Test func addition() {
        let a = Complex(1, 2)
        let b = Complex(1, 2)
        #expect(a + b == Complex(2, 4))

        let c = Complex<Float>(1, 2)
        let d = Complex<Float>(1, 2)
        #expect(c + d == Complex<Float>(2, 4))

        let e = Complex(1.0, 2)
        let f = Complex(1.0, 2)
        #expect(e + f == Complex(2.0, 4))

        let vec = Vector([Complex(1, 2), Complex(2, 3)])
        #expect(vec + 5 == Vector([Complex(6, 2), Complex(7, 3)]))
        #expect(5 + vec == Vector([Complex(6, 2), Complex(7, 3)]))

        let vecF = Vector([Complex<Float>(1, 2), Complex<Float>(2, 3)])
        #expect(vecF + 5 == Vector([Complex(6, 2), Complex(7, 3)]))
        #expect(5 + vecF == Vector([Complex(6, 2), Complex(7, 3)]))

        let vecD = Vector([Complex<Double>(1, 2), Complex<Double>(2, 3)])
        #expect(vecD + 5 == Vector([Complex(6, 2), Complex(7, 3)]))
        #expect(5 + vecD == Vector([Complex(6, 2), Complex(7, 3)]))
    }
}
