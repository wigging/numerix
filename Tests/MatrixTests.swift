/*
 Tests for the Matrix structure.
 */

import Testing
@testable import Numerix

struct MatrixTests {

    @Test func integer() {
        let k = 5
        let a = Matrix([[1, 2, 3], [4, 5, 6]])
        let b = Matrix([[7, 8, 9], [3, 4, 5]])

        // Equality
        #expect(a == a)

        // Addition
        #expect(k + a == Matrix([[6, 7, 8], [9, 10, 11]]))
        #expect(a + k == Matrix([[6, 7, 8], [9, 10, 11]]))
        #expect(a + b == Matrix([[8, 10, 12], [7, 9, 11]]))

        var c = Matrix([[1, 2, 3], [4, 5, 6]])
        c += b
        #expect(c == Matrix([[8, 10, 12], [7, 9, 11]]))

        // Subtraction
        //#expect(k - a == Vector([4, 3, 2, 1, 0]))
        //#expect(a - k == Vector([-4, -3, -2, -1, 0]))
        //#expect(a - b == Vector([-3, -3, -3, -3, -3]))

        // Multiplication
        //#expect(k * a == Vector([5, 10, 15, 20, 25]))
        //#expect(a * k == Vector([5, 10, 15, 20, 25]))
        //#expect(a * b == Vector([4, 10, 18, 28, 40]))

        // Methods
        //#expect(a.dot(b) == 100)
        //#expect(a.sum() == 15)
        //#expect(a.absoluteSum() == 15)
    }
}
