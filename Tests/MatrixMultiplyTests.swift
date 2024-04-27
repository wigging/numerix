//
//  MatrixMultiplyTests.swift
//  
//
//  Created by Gavin Wiggins on 4/23/24.
//

import XCTest
import Numerix

final class MatrixMultiplyTests: XCTestCase {

    func testMultiply() {
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
