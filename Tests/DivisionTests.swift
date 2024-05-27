/*
 Tests for matrix division.
*/

import XCTest
import Numerix

final class DivisionTests: XCTestCase {

    func testMatrixDivision() {
        let mat = Matrix<Double>([[1, 2, 3],
                                  [4, 5, 6],
                                  [7, 8, 9]])

        let result1 = Matrix([[2.0, 1.0, 0.66],
                              [0.5, 0.4, 0.33],
                              [0.2857, 0.25, 0.22]])

        let result2 = Matrix([[0.5, 1.0, 1.5],
                              [2.0, 2.5, 3.0],
                              [3.5, 4.0, 4.5]])

        XCTAssert(isApprox(divide(2.0, mat), result1, rtol: 1e-2))  // divide scalar by matrix
        XCTAssert(isApprox(2.0 / mat, result1, rtol: 1e-2))         // divide scalar by matrix

        XCTAssert(isApprox(divide(mat, 2.0), result2, rtol: 1e-2))  // divide matrix by scalar
        XCTAssert(isApprox(mat / 2.0, result2, rtol: 1e-2))         // divide matrix by scalar
    }
}
