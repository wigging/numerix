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
}
