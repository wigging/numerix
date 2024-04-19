//
//  VectorMultiplyTests.swift
//  
//
//  Created by Gavin Wiggins on 4/18/24.
//

import XCTest
import Numerix

final class VectorMultiplyTests: XCTestCase {

    func testVectorMultiply() {
        let vec1 = Vector([1, 2, 3, 4])
        let vec2 = Vector([2, 3, 4, 5])

        assertApproxEqual(vec1 * vec2, Vector([2, 6, 12, 20]))
        assertApproxEqual(2.0 * vec1, Vector([2, 4, 6, 8]))
        assertApproxEqual(vec1 * 2.0, Vector([2, 4, 6, 8]))

        let vec3 = Vector<Float>([1, 2, 3, 4])
        let vec4 = Vector<Float>([2, 3, 4, 5])

        assertApproxEqual(vec3 * vec4, Vector<Float>([2, 6, 12, 20]))
        assertApproxEqual(2.0 * vec3, Vector<Float>([2, 4, 6, 8]))
        assertApproxEqual(vec3 * 2.0, Vector<Float>([2, 4, 6, 8]))
    }
}
