//
//  ExponentialTests.swift
//  
//
//  Created by Gavin Wiggins on 5/21/24.
//

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
}
