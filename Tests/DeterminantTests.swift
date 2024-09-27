/*
Tests for the determinant function.
*/

import XCTest
import Numerix

final class DeterminantTests: XCTestCase {

    func testNotSingular() throws {
        let A: Matrix<Double> = [[1, 2], [3, 4]]
        let detA = try determinant(A)
        XCTAssertEqual(detA, -2.0)

        let B: Matrix<Float> = [[1, 12, 3],
                                [4, 5, 6],
                                [7, 8, 9.5]]
        let detB = try determinant(B)
        XCTAssertEqual(detB, 38.500015)
    }

    func testSingular() throws {
        let B: Matrix<Float> = [[0, 12, 0],
                                [4, 5, 0],
                                [7, 0, 0]]
        do {
            let detB = try determinant(B)
            print(detB)
        } catch DeterminantError<Float>.singular(let err, let U) {
            let msg = """
            U(2,2) is exactly zero. The factorization has been completed, but the factor U is exactly singular, \
            and division by zero will occur if it is used to solve a system of equations.
            """
            let mat: Matrix<Float> = [[12, 0, 0],
                                      [5, 4, 0],
                                      [0, 7, 0]]
            XCTAssertEqual(err, msg)
            XCTAssertEqual(U, mat)
        }
    }
}
