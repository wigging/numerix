//
//  TransposeTests.swift
//  
//
//  Created by Gavin Wiggins on 6/4/24.
//

import XCTest
import Numerix

final class TransposeTests: XCTestCase {

    func testMatrixFloat() {
        let a: Matrix<Float> = [[2, 3, 4, 5],
                                [6, 7, 8, 9]]
        let t = transpose(a)
        XCTAssertEqual(t, Matrix<Float>(rows: 4, columns: 2, values: [2, 6, 3, 7, 4, 8, 5, 9]))
    }

    func testMatrixDouble() {
        let a: Matrix<Double> = [[2, 3, 4, 5],
                                [6, 7, 8, 9]]
        let t = transpose(a)
        XCTAssertEqual(t, Matrix<Double>(rows: 4, columns: 2, values: [2, 6, 3, 7, 4, 8, 5, 9]))
    }
}
