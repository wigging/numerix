/*
 Tests for the Vector structure.
 */

import XCTest
import Numerix

final class VectorTests: XCTestCase {

    func testInit() {
        let vec1 = Vector(size: 5, fill: 0)
        let vec2 = Vector(size: 4, fill: 2.2)
        XCTAssertEqual(vec1, [0, 0, 0, 0, 0])
        XCTAssertEqual(vec2, [2.2, 2.2, 2.2, 2.2])
    }

    func testInitRange() {
        // Integer tests
        let vecInt = Vector<Int>(0 ..< 10)
        XCTAssertEqual(vecInt, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])

        // Float tests
        let vecFloat = Vector<Float>(0 ..< 10)
        XCTAssertEqual(vecFloat, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])

        let vecFloat2 = Vector<Float>(-6 ..< 3)
        XCTAssertEqual(vecFloat2, [-6, -5, -4, -3, -2, -1, 0, 1, 2])

        // Double tests
        let vecDouble = Vector<Double>(5 ..< 12)
        XCTAssertEqual(vecDouble, [5, 6, 7, 8, 9, 10, 11])
    }

    func testProperties() {
        let vec = Vector([3, 4, 5, 6])
        XCTAssertEqual(vec.size, 4)
    }

    func testSubscript() {
        let vec = Vector([3, 5.8, 402.89, 1])
        XCTAssertEqual(vec[0], 3)
    }

    func testArrayLiteral() {
        let vec: Vector = [3, 4, 5, 6, 7, 8]
        XCTAssertEqual(vec, [3, 4, 5, 6, 7, 8])

        let vecFloat: Vector<Float> = [1, 2, 3, 4]
        XCTAssertEqual(vecFloat, [1, 2, 3, 4])

        let vecDouble: Vector = [1.0, 2, 3, 4.9]
        XCTAssertEqual(vecDouble, [1.0, 2, 3, 4.9])
    }

    func testEquatable() {
        let vec1: Vector = [1, 2, 3, 4, 5]
        let vec2: Vector = [1, 2, 3, 4, 5]
        XCTAssert(vec1 == vec2)

        let vec3: Vector = [1, 2, 3, 4, 5.5]
        let vec4: Vector = [1, 2, 3, 4, 5.5]
        XCTAssert(vec3 == vec4)

        let vec5: Vector = [0.2, 4, 5, 6]
        XCTAssert(vec4 != vec5)
    }

    func testMaxAbsIndex() {
        let vec1 = Vector<Float>([1, 2, 5, 3, 19, 0.2])
        let idx1 = vec1.maxAbsIndex()
        XCTAssertEqual(idx1, 4)

        let vec2 = Vector([1, 2, 5, 3, 0.4, -10, 8])
        let idx2 = vec2.maxAbsIndex()
        XCTAssertEqual(idx2, 5)
    }

    func testReverse() {
        var a = Vector<Float>([1, 2, 5, 3, 19, 0.2])
        a.reverse()
        XCTAssertEqual(a, [0.2, 19.0, 3.0, 5.0, 2.0, 1.0])

        var b = Vector<Double>([1, 2, 5, 3, 19, 0.2])
        b.reverse()
        XCTAssertEqual(b, [0.2, 19.0, 3.0, 5.0, 2.0, 1.0])
    }

    func testSort() {
        var a = Vector<Float>([3, 8, 5, 10, 6, 7, 8])
        a.sort(order: .ascending)
        XCTAssertEqual(a, [3, 5, 6, 7, 8, 8, 10])
        a.sort(order: .descending)
        XCTAssertEqual(a, [10, 8, 8, 7, 6, 5, 3])

        var b = Vector<Double>([3, 8, 5, 10, 6, 7, 8])
        b.sort(order: .ascending)
        XCTAssertEqual(b, [3, 5, 6, 7, 8, 8, 10])
        b.sort(order: .descending)
        XCTAssertEqual(b, [10, 8, 8, 7, 6, 5, 3])
    }
}
