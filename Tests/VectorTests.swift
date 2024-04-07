//
//  VectorTests.swift
//  
//
//  Created by Gavin Wiggins on 3/26/24.
//

import XCTest
import Numerix

final class VectorTests: XCTestCase {

    func testSubscript() {
        let vector = Vector([3, 5.8, 402.89, 1])
        XCTAssertEqual(vector[0], 3)
    }

    func testDescription() {
        let vec = Vector([3, 5.8, 402.89, 1])
        let desc = """
        4-element Vector<Double>
         3.00  5.80  402.89  1.00
        """
        XCTAssertEqual(String(describing: vec), desc)
    }

    func testFill() {
        let vector1 = Vector(size: 5)
        XCTAssertEqual(vector1[0], 0.0)

        let vector2 = Vector(size: 4, fill: 2.2)
        XCTAssertEqual(vector2[0], 2.2)
    }

    func testAddition() {
        let vector1 = Vector([3.8, 4, 5, 6])
        let vector2 = Vector([1, 2, 3, 4.9])
        XCTAssertEqual((vector1 + vector2).values, [4.8, 6, 8, 10.9])

        XCTAssertEqual((vector1 + 2.8).values, [6.6, 6.8, 7.8, 8.8])
        XCTAssertEqual((2.8 + vector1).values, [6.6, 6.8, 7.8, 8.8])
    }
}
