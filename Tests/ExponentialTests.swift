/*
 Tests for exponential functions.
 */

import XCTest
import Numerix

final class ExponentialTests: XCTestCase {

    let vecF = Vector<Float>([1, 2, 3, 4, 5])
    let vecD = Vector<Double>([1, 2, 3, 4, 5])

    let matF = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
    let matD = Matrix<Double>([[1, 2, 3], [4, 5, 6]])

    func testExponential() {
        XCTAssert(isApprox(exp(vecF), [2.718281, 7.389056, 20.085536, 54.598150, 148.413159], rtol: 1e-4))
        XCTAssert(isApprox(exp(vecD), [2.718281, 7.389056, 20.085536, 54.598150, 148.413159], rtol: 1e-4))

        XCTAssert(isApprox(exp(matF), [[2.718281, 7.389056, 20.085536], [54.598150, 148.413159, 403.428793]], rtol: 1e-4))
        XCTAssert(isApprox(exp(matD), [[2.718281, 7.389056, 20.085536], [54.598150, 148.413159, 403.428793]], rtol: 1e-4))
    }

    func testExponentialTwo() {
        XCTAssert(isApprox(exp2(vecF), [2, 4, 8, 16, 32]))
        XCTAssert(isApprox(exp2(vecD), [2, 4, 8, 16, 32]))

        XCTAssert(isApprox(exp2(matF), [[2, 4, 8], [16, 32, 64]]))
        XCTAssert(isApprox(exp2(matD), [[2, 4, 8], [16, 32, 64]]))
    }

    func testExponentialMinusOne() {
        XCTAssert(isApprox(expm1(vecF), [1.7182, 6.3890, 19.0855, 53.5981, 147.4131], rtol: 1e-4))
        XCTAssert(isApprox(expm1(vecD), [1.7182, 6.3890, 19.0855, 53.5981, 147.4131], rtol: 1e-4))

        XCTAssert(isApprox(expm1(matF), [[1.7182, 6.3890, 19.0855], [53.5981, 147.4130, 402.4290]], rtol: 1e-4))
        XCTAssert(isApprox(expm1(matD), [[1.7182, 6.3890, 19.0855], [53.5981, 147.4130, 402.4290]], rtol: 1e-4))
    }
}
