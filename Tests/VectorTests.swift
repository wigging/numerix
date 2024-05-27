// Tests for vector initialization, properties, subscript, addition,
// subtraction, and multiplication.

import XCTest
import Numerix

final class VectorTests: XCTestCase {

    func testInit() {
        let vec1 = Vector(length: 5)
        let vec2 = Vector(length: 4, fill: 2.2)

        XCTAssertEqual(vec1[0], 0.0)
        XCTAssertEqual(vec2[0], 2.2)
    }

    func testProperties() {
        let vec = Vector([3, 4, 5, 6])
        XCTAssertEqual(vec.length, 4)
    }

    func testSubscript() {
        let vec = Vector([3, 5.8, 402.89, 1])
        XCTAssertEqual(vec[0], 3)
    }

    func testArrayLiteral() {
        let vec: Vector = [3, 4, 5, 6, 7, 8]
        XCTAssertEqual(vec.values, [3, 4, 5, 6, 7, 8])

        let vecFloat: Vector<Float> = [1, 2, 3, 4]
        XCTAssertEqual(vecFloat.values, [1, 2, 3, 4])

        let vecDouble: Vector = [1.0, 2, 3, 4.9]
        XCTAssertEqual(vecDouble.values, [1.0, 2, 3, 4.9])
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
}
