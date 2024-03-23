//
//  ArithmeticTests.swift
//  
//
//  Created by Gavin Wiggins on 3/16/24.
//

import XCTest
import Numerix

final class ArithmeticTests: XCTestCase {
    
    func testAddition() {
        let m1 = Matrix(rows: 2, columns: 2, values: [1.0, 2.0, 5.0, 6.0])
        let m2 = Matrix(rows: 2, columns: 2, values: [4.2, 2.0, 1.0, 8.7])
        let x = m1 + m2
        XCTAssertEqual(x.values, [5.2, 4.0, 6.0, 14.7])
        
        let m3: Matrix<Float> = Matrix(rows: 2, columns: 2, values: [1.0, 2.0, 5.0, 6.0])
        let m4: Matrix<Float> = Matrix(rows: 2, columns: 2, values: [4.2, 2.0, 1.0, 8.7])
        let y = m3 + m4
        XCTAssertEqual(y.values, [5.2, 4.0, 6.0, 14.7])
    }
}
