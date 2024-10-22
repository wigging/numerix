/*
Tests for the swap function.
*/

import XCTest
import Numerix

final class SwapTests: XCTestCase {

    func testVector() {
        let vec1 = Vector<Float>([2, 3, 4, 5, 6])
        let vec2 = Vector<Float>([9, 8, 7, 10, 12])
        swap(vec1, vec2)
        XCTAssertEqual(vec1, [9, 8, 7, 10, 12])
        XCTAssertEqual(vec2, [2, 3, 4, 5, 6])

        let vec3 = Vector<Double>([2, 3, 4, 5, 6])
        let vec4 = Vector<Double>([9, 8, 7, 10, 12])
        swap(vec3, vec4)
        XCTAssertEqual(vec3, [9, 8, 7, 10, 12])
        XCTAssertEqual(vec4, [2, 3, 4, 5, 6])
    }
}
