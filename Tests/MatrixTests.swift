//
//  MatrixTests.swift
//  
//
//  Created by Gavin Wiggins on 3/16/24.
//

import XCTest
import Numerix

final class MatrixTests: XCTestCase {

    func testInit() {
        let matrix1 = Matrix(rows: 2, columns: 3, values: [3, 4, 8, 10, 11, 18.2])
        XCTAssertEqual(matrix1.values, [3, 4, 8, 10, 11, 18.2])

        let matrix2 = Matrix(rows: 2, columns: 3)
        XCTAssertEqual(matrix2.values, [0, 0, 0, 0, 0, 0])

        let matrix3 = Matrix([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(matrix3.values, [1, 2, 3, 4, 5, 6])
    }

    func testSubscript() {
        let matrix = Matrix(rows: 2, columns: 3, values: [3, 4, 8, 10, 11, 18.2])
        XCTAssertEqual(matrix[0, 0], 3.0)
        XCTAssertEqual(matrix[1, 2], 18.2)
    }

    func testAddition() {
        let mat1 = Matrix([[1, 2, 3], [4, 5, 6]])
        let mat2 = Matrix([[2, 2, 3], [8, 5, 6]])
        assertApproxEqual(mat1 + mat2, Matrix([[3, 4, 6], [12, 10, 12]]))

        let mat3 = Matrix<Float>([[1, 2, 3], [9, 5, 6]])
        let mat4 = Matrix<Float>([[4, 2, 3], [4, 5, 6]])
        assertApproxEqual(mat3 + mat4, Matrix<Float>([[5, 4, 6], [13, 10, 12]]))

        assertApproxEqual(mat1 + 2.0, Matrix([[3, 4, 5], [6, 7, 8]]))
        assertApproxEqual(2.0 + mat1, Matrix([[3, 4, 5], [6, 7, 8]]))

        assertApproxEqual(mat3 + 2.0, Matrix<Float>([[3, 4, 5], [11, 7, 8]]))
        assertApproxEqual(2.0 + mat3, Matrix<Float>([[3, 4, 5], [11, 7, 8]]))
    }

    func testMultiplication() {
        let mat1 = Matrix([[1, 0, 1],
                           [2, 1, 1],
                           [0, 1, 1],
                           [1, 2, 3]])
        let mat2 = Matrix([[1, 2, 1],
                           [2, 3, 1],
                           [4, 2, 2]])
        let result = Matrix([[5, 4, 3],
                             [8, 9, 5],
                             [6, 5, 3],
                             [17, 14, 9]])
        assertApproxEqual(mat1 * mat2, result)
    }

    func testElementWise() {
        let mat1 = Matrix([[1, 2, 3],
                           [4, 5, 6]])
        let mat2 = Matrix([[2, 2, 3],
                           [8, 5, 6]])
        let result12 = Matrix([[2, 4, 9],
                             [32, 25, 36]])
        assertApproxEqual(mat1 .* mat2, result12)

        let mat3 = Matrix([[2, 3, 1],
                           [0, 8, -2]])
        let mat4 = Matrix([[3, 1, 4],
                           [7, 9, 5]])
        let result34 = Matrix([[6, 3, 4],
                             [0, 72, -10]])
        assertApproxEqual(mat3 ⊙ mat4, result34)
    }
}
