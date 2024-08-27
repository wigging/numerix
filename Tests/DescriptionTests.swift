/*
 Tests for Vector and Matrix description.
 */

import XCTest
import Numerix

final class DescriptionTests: XCTestCase {

    func testVector() {
        let vector = Vector([3, 5.8, 402.89, 1])
        let desc = """
        4-element Vector<Double>
        ( 3.0  5.8  402.89  1.0 )
        """
        XCTAssertEqual(String(describing: vector), desc)
    }

    func testMatrix() {
        let matrix = Matrix(rows: 2, columns: 3, values: [3, 4, 8, 10, 11, 18.2])
        let descr = """
        2x3 Matrix<Double>
        ⎛  3.0   4.0   8.0 ⎞
        ⎝ 10.0  11.0  18.2 ⎠
        """
        XCTAssertEqual(String(describing: matrix), descr)
    }

    func testShapedArray2D() {
        let shape = [3, 2]
        let nums = Array(1...shape.reduce(1, *)).map { Float($0) }
        let arr = ShapedArray<Float>(nums, shape: shape)

        let descr = """
        3x2 ShapedArray<Float>
        ⎛ 1.0  2.0 ⎞
        ⎜ 3.0  4.0 ⎟
        ⎝ 5.0  6.0 ⎠
        """
        XCTAssertEqual(String(describing: arr), descr)
    }

    func testShapedArray3D() {
        let shape = [2, 3, 5]
        let nums = Array(1...shape.reduce(1, *)).map { Float($0) }
        let arr = ShapedArray<Float>(nums, shape: shape)

        let descr = """
        2x3x5 ShapedArray<Float>
        ⎛ ⎛  1.0   2.0   3.0   4.0   5.0 ⎞ ⎞
        ⎜ ⎜  6.0   7.0   8.0   9.0  10.0 ⎟ ⎟
        ⎜ ⎝ 11.0  12.0  13.0  14.0  15.0 ⎠ ⎟
        ⎜                                  ⎟
        ⎜ ⎛ 16.0  17.0  18.0  19.0  20.0 ⎞ ⎟
        ⎜ ⎜ 21.0  22.0  23.0  24.0  25.0 ⎟ ⎟
        ⎝ ⎝ 26.0  27.0  28.0  29.0  30.0 ⎠ ⎠
        """
        XCTAssertEqual(String(describing: arr), descr)
    }
}
