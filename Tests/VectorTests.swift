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

    func testAddition() {
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

    func testSubtraction() {
        let vec1 = Vector([3.8, 4, 5, 6])
        let vec2 = Vector([1, 2, 3, 4.8])
        assertApproxEqual(vec1 - vec2, Vector([2.8, 2, 2, 1.2]))
        assertApproxEqual(vec1 - 2.0, Vector([1.8, 2, 3, 4]))
        assertApproxEqual(2.0 - vec1, Vector([-1.8, -2, -3, -4]))
    }

    func testMultiplication() {
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
