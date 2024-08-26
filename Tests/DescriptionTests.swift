/*
 Tests for Vector and Matrix description.
 */

import XCTest
import Numerix

final class DescriptionTests: XCTestCase {

    func testVector() {
        let vec = Vector([3, 5.8, 402.89, 1])
        let desc = """
        4-element Vector<Double>
        3.0000 5.8000 402.8900 1.0000
        """
        XCTAssertEqual(String(describing: vec), desc)

        let vec2 = Vector<Float>([3, 5.8, 402.89, 1])
        let desc2 = """
        4-element Vector<Float>
        3.00 5.80 402.89 1.00
        """
        XCTAssertEqual(String(describing: vec2), desc2)
    }

    func testMatrix() {
        let mat = Matrix(rows: 2, columns: 3, values: [3, 4, 8, 10, 11, 18.2])
        let desc = "2x3 Matrix<Double>\n" + " 3.0000   4.0000   8.0000  \n" + "10.0000  11.0000  18.2000  \n"
        XCTAssertEqual(String(describing: mat), desc)

        let mat2 = Matrix<Float>(rows: 2, columns: 3, values: [3, 4, 8, 10, 11, 18.2])
        let desc2 = "2x3 Matrix<Float>\n" + " 3.00   4.00   8.00  \n" + "10.00  11.00  18.20  \n"
        XCTAssertEqual(String(describing: mat2), desc2)
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
        print(arr)

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
