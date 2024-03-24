//
//  ArithmeticTests.swift
//  
//
//  Created by Gavin Wiggins on 3/16/24.
//

import XCTest
import Numerix
import Accelerate

final class ArithmeticTests: XCTestCase {
    
    let m = Matrix(rows: 2, columns: 2, values: [1, 2, 3, 4])
    let n = Matrix<Float>(rows: 2, columns: 2, values: [1, 2, 3, 4])
    let s = 2.0
    let t = Float(2.0)
        
    func testAddition() {
        // Double precision
        XCTAssertEqual((m + m).values, [2, 4, 6, 8])
        XCTAssertEqual((m + s).values, [3, 4, 5, 6])
        XCTAssertEqual((s + m).values, [3, 4, 5, 6])
        
        // Float precision
        XCTAssertEqual((n + n).values, [2, 4, 6, 8])
        XCTAssertEqual((n + t).values, [3, 4, 5, 6])
        XCTAssertEqual((t + n).values, [3, 4, 5, 6])
    }
}
