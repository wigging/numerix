//
//  VectorTests.swift
//  
//
//  Created by Gavin Wiggins on 3/26/24.
//

import XCTest
import Numerix

final class VectorTests: XCTestCase {

    func testInit() {
        let vector1 = Vector(size: 5)
        XCTAssertEqual(vector1[0], 0.0)

        let vector2 = Vector(size: 4, fill: 2.2)
        XCTAssertEqual(vector2[0], 2.2)
    }

    func testSubscript() {
        let vector = Vector([3, 5.8, 402.89, 1])
        XCTAssertEqual(vector[0], 3)
    }
}
