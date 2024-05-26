// Tests for matrix initialization, subscript, addition, and multiplication.

import XCTest
import Numerix

final class MatrixTests: XCTestCase {

    func testInit() {
        let mat1 = Matrix<Double>(rows: 2, columns: 3, values: [3, 4, 8, 10, 11, 18.2])
        let mat2 = Matrix(rows: 2, columns: 3)
        let mat3 = Matrix([[1, 2, 3], [4, 5, 6]])

        XCTAssertEqual(mat1.values, [3, 4, 8, 10, 11, 18.2])
        XCTAssertEqual(mat2.values, [0, 0, 0, 0, 0, 0])
        XCTAssertEqual(mat3.values, [1, 2, 3, 4, 5, 6])
    }

    func testSubscript() {
        let mat = Matrix(rows: 2, columns: 3, values: [3, 4, 8, 10, 11, 18.2])
        XCTAssertEqual(mat[0, 0], 3.0)
        XCTAssertEqual(mat[1, 2], 18.2)
    }

    func testArrayLiteral() {
        let mat: Matrix = [[1, 2, 3], [4, 5, 6]]
        XCTAssertEqual(mat.values, [1, 2, 3, 4, 5, 6])

        let matFloat: Matrix<Float> = [[1, 2, 3.8],
                                       [4, 5.1, 6]]
        XCTAssertEqual(matFloat.values, [1, 2, 3.8, 4, 5.1, 6])

        let matDouble: Matrix = [[1, 2, 3.8],
                                 [4, 5.1, 6]]
        XCTAssertEqual(matDouble.values, [1, 2, 3.8, 4, 5.1, 6])
    }

    func testEquatable() {
        let mat1: Matrix = [[1, 2],
                            [3, 4]]
        let mat2: Matrix = [[1, 2],
                            [3, 4]]
        XCTAssert(mat1 == mat2)

        let mat3: Matrix = [[1.8, 4],
                            [2.9, 8.05]]
        let mat4: Matrix = [[1.8, 4],
                            [2.9, 8.05]]
        XCTAssert(mat3 == mat4)

        let mat5: Matrix = [[1.8, 4],
                            [2.9, 52]]
        XCTAssert(mat5 != mat4)
    }

    func testAddition() {
        let mat1 = Matrix<Double>([[1, 2, 3], [4, 5, 6]])
        let mat2 = Matrix<Double>([[2, 2, 3], [8, 5, 6]])
        let mat3 = Matrix<Float>([[1, 2, 3], [9, 5, 6]])
        let mat4 = Matrix<Float>([[4, 2, 3], [4, 5, 6]])

        let res1 = Matrix<Double>([[3, 4, 6], [12, 10, 12]])
        let res2 = Matrix<Float>([[5, 4, 6], [13, 10, 12]])

        XCTAssert(isApprox(mat1 + mat2, res1))
        XCTAssert(isApprox(mat3 + mat4, res2))
        XCTAssert(isApprox(mat1 + 2.0, Matrix<Double>([[3, 4, 5], [6, 7, 8]])))
        XCTAssert(isApprox(2.0 + mat1, Matrix<Double>([[3, 4, 5], [6, 7, 8]])))
        XCTAssert(isApprox(mat3 + 2.0, Matrix<Float>([[3, 4, 5], [11, 7, 8]])))
        XCTAssert(isApprox(2.0 + mat3, Matrix<Float>([[3, 4, 5], [11, 7, 8]])))
    }

    func testMultiplication() {
        let mat1 = Matrix<Double>([[1, 0, 1],
                                   [2, 1, 1],
                                   [0, 1, 1],
                                   [1, 2, 3]])

        let mat2 = Matrix<Double>([[1, 2, 1],
                                   [2, 3, 1],
                                   [4, 2, 2]])

        let result = Matrix<Double>([[5, 4, 3],
                                     [8, 9, 5],
                                     [6, 5, 3],
                                     [17, 14, 9]])

        XCTAssert(isApprox(mat1 * mat2, result))
    }

    func testIntegerMultiplication() {
        let a = Matrix([[1, 2],
                        [3, 4]])

        let b = Matrix([[1, 2],
                        [3, 4]])

        let c = a * b

        let result = Matrix([[7, 10],
                             [15, 22]])

        XCTAssertEqual(c[0, 0], result[0, 0])
        XCTAssertEqual(c[1, 1], result[1, 1])
    }

    func testComplexMultiplication() {
        let a = Matrix([[Complex(real: 1.0, imag: 2.0), Complex(real: 2.0, imag: 3.0)],
                        [Complex(real: 5.0, imag: 6.0), Complex(real: 7.0, imag: 8.0)]])

        let b = Matrix([[Complex(real: 1.0, imag: 2.0), Complex(real: 2.0, imag: 3.0)],
                        [Complex(real: 5.0, imag: 6.0), Complex(real: 7.0, imag: 8.0)]])

        let c = a * b

        XCTAssertEqual(c[0, 0].real, -11.0)
        XCTAssertEqual(c[0, 0].imag, 31.0)
    }

    func testElementMultiplication() {
        let mat1 = Matrix([[1.0, 2.0, 3.0],
                           [4.0, 5.0, 6.0]])

        let mat2 = Matrix([[2.0, 2.0, 3.0],
                           [8.0, 5.0, 6.0]])

        let res1 = Matrix([[2.0, 4.0, 9.0],
                           [32.0, 25.0, 36.0]])

        XCTAssert(isApprox(mat1 .* mat2, res1))

        let mat3 = Matrix([[2.0, 3.0, 1.0],
                           [0.0, 8.0, -2.0]])

        let mat4 = Matrix([[3.0, 1.0, 4.0],
                           [7.0, 9.0, 5.0]])

        let res2 = Matrix([[6.0, 3.0, 4.0],
                           [0.0, 72.0, -10.0]])

        XCTAssert(isApprox(mat3 ⊙ mat4, res2))
    }

    func testDivision() {
        let mat = Matrix<Double>([[1, 2, 3],
                                  [4, 5, 6],
                                  [7, 8, 9]])

        let result1 = Matrix([[2.0, 1.0, 0.66],
                              [0.5, 0.4, 0.33],
                              [0.2857, 0.25, 0.22]])

        let result2 = Matrix([[0.5, 1.0, 1.5],
                              [2.0, 2.5, 3.0],
                              [3.5, 4.0, 4.5]])

        XCTAssert(isApprox(divide(2.0, mat), result1, rtol: 1e-2))  // divide scalar by matrix
        XCTAssert(isApprox(2.0 / mat, result1, rtol: 1e-2))         // divide scalar by matrix

        XCTAssert(isApprox(divide(mat, 2.0), result2, rtol: 1e-2))  // divide matrix by scalar
        XCTAssert(isApprox(mat / 2.0, result2, rtol: 1e-2))         // divide matrix by scalar
    }

    func testMaxAbsIndex() {
        let mat1 = Matrix<Float>([[1, 2, 3],
                                  [4, 9, 5],
                                  [6, 7, 10]])
        let (row1, col1) = mat1.maxAbsIndex()
        XCTAssertEqual(row1, 2)
        XCTAssertEqual(col1, 2)

        let mat2 = Matrix<Double>([[1, 2, 3],
                                   [4, 9, 5],
                                   [6, 70, 1]])
        let (row2, col2) = mat2.maxAbsIndex()
        XCTAssertEqual(row2, 2)
        XCTAssertEqual(col2, 1)
    }
}
