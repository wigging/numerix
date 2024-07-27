/*
 Tests for power function.
 */

import XCTest
import Numerix

final class PowerTests: XCTestCase {

    func testVectorFloat() {
        let vec = Vector<Float>([1, 2, 3, 4])
        XCTAssertEqual(pow(vec, 2), [1, 4, 9, 16])
        XCTAssertEqual(pow(vec, [2, 3, 2, 3]), [1, 8, 9, 64])

        var vecP = Vector<Float>([1, 2, 3, 4])
        vecP.pow(2.0)
        XCTAssertEqual(vecP, [1, 4, 9, 16])

        let vecPP = Vector<Float>([2, 3, 4, 5])
        XCTAssertEqual(vecPP^2, [4, 9, 16, 25])
    }

    func testVectorDouble() {
        let vec = Vector<Double>([1, 2, 3, 4])
        XCTAssertEqual(pow(vec, 2), [1, 4, 9, 16])
        XCTAssertEqual(pow(vec, [2, 3, 2, 3]), [1, 8, 9, 64])

        var vecP = Vector<Double>([1, 2, 3, 4])
        vecP.pow(2.0)
        XCTAssertEqual(vecP, [1, 4, 9, 16])

        let vecPP = Vector<Double>([2, 3, 4, 5])
        XCTAssertEqual(vecPP^2, [4, 9, 16, 25])
    }

    func testMatrixFloat() {
        let mat = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(pow(mat, 2), [[1, 4, 9], [16, 25, 36]])
        XCTAssert(isApprox(pow(mat, [2, 3, 2, 3, 1, 2]), [[1, 8, 9], [64, 5, 36]]))

        let matP: Matrix<Float> = [[2, 3], [4, 5]]
        XCTAssertEqual(matP^2, [[4, 9], [16, 25]])
    }

    func testMatrixDouble() {
        let mat = Matrix<Double>([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(pow(mat, 2), [[1, 4, 9], [16, 25, 36]])
        XCTAssertEqual(pow(mat, [2, 3, 2, 3, 1, 2]), [[1, 8, 9], [64, 5, 36]])

        let matP: Matrix<Double> = [[2, 3], [4, 5]]
        XCTAssertEqual(matP^2, [[4, 9], [16, 25]])
    }
}
