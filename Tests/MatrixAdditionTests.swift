//
//  MatrixAdditionTests.swift
//  
//
//  Created by Gavin Wiggins on 4/16/24.
//

import XCTest
import Numerix

final class MatrixAdditionTests: XCTestCase {

    func testMatrixAddition() {
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
}
