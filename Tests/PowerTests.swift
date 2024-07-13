/*
 Tests for power function.
 */

import XCTest
import Numerix

final class PowerTests: XCTestCase {
    
    func testVectorFloat() {
        let vec = Vector<Float>([1, 2, 3, 4])

        let res1 = pow(vec, 2)
        XCTAssertEqual(res1, [1, 4, 9, 16])

        let res2 = pow(vec, [2, 3, 2, 3])
        XCTAssertEqual(res2, [1, 8, 9, 64])
    }

    func testVectorDouble() {
        let vec = Vector<Double>([1, 2, 3, 4])

        let res1 = pow(vec, 2)
        XCTAssertEqual(res1, [1, 4, 9, 16])

        let res2 = pow(vec, [2, 3, 2, 3])
        XCTAssertEqual(res2, [1, 8, 9, 64])
    }

    func testMatrixFloat() {
        let mat = Matrix<Float>([[1, 2, 3], [4, 5, 6]])

        let res1 = pow(mat, 2)
        XCTAssertEqual(res1, [[1, 4, 9], [16, 25, 36]])

        let res2 = pow(mat, [2, 3, 2, 3, 1, 2])
        XCTAssert(isApprox(res2, [[1, 8, 9], [64, 5, 36]]))
    }

    func testMatrixDouble() {
        let mat = Matrix<Double>([[1, 2, 3], [4, 5, 6]])

        let res1 = pow(mat, 2)
        XCTAssertEqual(res1, [[1, 4, 9], [16, 25, 36]])

        let res2 = pow(mat, [2, 3, 2, 3, 1, 2])
        XCTAssertEqual(res2, [[1, 8, 9], [64, 5, 36]])
    }
}
