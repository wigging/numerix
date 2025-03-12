/*
Tests for the ShapedArray structure.
*/

import Testing
@testable import Numerix

struct ShapedArrayTests {

    @Test func initialize1D() {
        let a = ShapedArray<Int>([1, 2, 3, 4, 5])
        #expect(a.shape == [5])
        #expect(a[2] == 3)

        let b: ShapedArray<Float> = [1, 2, 3, 4]
        #expect(b.shape == [4])
        #expect(b[1] == 2)
    }

    @Test func initialize2D() {
        let a = ShapedArray<Int>([[1, 2, 3, 4],
                                  [5, 6, 7, 8]])
        #expect(a.shape == [2, 4])
        #expect(a[1, 2] == 7)
    }

    @Test func initialize3D() {
        let a = [1, 2, 3, 4, 5,
                 6, 7, 8, 9, 10,

                 11, 12, 13, 14, 15,
                 16, 17, 18, 19, 20]

        let b = ShapedArray(shape: [2, 2, 5], array: a)

        #expect(b.shape == [2, 2, 5])
        #expect(b[1, 0, 3] == 14)

        let c = ShapedArray<Int>([[[1, 2, 3],
                                   [4, 5, 6]],
                                  [[7, 8, 9],
                                   [3, 4, 5]]])

        #expect(c.shape == [2, 2, 3])
    }

    @Test func initialize4D() {
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

        #expect(b.shape == [2, 3, 2, 4])
        #expect(b[1, 0, 1, 3] == 32)
    }

    @Test func equatable() {
        let a = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
        let b = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
        #expect(a == b)

        let c = ShapedArray<Double>([[1, 2, 3], [8, 9, 10]])
        #expect(a != c)
    }

    @Test func printing() {
        let arrA = ShapedArray<Int>([3, 4, 5, 6, 7])
        #expect(arrA.description == "( 3  4  5  6  7 )")

        let arrB = ShapedArray<Double>([3.1, 4, 5.09, 6, 7])
        #expect(arrB.description == "( 3.1  4.0  5.09  6.0  7.0 )")

        let shapeC = [3, 2]
        let numsC = Array(1...shapeC.reduce(1, *)).map { Float($0) }
        let arrC = ShapedArray<Float>(shape: shapeC, array: numsC)

        let descC = """
        ⎛ 1.0  2.0 ⎞
        ⎜ 3.0  4.0 ⎟
        ⎝ 5.0  6.0 ⎠
        """
        #expect(arrC.description == descC)

        let shapeD = [2, 3, 5]
        let numsD = Array(1...shapeD.reduce(1, *)).map { Double($0) }
        let arrD = ShapedArray<Double>(shape: shapeD, array: numsD)

        let descD = """
        ⎛ ⎛  1.0   2.0   3.0   4.0   5.0 ⎞ ⎞
        ⎜ ⎜  6.0   7.0   8.0   9.0  10.0 ⎟ ⎟
        ⎜ ⎝ 11.0  12.0  13.0  14.0  15.0 ⎠ ⎟
        ⎜                                  ⎟
        ⎜ ⎛ 16.0  17.0  18.0  19.0  20.0 ⎞ ⎟
        ⎜ ⎜ 21.0  22.0  23.0  24.0  25.0 ⎟ ⎟
        ⎝ ⎝ 26.0  27.0  28.0  29.0  30.0 ⎠ ⎠
        """
        #expect(arrD.description == descD)
    }

    @Test func debugPrinting() {
        let shape = [2, 3, 5]
        let nums = Array(1...shape.reduce(1, *)).map { Double($0) }
        let arr = ShapedArray<Double>(shape: shape, array: nums)

        let desc = """
        2x3x5 ShapedArray<Double>
        ⎛ ⎛  1.0   2.0   3.0   4.0   5.0 ⎞ ⎞
        ⎜ ⎜  6.0   7.0   8.0   9.0  10.0 ⎟ ⎟
        ⎜ ⎝ 11.0  12.0  13.0  14.0  15.0 ⎠ ⎟
        ⎜                                  ⎟
        ⎜ ⎛ 16.0  17.0  18.0  19.0  20.0 ⎞ ⎟
        ⎜ ⎜ 21.0  22.0  23.0  24.0  25.0 ⎟ ⎟
        ⎝ ⎝ 26.0  27.0  28.0  29.0  30.0 ⎠ ⎠
        """
        #expect(arr.debugDescription == desc)
    }
}
