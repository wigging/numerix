/*
 Tests for Vector dot product.
 */

import XCTest
import Numerix

final class DotProductTests: XCTestCase {

    func testVectorFloat() {
        let a: Vector<Float> = [1, 2, 3, 4, 5]
        let b: Vector<Float> = [9, 2, 3, 4, 5]
        let c = a ⋅ b
        XCTAssertEqual(c, 63.0)

        let cc = dot(a, b)
        XCTAssertEqual(cc, 63.0)
    }

    func testVectorDouble() {
        let a: Vector = [1, 2, 3, 4, 5.0]
        let b: Vector = [9, 2, 3, 4, 5.0]
        let c = a ⋅ b
        XCTAssertEqual(c, 63.0)

        let cc = dot(a, b)
        XCTAssertEqual(cc, 63.0)
    }
}
