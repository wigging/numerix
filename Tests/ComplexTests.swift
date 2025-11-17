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
}
