/*
 Tests for Vector and Matrix addition.
 */

import XCTest
import Numerix

final class AdditionTests: XCTestCase {

    func testScalarVector() {
        let vecF = Vector<Float>([1, 2, 3, 4])
        XCTAssertEqual(2.0 + vecF, [3, 4, 5, 6])

        let vecD = Vector<Double>([1, 2, 3, 4])
        XCTAssertEqual(2.0 + vecD, [3, 4, 5, 6])
    }

    func testVectorScalar() {
        let vecF = Vector<Float>([1, 2, 3, 4])
        XCTAssertEqual(vecF + 2.0, [3, 4, 5, 6])

        let vecD = Vector<Double>([1, 2, 3, 4])
        XCTAssertEqual(vecD + 2.0, [3, 4, 5, 6])

        var vecFF = Vector<Float>([1, 2, 3, 4])
        vecFF += 2.0
        XCTAssertEqual(vecFF, [3, 4, 5, 6])

        var vecDD = Vector<Float>([1, 2, 3, 4])
        vecDD += 2.0
        XCTAssertEqual(vecDD, [3, 4, 5, 6])
    }

    func testVectorVector() {
        let vecAint32 = Vector<Int32>([1, 2, 3, 4])
        let vecBint32 = Vector<Int32>([4, 5, 6, 7])
        XCTAssertEqual(vecAint32 + vecBint32, [5, 7, 9, 11])

        let vecF1 = Vector<Float>([5, 4, 3, 2])
        let vecF2 = Vector<Float>([6, 5, 4, 3])
        XCTAssertEqual(vecF1 + vecF2, [11, 9, 7, 5])

        let vecD1 = Vector<Double>([5, 4, 3, 2])
        let vecD2 = Vector<Double>([6, 5, 4, 3])
        XCTAssertEqual(vecD1 + vecD2, [11, 9, 7, 5])

        var vecI32 = Vector<Int32>([1, 2, 3, 4])
        vecI32 += [5, 6, 7, 8]
        XCTAssertEqual(vecI32, [6, 8, 10, 12])

        var vecFF = Vector<Float>([5, 4, 3, 2])
        vecFF += Vector<Float>([6, 5, 4, 3])
        XCTAssertEqual(vecFF, [11, 9, 7, 5])

        var vecDD = Vector<Double>([5, 4, 3, 2])
        vecDD += Vector<Double>([6, 5, 4, 3])
        XCTAssertEqual(vecDD, [11, 9, 7, 5])
    }

    func testScalarMatrix() {
        let matF = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(2.0 + matF, ShapedArray<Float>([[3, 4, 5], [6, 7, 8]]))

        let matD = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(2.0 + matD, ShapedArray<Double>([[3, 4, 5], [6, 7, 8]]))
    }

    func testMatrixScalar() {
        let matF = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(matF + 2.0, ShapedArray<Float>([[3, 4, 5], [6, 7, 8]]))

        let matD = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(matD + 2.0, ShapedArray<Double>([[3, 4, 5], [6, 7, 8]]))

        var matFF = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
        matFF += 2.0
        XCTAssertEqual(matFF, ShapedArray<Float>([[3, 4, 5], [6, 7, 8]]))

        var matDD = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
        matDD += 2.0
        XCTAssertEqual(matDD, ShapedArray<Double>([[3, 4, 5], [6, 7, 8]]))
    }

    func testMatrixMatrix() {
        let matF1 = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
        let matF2 = ShapedArray<Float>([[7, 8, 9], [2, 3, 4]])
        XCTAssertEqual(matF1 + matF2, ShapedArray<Float>([[8, 10, 12], [6, 8, 10]]))

        let matD1 = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
        let matD2 = ShapedArray<Double>([[7, 8, 9], [2, 3, 4]])
        XCTAssertEqual(matD1 + matD2, ShapedArray<Double>([[8, 10, 12], [6, 8, 10]]))

        var matFF = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
        matFF += ShapedArray<Float>([[7, 8, 9], [2, 3, 4]])
        XCTAssertEqual(matFF, ShapedArray<Float>([[8, 10, 12], [6, 8, 10]]))

        var matDD = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
        matDD += ShapedArray<Double>([[7, 8, 9], [2, 3, 4]])
        XCTAssertEqual(matDD, ShapedArray<Double>([[8, 10, 12], [6, 8, 10]]))
    }

    func testScalarShapedArray() {
        let arrF = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(2.0 + arrF, ShapedArray<Float>([[3, 4, 5], [6, 7, 8]]))

        let arrD = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(2.0 + arrD, ShapedArray<Double>([[3, 4, 5], [6, 7, 8]]))
    }

    func testShapedArrayScalar() {
        let arrF = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(arrF + 2.0, ShapedArray<Float>([[3, 4, 5], [6, 7, 8]]))

        let arrD = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(arrD + 2.0, ShapedArray<Double>([[3, 4, 5], [6, 7, 8]]))

        var arrFF = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
        arrFF += 2.0
        XCTAssertEqual(arrFF, ShapedArray<Float>([[3, 4, 5], [6, 7, 8]]))

        var arrDD = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
        arrDD += 2.0
        XCTAssertEqual(arrDD, ShapedArray<Double>([[3, 4, 5], [6, 7, 8]]))
    }

    func testShapedArrayShapedArray() {
        let arrF1 = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
        let arrF2 = ShapedArray<Float>([[7, 8, 9], [2, 3, 4]])
        XCTAssertEqual(arrF1 + arrF2, ShapedArray<Float>([[8, 10, 12], [6, 8, 10]]))

        let arrD1 = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
        let arrD2 = ShapedArray<Double>([[7, 8, 9], [2, 3, 4]])
        XCTAssertEqual(arrD1 + arrD2, ShapedArray<Double>([[8, 10, 12], [6, 8, 10]]))

        var arrFF = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
        arrFF += ShapedArray<Float>([[7, 8, 9], [2, 3, 4]])
        XCTAssertEqual(arrFF, ShapedArray<Float>([[8, 10, 12], [6, 8, 10]]))

        var arrDD = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
        arrDD += ShapedArray<Double>([[7, 8, 9], [2, 3, 4]])
        XCTAssertEqual(arrDD, ShapedArray<Double>([[8, 10, 12], [6, 8, 10]]))
    }
}
