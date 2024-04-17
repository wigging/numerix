//
//  DescriptionTests.swift
//  
//
//  Created by Gavin Wiggins on 4/16/24.
//

import XCTest
import Numerix

final class DescriptionTests: XCTestCase {

    func testMatrixDescription() {
        let mat = Matrix(rows: 2, columns: 3, values: [3, 4, 8, 10, 11, 18.2])
        let desc = """
        2x3 Matrix<Double>
         3.00  4.00  8.00
         10.00  11.00  18.20
        """
        XCTAssertEqual(String(describing: mat), desc)
    }

    func testVectorDescription() {
        let vec = Vector([3, 5.8, 402.89, 1])
        let desc = """
        4-element Vector<Double>
         3.00  5.80  402.89  1.00
        """
        XCTAssertEqual(String(describing: vec), desc)
    }
}
