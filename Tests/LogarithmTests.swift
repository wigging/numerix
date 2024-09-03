/*
 Tests for logarithm functions.
 */

import XCTest
import Numerix

final class LogarithmTests: XCTestCase {

    let vecF = Vector<Float>([1, 2, 3, 4, 5])
    let vecD = Vector<Double>([1, 2, 3, 4, 5])

    let matF = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
    let matD = Matrix<Double>([[1, 2, 3], [4, 5, 6]])

    let arrF = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
    let arrD = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])

    func testVector() {
        XCTAssert(isApprox(log(vecF), [0, 0.693147, 1.098612, 1.386294, 1.609437], rtol: 1e-4))
        XCTAssert(isApprox(log(vecD), [0, 0.693147, 1.098612, 1.386294, 1.609437], rtol: 1e-4))

        XCTAssert(isApprox(log1p(vecF), [0.693147, 1.098612, 1.386294, 1.609437, 1.791759], rtol: 1e-4))
        XCTAssert(isApprox(log1p(vecD), [0.693147, 1.098612, 1.386294, 1.609437, 1.791759], rtol: 1e-4))

        XCTAssert(isApprox(log10(vecF), [0, 0.30103, 0.47712125, 0.60205999, 0.69897], rtol: 1e-4))
        XCTAssert(isApprox(log10(vecD), [0, 0.30103, 0.47712125, 0.60205999, 0.69897], rtol: 1e-4))

        XCTAssert(isApprox(log2(vecF), [0, 1, 1.5849625, 2, 2.321928], rtol: 1e-4))
        XCTAssert(isApprox(log2(vecD), [0, 1, 1.5849625, 2, 2.321928], rtol: 1e-4))

        XCTAssert(isApprox(logb(vecF), [0, 1, 1, 2, 2], rtol: 1e-4))
        XCTAssert(isApprox(logb(vecD), [0, 1, 1, 2, 2], rtol: 1e-4))
    }

    func testMatrix() {
        XCTAssert(isApprox(log(matF), [[0, 0.693147, 1.098612], [1.386294, 1.609437, 1.791759]], rtol: 1e-4))
        XCTAssert(isApprox(log(matD), [[0, 0.693147, 1.098612], [1.386294, 1.609437, 1.791759]], rtol: 1e-4))

        XCTAssert(isApprox(log1p(matF), [[0.693147, 1.098612, 1.386294], [1.609437, 1.791759, 1.945910]], rtol: 1e-4))
        XCTAssert(isApprox(log1p(matD), [[0.693147, 1.098612, 1.386294], [1.609437, 1.791759, 1.945910]], rtol: 1e-4))

        XCTAssert(isApprox(log10(matF), [[0, 0.30103, 0.47712125], [0.60205999, 0.69897, 0.778151]], rtol: 1e-4))
        XCTAssert(isApprox(log10(matD), [[0, 0.30103, 0.47712125], [0.60205999, 0.69897, 0.778151]], rtol: 1e-4))

        XCTAssert(isApprox(log2(matF), [[0, 1, 1.5849625], [2, 2.321928, 2.584962]], rtol: 1e-4))
        XCTAssert(isApprox(log2(matD), [[0, 1, 1.5849625], [2, 2.321928, 2.584962]], rtol: 1e-4))

        XCTAssert(isApprox(logb(matF), [[0, 1, 1], [2, 2, 2]], rtol: 1e-4))
        XCTAssert(isApprox(logb(matD), [[0, 1, 1], [2, 2, 2]], rtol: 1e-4))
    }

    func testShapedArray() {
        XCTAssert(isApprox(log(arrF), [[0, 0.693147, 1.098612], [1.386294, 1.609437, 1.791759]], rtol: 1e-4))
        XCTAssert(isApprox(log(arrD), [[0, 0.693147, 1.098612], [1.386294, 1.609437, 1.791759]], rtol: 1e-4))

        XCTAssert(isApprox(log1p(arrF), [[0.693147, 1.098612, 1.386294], [1.609437, 1.791759, 1.945910]], rtol: 1e-4))
        XCTAssert(isApprox(log1p(arrD), [[0.693147, 1.098612, 1.386294], [1.609437, 1.791759, 1.945910]], rtol: 1e-4))

        XCTAssert(isApprox(log10(arrF), [[0, 0.30103, 0.47712125], [0.60205999, 0.69897, 0.778151]], rtol: 1e-4))
        XCTAssert(isApprox(log10(arrD), [[0, 0.30103, 0.47712125], [0.60205999, 0.69897, 0.778151]], rtol: 1e-4))

        XCTAssert(isApprox(log2(arrF), [[0, 1, 1.5849625], [2, 2.321928, 2.584962]], rtol: 1e-4))
        XCTAssert(isApprox(log2(arrD), [[0, 1, 1.5849625], [2, 2.321928, 2.584962]], rtol: 1e-4))

        XCTAssert(isApprox(logb(arrF), [[0, 1, 1], [2, 2, 2]], rtol: 1e-4))
        XCTAssert(isApprox(logb(arrD), [[0, 1, 1], [2, 2, 2]], rtol: 1e-4))
    }
}
