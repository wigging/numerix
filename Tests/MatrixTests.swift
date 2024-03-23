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
        let m1 = Matrix(rows: 2, columns: 3, values: [3, 4, 8, 10, 11, 18.2])
        XCTAssertEqual(m1.values, [3, 4, 8, 10, 11, 18.2])
        
        let m2 = Matrix(rows: 2, columns: 3)
        XCTAssertEqual(m2.values, [0, 0, 0, 0, 0, 0])
        
        let x3: [Double] = [3, 4, 5, 8.1, 7, 9]
        let m3 = Matrix(rows: 2, columns: 3, values: x3)
        XCTAssertEqual(m3.values, x3)
    }
    
    func testSubscript() {
        let m = Matrix(rows: 2, columns: 3, values: [3, 4, 8, 10, 11, 18.2])
        XCTAssertEqual(m[0, 0], 3.0)
        XCTAssertEqual(m[1, 2], 18.2)
    }
}
