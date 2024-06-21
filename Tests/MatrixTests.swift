// Tests for matrix initialization, subscript, addition, and multiplication.

import XCTest
import Numerix

final class MatrixTests: XCTestCase {

    func testInit() {
        let mat1 = Matrix<Double>(rows: 2, columns: 3, values: [3, 4, 8, 10, 11, 18.2])
        let mat2 = Matrix(rows: 2, columns: 3, fill: 0)
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

    func testSubscriptRow() {
        var mat: Matrix = [[1, 2, 3],
                           [4, 5, 6],
                           [7, 8, 9]]

        let matRow = mat[row: 1]
        XCTAssertEqual(matRow, [4, 5, 6])

        mat[row: 2] = [9, 9, 7]
        XCTAssertEqual(mat, Matrix([[1, 2, 3], [4, 5, 6], [9, 9, 7]]))
    }

    func testSubscriptColumn() {
        var mat: Matrix = [[1, 2, 3],
                           [4, 5, 6],
                           [7, 8, 9]]

        let matCol = mat[column: 1]
        XCTAssertEqual(matCol, [2, 5, 8])

        mat[column: 2] = [9, 9, 7]
        XCTAssertEqual(mat, Matrix([[1, 2, 9], [4, 5, 9], [7, 8, 7]]))
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
