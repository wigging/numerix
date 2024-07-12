/*
 Tests for Vector and Matrix multiplication.
 */

import XCTest
import Numerix

final class MultiplicationTests: XCTestCase {

    func testVectorMultiplication() {
        let vec1 = Vector<Double>([1, 2, 3, 4])
        let vec2 = Vector<Double>([2, 3, 4, 5])

        XCTAssertEqual(vec1 * vec2, Vector([2, 6, 12, 20]))
        XCTAssertEqual(2.0 * vec1, Vector([2, 4, 6, 8]))
        XCTAssertEqual(vec1 * 2.0, Vector([2, 4, 6, 8]))

        let vec3 = Vector<Float>([1, 2, 3, 4])
        let vec4 = Vector<Float>([2, 3, 4, 5])

        XCTAssertEqual(vec3 * vec4, Vector<Float>([2, 6, 12, 20]))
        XCTAssertEqual(2.0 * vec3, Vector<Float>([2, 4, 6, 8]))
        XCTAssertEqual(vec3 * 2.0, Vector<Float>([2, 4, 6, 8]))
    }

    func testMatrixMultiplication() {
        let mat1 = Matrix<Double>([[1, 0, 1],
                                   [2, 1, 1],
                                   [0, 1, 1],
                                   [1, 2, 3]])

        let mat2 = Matrix<Double>([[1, 2, 1],
                                   [2, 3, 1],
                                   [4, 2, 2]])

        let result1 = Matrix<Double>([[5, 4, 3],
                                     [8, 9, 5],
                                     [6, 5, 3],
                                     [17, 14, 9]])

        XCTAssertEqual(mat1 * mat2, result1)

        let mat3 = Matrix([[1, 2],
                           [3, 4]])

        let mat4 = Matrix([[1, 2],
                           [3, 4]])

        let result2 = Matrix([[7, 10],
                             [15, 22]])

        XCTAssertEqual(mat3 * mat4, result2)

        let mat5 = Matrix([[Complex(real: 1.0, imag: 2.0), Complex(real: 2.0, imag: 3.0)],
                           [Complex(real: 5.0, imag: 6.0), Complex(real: 7.0, imag: 8.0)]])

        let mat6 = Matrix([[Complex(real: 1.0, imag: 2.0), Complex(real: 2.0, imag: 3.0)],
                           [Complex(real: 5.0, imag: 6.0), Complex(real: 7.0, imag: 8.0)]])

        let c = mat5 * mat6

        XCTAssertEqual(c[0, 0].real, -11.0)
        XCTAssertEqual(c[0, 0].imag, 31.0)
    }

    func testElementwiseMatrixMultiplication() {
        let mat1 = Matrix([[1.0, 2.0, 3.0],
                           [4.0, 5.0, 6.0]])

        let mat2 = Matrix([[2.0, 2.0, 3.0],
                           [8.0, 5.0, 6.0]])

        let res1 = Matrix([[2.0, 4.0, 9.0],
                           [32.0, 25.0, 36.0]])

        XCTAssertEqual(mat1 .* mat2, res1)

        let mat3 = Matrix([[2.0, 3.0, 1.0],
                           [0.0, 8.0, -2.0]])

        let mat4 = Matrix([[3.0, 1.0, 4.0],
                           [7.0, 9.0, 5.0]])

        let res2 = Matrix([[6.0, 3.0, 4.0],
                           [0.0, 72.0, -10.0]])

        XCTAssertEqual(mat3 ⊙ mat4, res2)
    }
}
