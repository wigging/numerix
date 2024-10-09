/*
Tests for the scale function.
*/

import XCTest
import Numerix

final class ScaleTests: XCTestCase {

    func testVector() {
        // Single precision
        let vec1 = Vector<Float>([1, 2, 3, 4, 5])
        vec1.scale(by: 2.0)
        XCTAssertEqual(vec1, [2, 4, 6, 8, 10])

        let vec2 = Vector<Float>([1, 2, 3, 4, 5])
        let res2 = scale(vec2, by: 2.5)
        XCTAssertEqual(res2, [2.5, 5.0, 7.5, 10.0, 12.5])

        // Double precision
        let vec3 = Vector<Double>([1, 2, 3, 4, 5])
        vec3.scale(by: 2.0)
        XCTAssertEqual(vec3, [2, 4, 6, 8, 10])

        let vec4 = Vector<Double>([1, 2, 3, 4, 5])
        let res4 = scale(vec4, by: 2.5)
        XCTAssertEqual(res4, [2.5, 5.0, 7.5, 10.0, 12.5])
    }
}
