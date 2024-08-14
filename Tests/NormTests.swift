/*
 Tests for Vector norm() function.
 */

import XCTest
import Numerix

final class NormTests: XCTestCase {

    func testVector() {
        let vec1 = Vector<Double>([1, 2, 3, 4])
        let vec2 = Vector<Float>([1, 2, 3, 4])

        XCTAssertEqual(norm(vec1), 5.47, accuracy: 0.01)
        XCTAssertEqual(norm(vec2), 5.47, accuracy: 0.01)
    }

    func testMatrix() {
        let matF = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
        let matD = Matrix<Double>([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(norm(matF), 9.539392, accuracy: 0.0001)
        XCTAssertEqual(norm(matD), 9.539392, accuracy: 0.00001)
    }

    func testShapedArray() {
        let arrF = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
        let arrD = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(norm(arrF), 9.539392, accuracy: 0.0001)
        XCTAssertEqual(norm(arrD), 9.539392, accuracy: 0.00001)
    }
}
