//
//  NormTests.swift
//  
//
//  Created by Gavin Wiggins on 4/15/24.
//

import XCTest
import Numerix

final class NormTests: XCTestCase {

    func testVectorNorm() {
        let vec = Vector<Double>([1, 2, 3, 4])
        let nrm = norm(vec)
        XCTAssertEqual(nrm, 5.47, accuracy: 0.01)

        let vec2 = Vector<Float>([1, 2, 3, 4])
        let nrm2 = norm(vec2)
        XCTAssertEqual(nrm2, 5.47, accuracy: 0.01)
    }
}
