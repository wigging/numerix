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
        let v = Vector([3, 5.8, 4, 1])
        XCTAssertEqual(v[0], 3)
    }
    
    func testFill() {
        let v1 = Vector(size: 5)
        XCTAssertEqual(v1[0], 0.0)
        
        let v2 = Vector(size: 4, fill: 2.2)
        XCTAssertEqual(v2[0], 2.2)
    }
    
    func testAddition() {
        let v1 = Vector([3.8, 4, 5, 6])
        let v2 = Vector([1, 2, 3, 4.9])
        XCTAssertEqual((v1 + v2).values, [4.8, 6, 8, 10.9])
    }
}
