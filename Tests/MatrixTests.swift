/*
Tests for the Matrix structure.
*/

import XCTest
import Numerix

final class MatrixTests: XCTestCase {

    func testInit() {
        let mat1 = Matrix<Double>(rows: 2, columns: 3, values: [3, 4, 8, 10, 11, 18.2])
        let mat2 = Matrix(rows: 2, columns: 3, fill: 0)
        let mat3 = Matrix([[1, 2, 3], [4, 5, 6]])

        XCTAssertEqual(mat1[0, 0], 3)
        XCTAssertEqual(mat2[0, 0], 0)
        XCTAssertEqual(mat3[0, 0], 1)
    }

    func testCount() {
        let mat: Matrix = [[1, 2, 3],
                           [4, 5, 6]]
        XCTAssertEqual(mat.count, 6)
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
        XCTAssertEqual(matRow, Matrix(rows: 1, columns: 3, values: [4, 5, 6]))

        mat[row: 2] = Matrix(rows: 1, columns: 3, values: [9, 9, 7])
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
        XCTAssertEqual(mat[0, 0], 1)

        let matFloat: Matrix<Float> = [[1, 2, 3.8],
                                       [4, 5.1, 6]]
        XCTAssertEqual(matFloat[0, 0], 1)

        let matDouble: Matrix = [[1, 2, 3.8],
                                 [4, 5.1, 6]]
        XCTAssertEqual(matDouble[0, 0], 1)
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

    func testIterator() {
        let mat = Matrix([[1, 2, 3],
                          [4, 5, 6],
                          [7, 8, 9.0]])

        // Iterate over rows
        var counter = 1
        for row in mat {
            if counter == mat.rows {
                XCTAssertEqual(row, [7, 8, 9.0])
            }
            counter += 1
        }

        // Iterate over columns
        counter = 1
        for col in transpose(mat) {
            if counter == mat.columns {
                XCTAssertEqual(col, [3, 6, 9.0])
            }
            counter += 1
        }
    }

    func testCopy() {
        // Modifying matrix B also modifies matrix A because matrix B is
        // a reference to matrix A
        let a = Matrix<Double>(rows: 2, columns: 3, fill: 0)
        var b = a
        b[0, 0] = 99
        b[0, 1] = 22
        XCTAssertEqual(a, [[99, 22, 0], [0, 0, 0]])

        // Modifying matrix D does not modify matrix C because matrix D is
        // a complete copy of matrix C
        let c = Matrix<Double>(rows: 2, columns: 3, fill: 0)
        var d = c.copy()
        d[0, 0] = 99
        d[0, 1] = 22
        XCTAssertEqual(c, [[0, 0, 0], [0, 0, 0]])
    }
}
