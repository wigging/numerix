//
//  VectorAdditionTests.swift
//  
//
//  Created by Gavin Wiggins on 4/16/24.
//

import XCTest
import Numerix

final class VectorAdditionTests: XCTestCase {

    func testVectorAddition() {
        let vec1 = Vector([1, 2, 3, 4])
        let vec2 = Vector([5, 2, 3, 1])
        assertApproxEqual(vec1 + vec2, Vector([6, 4, 6, 5]))

        let vec3 = Vector<Float>([5, 4, 3, 2])
        let vec4 = Vector<Float>([6, 5, 4, 3])
        assertApproxEqual(vec3 + vec4, Vector<Float>([11, 9, 7, 5]))

        assertApproxEqual(vec1 + 2.0, Vector([3, 4, 5, 6]))
        assertApproxEqual(2.0 + vec1, Vector([3, 4, 5, 6]))

        assertApproxEqual(vec3 + 2.0, Vector<Float>([7, 6, 5, 4]))
        assertApproxEqual(2.0 + vec3, Vector<Float>([7, 6, 5, 4]))
    }
}
