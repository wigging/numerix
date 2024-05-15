// Tests for calculating the norm of a vector.

import XCTest
import Numerix

final class NormTests: XCTestCase {

    func testVectorNorm() {
        let vec1 = Vector<Double>([1, 2, 3, 4])
        let vec2 = Vector<Float>([1, 2, 3, 4])

        XCTAssertEqual(norm(vec1), 5.47, accuracy: 0.01)
        XCTAssertEqual(norm(vec2), 5.47, accuracy: 0.01)
    }
}
