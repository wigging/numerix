/*
 Tests for vector and matrix addition.
*/

import XCTest
import Numerix

final class AdditionTests: XCTestCase {

    func testVectorAddition() {
        let vec1 = Vector<Double>([1, 2, 3, 4])
        let vec2 = Vector<Double>([5, 2, 3, 1])
        let vec3 = Vector<Float>([5, 4, 3, 2])
        let vec4 = Vector<Float>([6, 5, 4, 3])

        XCTAssert(isApprox(vec1 + vec2, Vector([6, 4, 6, 5])))
        XCTAssert(isApprox(vec3 + vec4, Vector<Float>([11, 9, 7, 5])))
        XCTAssert(isApprox(vec1 + 2.0, Vector([3, 4, 5, 6])))
        XCTAssert(isApprox(2.0 + vec1, Vector([3, 4, 5, 6])))
        XCTAssert(isApprox(vec3 + 2.0, Vector<Float>([7, 6, 5, 4])))
        XCTAssert(isApprox(2.0 + vec3, Vector<Float>([7, 6, 5, 4])))
    }

    func testMatrixAddition() {
        let mat1 = Matrix<Double>([[1, 2, 3], [4, 5, 6]])
        let mat2 = Matrix<Double>([[2, 2, 3], [8, 5, 6]])
        let mat3 = Matrix<Float>([[1, 2, 3], [9, 5, 6]])
        let mat4 = Matrix<Float>([[4, 2, 3], [4, 5, 6]])

        let res1 = Matrix<Double>([[3, 4, 6], [12, 10, 12]])
        let res2 = Matrix<Float>([[5, 4, 6], [13, 10, 12]])

        XCTAssert(isApprox(mat1 + mat2, res1))
        XCTAssert(isApprox(mat3 + mat4, res2))
        XCTAssert(isApprox(mat1 + 2.0, Matrix<Double>([[3, 4, 5], [6, 7, 8]])))
        XCTAssert(isApprox(2.0 + mat1, Matrix<Double>([[3, 4, 5], [6, 7, 8]])))
        XCTAssert(isApprox(mat3 + 2.0, Matrix<Float>([[3, 4, 5], [11, 7, 8]])))
        XCTAssert(isApprox(2.0 + mat3, Matrix<Float>([[3, 4, 5], [11, 7, 8]])))
    }
}
