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
        let mat1 = Matrix<Double>(rows: 2, columns: 3, values: [3, 4, 8, 10, 11, 18.2])
        XCTAssertEqual(mat1.values, [3, 4, 8, 10, 11, 18.2])

        let mat2 = Matrix(rows: 2, columns: 3)
        XCTAssertEqual(mat2.values, [0, 0, 0, 0, 0, 0])

        let mat3 = Matrix([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(mat3.values, [1, 2, 3, 4, 5, 6])
    }

    func testSubscript() {
        let mat = Matrix(rows: 2, columns: 3, values: [3, 4, 8, 10, 11, 18.2])
        XCTAssertEqual(mat[0, 0], 3.0)
        XCTAssertEqual(mat[1, 2], 18.2)
    }

    func testAddition() {
        let mat1 = Matrix<Double>([[1, 2, 3], [4, 5, 6]])
        let mat2 = Matrix<Double>([[2, 2, 3], [8, 5, 6]])
        let res1 = Matrix<Double>([[3, 4, 6], [12, 10, 12]])
        XCTAssert(isApprox(mat1 + mat2, res1))

        let mat3 = Matrix<Float>([[1, 2, 3], [9, 5, 6]])
        let mat4 = Matrix<Float>([[4, 2, 3], [4, 5, 6]])
        let res2 = Matrix<Float>([[5, 4, 6], [13, 10, 12]])
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

    func textComplexMultiplication() {
        let a = Matrix([[Complex(real: 1.0, imag: 2.0), Complex(real: 2.0, imag: 3.0)],
                        [Complex(real: 5.0, imag: 6.0), Complex(real: 7.0, imag: 8.0)]])

        let b = Matrix([[Complex(real: 1.0, imag: 2.0), Complex(real: 2.0, imag: 3.0)],
                        [Complex(real: 5.0, imag: 6.0), Complex(real: 7.0, imag: 8.0)]])

        let c = a * b

        XCTAssertEqual(c[0, 0].real, -11.0)
        XCTAssertEqual(c[0, 0].imag, 31.0)
    }

    func testElementWise() {
        let mat1 = Matrix([[1.0, 2.0, 3.0],
                           [4.0, 5.0, 6.0]])

        let mat2 = Matrix([[2.0, 2.0, 3.0],
                           [8.0, 5.0, 6.0]])
        
        let result12 = Matrix([[2.0, 4.0, 9.0],
                               [32.0, 25.0, 36.0]])
        
        XCTAssert(isApprox(mat1 .* mat2, result12))

        let mat3 = Matrix([[2.0, 3.0, 1.0],
                           [0.0, 8.0, -2.0]])

        
        let mat4 = Matrix([[3.0, 1.0, 4.0],
                           [7.0, 9.0, 5.0]])
        
        let result34 = Matrix([[6.0, 3.0, 4.0],
                               [0.0, 72.0, -10.0]])
        
        XCTAssert(isApprox(mat3 ⊙ mat4, result34))
    }
}
