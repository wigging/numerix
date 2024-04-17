//
//  VectorSubtractionTests.swift
//  
//
//  Created by Gavin Wiggins on 4/16/24.
//

import XCTest
import Numerix

final class VectorSubtractionTests: XCTestCase {

    func testVectorSubtraction() {
        let vec1 = Vector([3.8, 4, 5, 6])
        let vec2 = Vector([1, 2, 3, 4.8])
        assertApproxEqual(vec1 - vec2, Vector([2.8, 2, 2, 1.2]))
        assertApproxEqual(vec1 - 2.0, Vector([1.8, 2, 3, 4]))
        assertApproxEqual(2.0 - vec1, Vector([-1.8, -2, -3, -4]))
    }
}
