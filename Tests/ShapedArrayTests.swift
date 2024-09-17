/*
Tests for the ShapedArray structure.
*/

import XCTest
import Numerix

final class ShapedArrayTests: XCTestCase {

    func testInit1D() {
        let a = ShapedArray<Int>([1, 2, 3, 4, 5])
        XCTAssertEqual(a.shape, [5])
        XCTAssertEqual(a[2], 3)

        let b: ShapedArray<Float> = [1, 2, 3, 4]
        XCTAssertEqual(b.shape, [4])
        XCTAssertEqual(b[1], 2)
    }

    func testInit2D() {
        let a = ShapedArray<Int>([[1, 2, 3, 4],
                                  [5, 6, 7, 8]])
        XCTAssertEqual(a.shape, [2, 4])
        XCTAssertEqual(a[1, 2], 7)
    }

    func testInit3D() {
        let a = [1, 2, 3, 4, 5,
                 6, 7, 8, 9, 10,

                 11, 12, 13, 14, 15,
                 16, 17, 18, 19, 20]
        let b = ShapedArray(shape: [2, 2, 5], array: a)
        XCTAssertEqual(b.shape, [2, 2, 5])
        XCTAssertEqual(b[1, 0, 3], 14)

        let d = ShapedArray<Int>([[[1, 2, 3],
                                   [4, 5, 6]],
                                  [[7, 8, 9],
                                   [3, 4, 5]]])
        XCTAssertEqual(d.shape, [2, 2, 3])
    }

    func testInit4D() {
        let a = [1, 2, 3, 4,
                 5, 6, 7, 8,

                 9, 10, 11, 12,
                 13, 14, 15, 16,

                 17, 18, 19, 20,
                 21, 22, 23, 24,

                 25, 26, 27, 28,
                 29, 30, 31, 32,

                 33, 34, 35, 36,
                 37, 38, 39, 40,

                 41, 42, 43, 44,
                 45, 46, 47, 48]
        let b = ShapedArray(shape: [2, 3, 2, 4], array: a)
        XCTAssertEqual(b.shape, [2, 3, 2, 4])
        XCTAssertEqual(b[1, 0, 1, 3], 32)
    }

    func testEquatable() {
        let arr1 = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
        let arr2 = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
        XCTAssert(arr1 == arr2)

        let arr3 = ShapedArray<Double>([[1, 2, 3], [8, 9, 10]])
        XCTAssert(arr1 != arr3)
    }
}
