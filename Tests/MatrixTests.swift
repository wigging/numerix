/*
 Tests for the Matrix structure.
 */

import Testing
@testable import Numerix

struct MatrixTests {

    @Test func integerArithmetic() {
        let k = 5
        let a = Matrix([[1, 2, 3], [4, 5, 6]])
        let b = Matrix([[7, 8, 9], [3, 4, 5]])
        let c = Matrix([[1, 2], [3, 4], [5, 6]])

        // Equality
        #expect(a == a)
        #expect(a != b)

        // Addition
        #expect(k + a == Matrix([[6, 7, 8], [9, 10, 11]]))
        #expect(a + k == Matrix([[6, 7, 8], [9, 10, 11]]))
        #expect(a + b == Matrix([[8, 10, 12], [7, 9, 11]]))

        var d = Matrix([[1, 2, 3], [4, 5, 6]])
        d += b
        #expect(d == Matrix([[8, 10, 12], [7, 9, 11]]))

        // Subtraction
        #expect(k - a == Matrix([[4, 3, 2], [1, 0, -1]]))
        #expect(a - k == Matrix([[-4, -3, -2], [-1, 0, 1]]))
        #expect(a - b == Matrix([[-6, -6, -6], [1, 1, 1]]))

        // Element-wise multiplication
        #expect(k .* a == Matrix([[5, 10, 15], [20, 25, 30]]))
        #expect(a .* k == Matrix([[5, 10, 15], [20, 25, 30]]))
        #expect(a .* b == Matrix([[7, 16, 27], [12, 20, 30]]))

        // Matrix multiplication
        #expect(a * c == Matrix([[22, 28], [49, 64]]))

        // Methods
        //#expect(a.dot(b) == 100)
        //#expect(a.sum() == 15)
        //#expect(a.absoluteSum() == 15)
    }

    @Test func floatArithmetic() {
        let k: Float = 5
        let a = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
        let b = Matrix<Float>([[7, 8, 9], [3, 4, 5]])
        let c = Matrix<Float>([[1, 2], [3, 4], [5, 6]])

        // Equality
        #expect(a == a)
        #expect(a != b)

        // Addition
        #expect(k + a == Matrix([[6, 7, 8], [9, 10, 11]]))
        #expect(a + k == Matrix([[6, 7, 8], [9, 10, 11]]))
        #expect(a + b == Matrix([[8, 10, 12], [7, 9, 11]]))

        var d = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
        d += b
        #expect(d == Matrix([[8, 10, 12], [7, 9, 11]]))

        // Subtraction
        #expect(k - a == Matrix([[4, 3, 2], [1, 0, -1]]))
        #expect(a - k == Matrix([[-4, -3, -2], [-1, 0, 1]]))
        #expect(a - b == Matrix([[-6, -6, -6], [1, 1, 1]]))

        // Element-wise multiplication
        #expect(k .* a == Matrix([[5, 10, 15], [20, 25, 30]]))
        #expect(a .* k == Matrix([[5, 10, 15], [20, 25, 30]]))
        #expect(a .* b == Matrix([[7, 16, 27], [12, 20, 30]]))

        // Matrix multiplication
        #expect(a * c == Matrix([[22, 28], [49, 64]]))

        // Methods
        //#expect(a.dot(b) == 100)
        //#expect(a.sum() == 15)
        //#expect(a.absoluteSum() == 15)
    }

    @Test func doubleArithmetic() {
        let k = 5.0
        let a = Matrix([[1, 2, 3], [4, 5, 6.0]])
        let b = Matrix([[7, 8, 9], [3, 4, 5.0]])
        let c = Matrix([[1, 2], [3, 4], [5, 6.0]])

        // Equality
        #expect(a == a)
        #expect(a != b)

        // Addition
        #expect(k + a == Matrix([[6, 7, 8], [9, 10, 11]]))
        #expect(a + k == Matrix([[6, 7, 8], [9, 10, 11]]))
        #expect(a + b == Matrix([[8, 10, 12], [7, 9, 11]]))

        var d = Matrix([[1, 2, 3], [4, 5, 6.0]])
        d += b
        #expect(d == Matrix([[8, 10, 12], [7, 9, 11]]))

        // Subtraction
        #expect(k - a == Matrix([[4, 3, 2], [1, 0, -1]]))
        #expect(a - k == Matrix([[-4, -3, -2], [-1, 0, 1]]))
        #expect(a - b == Matrix([[-6, -6, -6], [1, 1, 1]]))

        // Element-wise multiplication
        #expect(k .* a == Matrix([[5, 10, 15], [20, 25, 30]]))
        #expect(a .* k == Matrix([[5, 10, 15], [20, 25, 30]]))
        #expect(a .* b == Matrix([[7, 16, 27], [12, 20, 30]]))

        // Matrix multiplication
        #expect(a * c == Matrix([[22, 28], [49, 64]]))

        // Methods
        //#expect(a.dot(b) == 100)
        //#expect(a.sum() == 15)
        //#expect(a.absoluteSum() == 15)
    }
}
