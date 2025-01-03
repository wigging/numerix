/*
 Tests for trigonometry functions using Vector and Matrix structs.
 */

import Testing
@testable import Numerix

struct TrigonometryTests {

    @Test func vectorTrigonometry() {
        let a = Vector<Float>([1, 2, 3, 4])
        #expect(sin(a).isApproximatelyEqual(to: [0.841471, 0.909297, 0.14112, -0.756802]))
        #expect(cos(a).isApproximatelyEqual(to: [0.540302, -0.416147, -0.989992, -0.653644]))
        #expect(tan(a).isApproximatelyEqual(to: [1.55741, -2.18504, -0.142547, 1.15782], relativeTolerance: 1e-4))

        let b = Vector([1, 2, 3, 4.0])
        #expect(sin(b).isApproximatelyEqual(to: [0.841471, 0.909297, 0.14112, -0.756802], relativeTolerance: 1e-4))
        #expect(cos(b).isApproximatelyEqual(to: [0.540302, -0.416147, -0.989992, -0.6536], relativeTolerance: 1e-4))
        #expect(tan(b).isApproximatelyEqual(to: [1.55741, -2.18504, -0.142547, 1.15782], relativeTolerance: 1e-4))
    }

    @Test func matrixTrigonometry() {
        let a = Matrix<Float>([[1, 2], [3, 4]])
        #expect(sin(a).isApproximatelyEqual(to: [[0.841471, 0.909297], [0.14112, -0.756802]]))
        #expect(cos(a).isApproximatelyEqual(to: [[0.540302, -0.416147], [-0.989992, -0.653644]]))
        #expect(tan(a).isApproximatelyEqual(to: [[1.55741, -2.18504], [-0.142547, 1.15782]], relativeTolerance: 1e-4))

        let b = Matrix([[1, 2], [3, 4.0]])
        #expect(sin(b).isApproximatelyEqual(to: [[0.841471, 0.909297], [0.14112, -0.756802]], relativeTolerance: 1e-4))
        #expect(cos(b).isApproximatelyEqual(to: [[0.540302, -0.416147], [-0.989992, -0.6536]], relativeTolerance: 1e-4))
        #expect(tan(b).isApproximatelyEqual(to: [[1.55741, -2.18504], [-0.142547, 1.15782]], relativeTolerance: 1e-4))
    }
}
