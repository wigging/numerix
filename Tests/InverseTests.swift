/*
Tests for the inverse function using single and double precision.

For some reason, the Xcode tests need to access the function as `Numerix.inverse`
otherwise it gets confused with the `inverse` Collection function.
*/

import XCTest
import Numerix

final class InverseTests: XCTestCase {

    func testNotSingular() throws {
        let A = Matrix<Float>([[1, 2], [3, 4]])
        let invA = try Numerix.inverse(A)
        XCTAssertEqual(invA, [[-2, 1], [1.5, -0.5]])

        let B = Matrix<Double>([[1, 2], [3, 4]])
        let invB = try Numerix.inverse(B)
        XCTAssertEqual(invB, [[-2, 1], [1.5, -0.5]])
    }

    func testSingular() throws {
        let A = Matrix<Float>([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
        XCTAssertThrowsError(try Numerix.inverse(A))

        let B = Matrix<Double>([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
        XCTAssertThrowsError(try Numerix.inverse(B))

        let C: Matrix<Float> = [[1, 2, 3, 4],
                                [4, 5, 6, 7],
                                [8, 9, 10, 11],
                                [12, 13, 14, 15]]

        do {
            let invC = try Numerix.inverse(C)
            print(invC)
        } catch InverseError<Float>.singular(let err, let U) {
            let msg = """
            U(3,3) is exactly zero. The factorization has been completed, but the factor U is exactly singular, \
            and division by zero will occur if it is used to solve a system of equations.
            """
            let mat: Matrix<Float> = [[4.0, 0.25, 0.5, 0.75],
                                      [7.0, 2.25, 0.6666667, 0.33333334],
                                      [11.0, 5.25, -1.0430813e-07, 0.5 ],
                                      [15.0, 8.25, -1.6391277e-07, 0.0]]
            XCTAssertEqual(err, msg)
            XCTAssertEqual(U, mat)
        }
    }
}
