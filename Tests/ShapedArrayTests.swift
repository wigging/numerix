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
}
