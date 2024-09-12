/*
Tests for Vector and Matrix trigonometric functions.
*/

import XCTest
import Numerix

final class TrigonometricTests: XCTestCase {

    func testVector() {
        let vecF: Vector<Float> = [1, 2, 3, 4, 5]
        XCTAssert(isApprox(sin(vecF), [0.841471, 0.909297, 0.14112, -0.756802, -0.958924], rtol: 1e-4))
        XCTAssert(isApprox(cos(vecF), [0.540302, -0.416147, -0.989992, -0.653644, 0.283662], rtol: 1e-4))
        XCTAssert(isApprox(tan(vecF), [1.55741, -2.18504, -0.142547, 1.15782, -3.38052], rtol: 1e-4))

        let vecD: Vector<Double> = [1, 2, 3, 4, 5]
        XCTAssert(isApprox(sin(vecD), [0.841471, 0.909297, 0.14112, -0.756802, -0.958924], rtol: 1e-4))
        XCTAssert(isApprox(cos(vecD), [0.540302, -0.416147, -0.989992, -0.653644, 0.283662], rtol: 1e-4))
        XCTAssert(isApprox(tan(vecD), [1.55741, -2.18504, -0.142547, 1.15782, -3.38052], rtol: 1e-4))
    }

    func testMatrix() {
        let matF: Matrix<Float> = [[1, 2], [3, 4]]
        XCTAssert(isApprox(sin(matF), [[0.841471, 0.909297], [0.14112, -0.756802]], rtol: 1e-4))
        XCTAssert(isApprox(cos(matF), [[0.540302, -0.416147], [-0.989992, -0.653644]], rtol: 1e-4))
        XCTAssert(isApprox(tan(matF), [[1.55741, -2.18504], [-0.142547, 1.15782]], rtol: 1e-4))

        let matD: Matrix<Double> = [[1, 2], [3, 4]]
        XCTAssert(isApprox(sin(matD), [[0.841471, 0.909297], [0.14112, -0.756802]], rtol: 1e-4))
        XCTAssert(isApprox(cos(matD), [[0.540302, -0.416147], [-0.989992, -0.653644]], rtol: 1e-4))
        XCTAssert(isApprox(tan(matD), [[1.55741, -2.18504], [-0.142547, 1.15782]], rtol: 1e-4))
    }

    func testShapedArray() {
        let arrayF = ShapedArray<Float>([[1, 2], [3, 4]])
        XCTAssert(isApprox(sin(arrayF), [[0.841471, 0.909297], [0.14112, -0.756802]], rtol: 1e-4))
        XCTAssert(isApprox(cos(arrayF), [[0.540302, -0.416147], [-0.989992, -0.653644]], rtol: 1e-4))
        XCTAssert(isApprox(tan(arrayF), [[1.55741, -2.18504], [-0.142547, 1.15782]], rtol: 1e-4))

        let arrayD = ShapedArray<Double>([[1, 2], [3, 4]])
        XCTAssert(isApprox(sin(arrayD), [[0.841471, 0.909297], [0.14112, -0.756802]], rtol: 1e-4))
        XCTAssert(isApprox(cos(arrayD), [[0.540302, -0.416147], [-0.989992, -0.653644]], rtol: 1e-4))
        XCTAssert(isApprox(tan(arrayD), [[1.55741, -2.18504], [-0.142547, 1.15782]], rtol: 1e-4))
    }
}
