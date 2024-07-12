/*
 Tests for isApprox() function.
 */

import XCTest
import Numerix

final class ApproxTests: XCTestCase {

    func testVectorApprox() {
        let vec1 = Vector<Double>([1, 2, 3, 4])
        let vec2 = Vector<Float>([1, 2, 3, 4])
        let vec3 = Vector([1.5, 2.09, 3.2, 4.9152])

        XCTAssert(isApprox(vec1, vec1))       // Double vectors defined with integers
        XCTAssert(isApprox(vec2, vec2))       // Float vectors defined with integers
        XCTAssert(isApprox(vec3, vec3))       // Double vectors of mixed precision
        XCTAssertFalse(isApprox(vec1, vec3))  // Double vectors not approximately equal
    }

    func testMatrixApprox() {
        let mat1 = Matrix<Double>([[1, 2, 3, 4],
                                   [5, 6, 7, 8]])

        let mat2 = Matrix<Float>([[1, 2, 3, 4],
                                  [5, 6, 7, 8]])

        let mat3 = Matrix([[1.1, 2.9, 0.34, 4.2],
                           [5.1, 6.093, 7, 8.44]])

        XCTAssert(isApprox(mat1, mat1))       // Double matrices defined with integers
        XCTAssert(isApprox(mat2, mat2))       // Float matrices defined with integers
        XCTAssert(isApprox(mat3, mat3))       // Double matrices of mixed precision
        XCTAssertFalse(isApprox(mat1, mat3))  // Double matrices not approximately equal
    }
}
