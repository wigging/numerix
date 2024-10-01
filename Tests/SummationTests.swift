/*
Tests for summation functions.
*/

import XCTest
import Numerix

final class CumulativeSumTests: XCTestCase {

    func testSum() {
        let a = Vector<Float>([1, 2, 3, 4, 5])
        let sumA = sum(a)
        XCTAssertEqual(sumA, 15.0)

        let b = Vector<Double>([1, 2, 3, 4, 5])
        let sumB = sum(b)
        XCTAssertEqual(sumB, 15.0)

        let c = Vector<Float>([1, 2, 3, 4, 5])
        let sumC = c.sum()
        XCTAssertEqual(sumC, 15.0)

        let d = Vector<Double>([1, 2, 3, 4, 5])
        let sumD = d.sum()
        XCTAssertEqual(sumD, 15.0)
    }

    func testVectorFloat() {
        let a: Vector<Float> = [1, 2, 3, 4, 5]
        let cumulSumA = cumulativeSum(a)
        XCTAssertEqual(cumulSumA, Vector([1, 3, 6, 10, 15]))

        let b: Vector<Double> = [1, 2, 3, 4, 5]
        let cumulSumB = cumulativeSum(b)
        XCTAssertEqual(cumulSumB, Vector([1, 3, 6, 10, 15]))
    }
}
