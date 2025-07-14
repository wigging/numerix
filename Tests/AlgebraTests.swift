/*
Tests for linear algebra.
*/

import Testing
import Numerix

struct AlgebraTests {

    @Test func absoluteSum() {
        let a = Vector([1, 2, 3, 4, 5.0])
        #expect(a.absoluteSum() == 15)

        let b = Vector<Float>([1, 2, 3, 4, 5])
        #expect(b.absoluteSum() == 15)

        let c = Vector([1, 2, 3, 4, 5])
        #expect(c.absoluteSum() == 15)
    }

    @Test func copyVector() {
        let a: Vector<Double> = [1, 2, 3, 4, 5]
        let b: Vector<Double> = [9, 8, 7, 6, 5]
        a.copy(b)
        #expect(a == b)

        let c: Vector<Float> = [1, 2, 3, 4, 5]
        let d: Vector<Float> = [9, 8, 7, 6, 5]
        c.copy(d)
        #expect(c == d)
    }

    @Test func copyMatrix() {
        let a: Matrix<Double> = [[1, 2, 3], [4, 5, 6]]
        let b: Matrix<Double> = [[7, 8, 9], [10, 11, 12]]
        a.copy(b)
        #expect(a == b)

        let c: Matrix<Float> = [[1, 2, 3], [4, 5, 6]]
        let d: Matrix<Float> = [[7, 8, 9], [10, 11, 12]]
        c.copy(d)
        #expect(c == d)
    }

    @Test func cumulativeSum() {
        let a = Vector([1, 2, 3, 4, 5.0])
        #expect(a.cumulativeSum() == [1, 3, 6, 10, 15])

        let b = Vector<Float>([1, 2, 3, 4, 5])
        #expect(b.cumulativeSum() == [1, 3, 6, 10, 15])

        let c = Vector([1, 2, 3, 4, 5])
        #expect(c.cumulativeSum() == [1, 3, 6, 10, 15])
    }

    @Test func determinant() {
        let a: Matrix<Double> = [[1, 2], [3, 4]]
        let detA = a.determinant()
        #expect(detA == -2.0)

        let b: Matrix<Float> = [[1, 12, 3],
                                [4, 5, 6],
                                [7, 8, 9.5]]
        let detB = b.determinant()
        #expect(detB == 38.500015)
    }

    /*
     Need to test singular matrix which would cause precondition failuare but
     Swift Testing does not have this feature yet. See discussion on Swift
     forum https://forums.swift.org/t/exit-tests-death-tests-and-you/71186

    @Test func determinantSingular() {
        let a: Matrix<Float> = [[0, 12, 0],
                                [4, 5, 0],
                                [7, 0, 0]]
        let detA = a.determinant()
    }
    */

    @Test func dotProduct() {
        let a = Vector([1, 2, 3, 4, 5.0])
        let b = Vector([4, 5, 6, 7, 8.0])
        #expect(a.dot(b) == 100)

        let c = Vector<Float>([1, 2, 3, 4, 5])
        let d = Vector<Float>([4, 5, 6, 7, 8])
        #expect(c.dot(d) == 100)

        let e = Vector([1, 2, 3, 4, 5])
        let f = Vector([4, 5, 6, 7, 8])
        #expect(e.dot(f) == 100)
    }

    @Test func inverse() {
        let a = Matrix<Float>([[1, 2], [3, 4]])
        let invA = a.inverse()
        #expect(invA == [[-2, 1], [1.5, -0.5]])

        let b = Matrix<Double>([[1, 2], [3, 4]])
        let invB = b.inverse()
        #expect(invB == [[-2, 1], [1.5, -0.5]])
    }

