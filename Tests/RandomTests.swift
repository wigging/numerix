/*
 Tests for the Matrix random() function.
 */

import XCTest
import Numerix

final class RandomTests: XCTestCase {

    func testRandomMatrix() {
        let matrixD = Matrix<Double>.random(rows: 2, columns: 3, dist: 1)
        XCTAssertLessThanOrEqual(matrixD[0, 0], 1.0)

        let matrixF = Matrix<Float>.random(rows: 2, columns: 3, dist: 1)
        XCTAssertLessThanOrEqual(matrixF[0, 0], 1.0)
    }
}
