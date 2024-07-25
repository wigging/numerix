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
        let matF = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(2.0 + matF, Matrix<Float>([[3, 4, 5], [6, 7, 8]]))

        let matD = Matrix<Double>([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(2.0 + matD, Matrix<Double>([[3, 4, 5], [6, 7, 8]]))
    }

    func testMatrixScalar() {
        let matF = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(matF + 2.0, Matrix<Float>([[3, 4, 5], [6, 7, 8]]))

        let matD = Matrix<Double>([[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(matD + 2.0, Matrix<Double>([[3, 4, 5], [6, 7, 8]]))

        var matFF = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
        matFF += 2.0
        XCTAssertEqual(matFF, Matrix<Float>([[3, 4, 5], [6, 7, 8]]))

        var matDD = Matrix<Double>([[1, 2, 3], [4, 5, 6]])
        matDD += 2.0
        XCTAssertEqual(matDD, Matrix<Double>([[3, 4, 5], [6, 7, 8]]))
    }

    func testMatrixMatrix() {
        let matF1 = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
        let matF2 = Matrix<Float>([[7, 8, 9], [2, 3, 4]])
        XCTAssertEqual(matF1 + matF2, Matrix<Float>([[8, 10, 12], [6, 8, 10]]))

        let matD1 = Matrix<Double>([[1, 2, 3], [4, 5, 6]])
        let matD2 = Matrix<Double>([[7, 8, 9], [2, 3, 4]])
        XCTAssertEqual(matD1 + matD2, Matrix<Double>([[8, 10, 12], [6, 8, 10]]))

        var matFF = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
        matFF += Matrix<Float>([[7, 8, 9], [2, 3, 4]])
        XCTAssertEqual(matFF, Matrix<Float>([[8, 10, 12], [6, 8, 10]]))

        var matDD = Matrix<Double>([[1, 2, 3], [4, 5, 6]])
        matDD += Matrix<Double>([[7, 8, 9], [2, 3, 4]])
        XCTAssertEqual(matDD, Matrix<Double>([[8, 10, 12], [6, 8, 10]]))
    }
}
