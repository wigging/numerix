//
//  CumulativeSumTests.swift
//  
//
//  Created by Gavin Wiggins on 6/11/24.
//

import XCTest
import Numerix

final class CumulativeSumTests: XCTestCase {

    func testVectorFloat() {
        let a: Vector<Float> = [1, 2, 3, 4, 5]
        let c = cumulativeSum(a)
        XCTAssertEqual(c, Vector([1, 3, 6, 10, 15]))
    }

    func testVectorDouble() {
        let a: Vector<Double> = [1, 2, 3, 4, 5]
        let c = cumulativeSum(a)
        XCTAssertEqual(c, Vector([1, 3, 6, 10, 15]))
    }
}
