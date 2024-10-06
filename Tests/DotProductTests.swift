/*
 Tests for dot product operators and functions.
 */

import XCTest
import Numerix

final class DotProductTests: XCTestCase {

    func testSinglePrecision() {
        let x: Vector<Float> = [1, 2, 3, 4, 5]
        let y: Vector<Float> = [9, 2, 3, 4, 5]
        XCTAssertEqual(x ⋅ y, 63.0)

        let a = dotProduct(x, y)
        XCTAssertEqual(a, 63.0)

        let b = dotProduct(x, y, stride: (2, 2))
        XCTAssertEqual(b, 43.0)

        let c = dotProductExtended(x, y)
        XCTAssertEqual(c, 63.0)

        let d = dotProductExtended(x, y, stride: (2, 2))
        XCTAssertEqual(d, 43.0)

        let e = dotProductExtended(x, y, scalar: 1.4)
        XCTAssertEqual(e, 64.4)

        let f = dotProductExtended(x, y, scalar: 1.4, stride: (2, 2))
        XCTAssertEqual(f, 44.4)
    }

    func testDoublePrecision() {
        let a: Vector<Double> = [1, 2, 3, 4, 5]
        let b: Vector<Double> = [9, 2, 3, 4, 5]
        XCTAssertEqual(a ⋅ b, 63.0)

        let c = dotProduct(a, b)
        XCTAssertEqual(c, 63.0)

        let d = dotProduct(a, b, stride: (2, 2))
        XCTAssertEqual(d, 43.0)
    }
}
