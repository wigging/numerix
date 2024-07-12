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
        let resultVecF = Vector<Float>([2.71828183, 7.3890561, 20.08553692, 54.59815003, 148.4131591])
        let resultVecD = Vector<Double>([2.71828183, 7.3890561, 20.08553692, 54.59815003, 148.4131591])

        XCTAssert(isApprox(exp(vecF), resultVecF))
        XCTAssert(isApprox(exp(vecD), resultVecD))

        let resultMatF = Matrix<Float>([[2.71828183, 7.3890561, 20.08553692],
                                        [54.59815003, 148.4131591, 403.42879349]])

        let resultMatD = Matrix<Double>([[2.71828183, 7.3890561, 20.08553692],
                                        [54.59815003, 148.4131591, 403.42879349]])

        XCTAssert(isApprox(exp(matF), resultMatF))
        XCTAssert(isApprox(exp(matD), resultMatD))
    }

    func testExponentialTwo() {
        let resultVecF = Vector<Float>([2, 4, 8, 16, 32])
        let resultVecD = Vector<Double>([2, 4, 8, 16, 32])

        XCTAssert(isApprox(exp2(vecF), resultVecF))
        XCTAssert(isApprox(exp2(vecD), resultVecD))

        let resultMatF = Matrix<Float>([[2, 4, 8], [16, 32, 64]])
        let resultMatD = Matrix<Double>([[2, 4, 8], [16, 32, 64]])

        XCTAssert(isApprox(exp2(matF), resultMatF))
        XCTAssert(isApprox(exp2(matD), resultMatD))
    }

    func testExponentialMinusOne() {
        let resF: Vector<Float> = [1.7182, 6.3890, 19.0855, 53.5981, 147.4131]
        let checkF = isApprox(expm1(vecF), resF, rtol: 1e-4)
        XCTAssert(checkF)

        let resD: Vector<Double> = [1.7182, 6.3890, 19.0855, 53.5981, 147.4131]
        let checkD = isApprox(expm1(vecD), resD, rtol: 1e-4)
        XCTAssert(checkD)

        let resMatF: Matrix<Float> = [[1.7182, 6.3890, 19.0855], [53.5981, 147.4130, 402.4290]]
        let checkMatF = isApprox(expm1(matF), resMatF, rtol: 1e-4)
        XCTAssert(checkMatF)

        let resMatD: Matrix<Double> = [[1.7182, 6.3890, 19.0855], [53.5981, 147.4130, 402.4290]]
        let checkMatD = isApprox(expm1(matD), resMatD, rtol: 1e-4)
        XCTAssert(checkMatD)
    }
}
