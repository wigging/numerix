//
//  ArithmeticTests.swift
//  
//
//  Created by Gavin Wiggins on 3/16/24.
//

import XCTest
import Numerix

final class ArithmeticTests: XCTestCase {

    let matrixD = Matrix(rows: 2, columns: 2, values: [1, 2, 3, 4])
    let matrixF = Matrix<Float>(rows: 2, columns: 2, values: [1, 2, 3, 4])
    let scalarD = 2.0
    let scalarF = Float(2.0)

    func testAddition() {
        // Double precision
        XCTAssertEqual((matrixD + matrixD).values, [2, 4, 6, 8])
        XCTAssertEqual((matrixD + scalarD).values, [3, 4, 5, 6])
        XCTAssertEqual((scalarD + matrixD).values, [3, 4, 5, 6])

        // Float precision
        XCTAssertEqual((matrixF + matrixF).values, [2, 4, 6, 8])
        XCTAssertEqual((matrixF + scalarF).values, [3, 4, 5, 6])
        XCTAssertEqual((scalarF + matrixF).values, [3, 4, 5, 6])
    }
}
