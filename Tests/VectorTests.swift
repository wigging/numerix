/*
 Tests for the Vector structure.
 */

import Testing
@testable import Numerix

struct VectorTests {

    @Test func integerArithmetic() {
        let k = 5
        let a = Vector([1, 2, 3, 4, 5])
        let b = Vector([4, 5, 6, 7, 8])

        // Equality
        #expect(a == a)

        // Addition
        #expect(k + a == Vector([6, 7, 8, 9, 10]))
        #expect(a + k == Vector([6, 7, 8, 9, 10]))
        #expect(a + b == Vector([5, 7, 9, 11, 13]))

        var c = Vector([1, 2, 3, 4, 5])
        c += Vector([1, 2, 3, 4, 5])
        #expect(c == Vector([2, 4, 6, 8, 10]))

        // Subtraction
        #expect(k - a == Vector([4, 3, 2, 1, 0]))
        #expect(a - k == Vector([-4, -3, -2, -1, 0]))
        #expect(a - b == Vector([-3, -3, -3, -3, -3]))

        // Multiplication
        #expect(k * a == Vector([5, 10, 15, 20, 25]))
        #expect(a * k == Vector([5, 10, 15, 20, 25]))
        #expect(a * b == Vector([4, 10, 18, 28, 40]))
    }

    @Test func integerAlgebra() {
        let a = Vector([1, 2, 3, 4, 5])
        let b = Vector([4, 5, 6, 7, 8])

        #expect(a.dot(b) == 100)
        #expect(a.sum() == 15)
        #expect(a.absoluteSum() == 15)
    }

    @Test func floatArithmetic() {
        let k: Float = 5
        let a = Vector<Float>([1, 2, 3, 4, 5])
        let b = Vector<Float>([4, 5, 6, 7, 8])

        // Equality
        #expect(a == a)

        // Addition
        #expect(k + a == Vector([6, 7, 8, 9, 10]))
        #expect(a + k == Vector([6, 7, 8, 9, 10]))
        #expect(a + b == Vector([5, 7, 9, 11, 13]))

        var c = Vector([1, 2, 3, 4, 5])
        c += Vector([1, 2, 3, 4, 5])
        #expect(c == Vector([2, 4, 6, 8, 10]))

        // Subtraction
        #expect(k - a == Vector([4, 3, 2, 1, 0]))
        #expect(a - k == Vector([-4, -3, -2, -1, 0]))
        #expect(a - b == Vector([-3, -3, -3, -3, -3]))

        // Multiplication
        #expect(k * a == Vector([5, 10, 15, 20, 25]))
        #expect(a * k == Vector([5, 10, 15, 20, 25]))
        #expect(a * b == Vector([4, 10, 18, 28, 40]))
    }

    @Test func floatAlgebra() {
        let a = Vector<Float>([1, 2, 3, 4, 5])
        let b = Vector<Float>([4, 5, 6, 7, 8])

        #expect(a.dot(b) == 100)
        #expect(a.sum() == 15)
        #expect(a.absoluteSum() == 15)
    }

    @Test func doubleArithmetic() {
        let k = 5.0
        let a = Vector([1, 2, 3, 4, 5.0])
        let b = Vector([4, 5, 6, 7, 8.0])

        // Equality
        #expect(a == a)

        // Addition
        #expect(k + a == Vector([6, 7, 8, 9, 10]))
        #expect(a + k == Vector([6, 7, 8, 9, 10]))
        #expect(a + b == Vector([5, 7, 9, 11, 13]))

        var c = Vector([1, 2, 3, 4, 5.0])
        c += Vector([1, 2, 3, 4, 5.0])
        #expect(c == Vector([2, 4, 6, 8, 10]))

        // Subtraction
        #expect(k - a == Vector([4, 3, 2, 1, 0]))
        #expect(a - k == Vector([-4, -3, -2, -1, 0]))
        #expect(a - b == Vector([-3, -3, -3, -3, -3]))

        // Multiplication
        #expect(k * a == Vector([5, 10, 15, 20, 25]))
        #expect(a * k == Vector([5, 10, 15, 20, 25]))
        #expect(a * b == Vector([4, 10, 18, 28, 40]))
    }

    @Test func doubleAlgebra() {
        let a = Vector([1, 2, 3, 4, 5.0])
        let b = Vector([4, 5, 6, 7, 8.0])

        #expect(a.dot(b) == 100)
        #expect(a.sum() == 15)
        #expect(a.absoluteSum() == 15)
    }
}
