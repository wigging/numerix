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
}