    @Test func normMatrix() {
        let a = Matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9.0]])
        #expect(a.norm() == 16.881943016134134)

        let b = Matrix<Float>([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
        #expect(b.norm() == 16.881943)

        let c = Matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
        #expect(c.norm() == 16)
    }

    @Test func normVector() {
        let a = Vector([1, 2, 3, 4, 5.0])
        #expect(a.norm() == 7.416198487095663)

        let b = Vector<Float>([1, 2, 3, 4, 5])
        #expect(b.norm() == 7.4161984871)

        let c = Vector([1, 2, 3, 4, 5])
        #expect(c.norm() == 7)
    }

    @Test func transpose() {
        let a = Matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9.0]])
        let b = Matrix([[2, 3, 4, 5], [6, 7, 8, 9.0]])
        #expect(a.transpose() == Matrix([[1, 4, 7], [2, 5, 8], [3, 6, 9.0]]))
        #expect(b.transpose() == Matrix([[2, 6], [3, 7], [4, 8], [5, 9.0]]))

        let c = Matrix<Float>([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
        let d = Matrix<Float>([[2, 3, 4, 5], [6, 7, 8, 9]])
        #expect(c.transpose() == Matrix<Float>([[1, 4, 7], [2, 5, 8], [3, 6, 9]]))
        #expect(d.transpose() == Matrix<Float>([[2, 6], [3, 7], [4, 8], [5, 9]]))

        let e = Matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
        let f = Matrix([[2, 3, 4, 5], [6, 7, 8, 9]])
        #expect(e.transpose() == Matrix([[1, 4, 7], [2, 5, 8], [3, 6, 9]]))
        #expect(f.transpose() == Matrix([[2, 6], [3, 7], [4, 8], [5, 9]]))
    }

    @Test func scaleMatrix() {
        var a = Matrix([[1, 2, 3], [4, 5, 6.0]])
        a.scale(by: 3.0)
        #expect(a == [[3, 6, 9], [12, 15, 18.0]])

        var b = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
        b.scale(by: 3.0)
        #expect(b == [[3, 6, 9], [12, 15, 18.0]])

        var c = Matrix([[1, 2, 3], [4, 5, 6]])
        c.scale(by: 3)
        #expect(c == [[3, 6, 9], [12, 15, 18]])
    }

    @Test func scaleVector() {
        var a = Vector([8, 9, 10, 11.0])
        a.scale(by: 3)
        #expect(a == [24, 27, 30, 33])

        var b = Vector<Float>([8, 9, 10, 11])
        b.scale(by: 3)
        #expect(b == [24, 27, 30, 33])

        var c = Vector([8, 9, 10, 11])
        c.scale(by: 3)
        #expect(c == [24, 27, 30, 33])
    }

    @Test func sum() {
        let a = Vector([1, 2, 3, 4, 5.0])
        #expect(a.sum() == 15)

        let b = Vector<Float>([1, 2, 3, 4, 5])
        #expect(b.sum() == 15)

        let c = Vector([1, 2, 3, 4, 5])
        #expect(c.sum() == 15)
    }

    @Test func swapMatrix() {
        var a = Matrix([[1, 2, 3], [4, 5, 6.0]])
        var b = Matrix([[9, 10, 11], [12, 13, 14.0]])
        swapValues(&a, &b)
        #expect(a == [[9, 10, 11], [12, 13, 14.0]])
        #expect(b == [[1, 2, 3], [4, 5, 6.0]])

        var c = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
        var d = Matrix<Float>([[9, 10, 11], [12, 13, 14]])
        swapValues(&c, &d)
        #expect(c == [[9, 10, 11], [12, 13, 14]])
        #expect(d == [[1, 2, 3], [4, 5, 6]])

        var e = Matrix([[1, 2, 3], [4, 5, 6]])
        var f = Matrix([[9, 10, 11], [12, 13, 14]])
        swapValues(&e, &f)
        #expect(e == [[9, 10, 11], [12, 13, 14]])
        #expect(f == [[1, 2, 3], [4, 5, 6]])
    }

    @Test func swapVector() {
        var a = Vector([8, 9, 10, 11.0])
        var b = Vector([1, 2, 3, 4.0])
        swapValues(&a, &b)
        #expect(a == [1, 2, 3, 4.0])
        #expect(b == [8, 9, 10, 11.0])

        var c = Vector<Float>([8, 9, 10, 11])
        var d = Vector<Float>([1, 2, 3, 4])
        swapValues(&c, &d)
        #expect(c == [1, 2, 3, 4])
        #expect(d == [8, 9, 10, 11])

        var e = Vector([8, 9, 10, 11])
        var f = Vector([1, 2, 3, 4])
        swapValues(&e, &f)
        #expect(e == [1, 2, 3, 4])
        #expect(f == [8, 9, 10, 11])
    }

    @Test func update() {
        var a = Vector([2, 3, 4, 5, 6, 7.0])
        let b = Vector([1, 2, 3, 4, 5, 6.0])
        a.update(with: b)
        #expect(a == [3, 5, 7, 9, 11, 13])

        a.update(with: b, times: 2)
        #expect(a == [5, 9, 13, 17, 21, 25])

        var y = Vector<Float>([2, 3, 4, 5, 6, 7])
        let x = Vector<Float>([1, 2, 3, 4, 5, 6])
        y.update(with: x)
        #expect(y == [3, 5, 7, 9, 11, 13])

        y.update(with: x, times: 2)
        #expect(y == [5, 9, 13, 17, 21, 25])
    }
}
