/*
 Tests for matrix division.
*/

import XCTest
import Numerix

final class DivisionTests: XCTestCase {

    func testScalarMatrix() {
        let matF = Matrix<Float>([[1, 2, 3],
                                  [4, 5, 6],
                                  [7, 8, 9]])
        let resF = Matrix<Float>([[2.0, 1.0, 0.66],
                                  [0.5, 0.4, 0.33],
                                  [0.2857, 0.25, 0.22]])
        XCTAssert(isApprox(2.0 / matF, resF, rtol: 1e-2))

        let matD = Matrix<Double>([[1, 2, 3],
                                  [4, 5, 6],
                                  [7, 8, 9]])
        let resD = Matrix<Double>([[2.0, 1.0, 0.66],
                                   [0.5, 0.4, 0.33],
                                   [0.2857, 0.25, 0.22]])
        XCTAssert(isApprox(2.0 / matD, resD, rtol: 1e-2))
    }

    func testMatrixScalar() {
        let matF = Matrix<Float>([[1, 2, 3],
                                  [4, 5, 6],
                                  [7, 8, 9]])
        let resF = Matrix<Float>([[0.5, 1, 1.5],
                                  [2, 2.5, 3],
                                  [3.5, 4, 4.5]])
        XCTAssertEqual(matF / 2.0, resF)

        let matD = Matrix<Double>([[1, 2, 3],
                                   [4, 5, 6],
                                   [7, 8, 9]])
        let resD = Matrix<Double>([[0.5, 1, 1.5],
                                   [2, 2.5, 3],
                                   [3.5, 4, 4.5]])
        XCTAssertEqual(matD / 2.0, resD)

        var matFF = Matrix<Float>([[1, 2, 3],
                                   [4, 5, 6],
                                   [7, 8, 9]])
        matFF /= 2.0
        XCTAssertEqual(matFF, Matrix<Float>([[0.5, 1, 1.5],
                                             [2, 2.5, 3],
                                             [3.5, 4, 4.5]]))

        var matDD = Matrix<Double>([[1, 2, 3],
                                   [4, 5, 6],
                                   [7, 8, 9]])
        matDD /= 2.0
        XCTAssertEqual(matDD, Matrix<Double>([[0.5, 1, 1.5],
                                              [2, 2.5, 3],
                                              [3.5, 4, 4.5]]))
    }
}
