//
//  PadTests.swift
//  
//
//  Created by Gavin Wiggins on 6/7/24.
//

import XCTest
import Numerix

final class PadTests: XCTestCase {

    func testPadFloat() {
        let mat: Matrix<Float> = [[1, 2],
                                  [3, 4]]
        let res: Matrix<Float> = [[0, 0, 0, 0],
                                  [0, 1, 2, 0],
                                  [0, 3, 4, 0],
                                  [0, 0, 0, 0]]
        XCTAssertEqual(pad(mat), res)
    }

    func testPadWithFloat() {
        let mat: Matrix<Float> = [[1, 2],
                                  [3, 4]]
        let res: Matrix<Float> = [[5, 5, 5, 5],
                                  [5, 1, 2, 5],
                                  [5, 3, 4, 5],
                                  [5, 5, 5, 5]]
        XCTAssertEqual(pad(mat, with: 5), res)
    }

    func testPadDouble() {
        let mat: Matrix<Double> = [[1, 2],
                                   [3, 4]]
        let res: Matrix<Double> = [[0, 0, 0, 0],
                                   [0, 1, 2, 0],
                                   [0, 3, 4, 0],
                                   [0, 0, 0, 0]]
        XCTAssertEqual(pad(mat), res)
    }

    func testPadWithDouble() {
        let mat: Matrix<Double> = [[1, 2],
                                   [3, 4]]
        let res: Matrix<Double> = [[7, 7, 7, 7],
                                   [7, 1, 2, 7],
                                   [7, 3, 4, 7],
                                   [7, 7, 7, 7]]
        XCTAssertEqual(pad(mat, with: 7), res)
    }
}
