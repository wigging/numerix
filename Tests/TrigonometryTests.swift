/*
 Tests for trigonometry functions using Vector and Matrix structs.
 */

import Testing
@testable import Numerix

struct TrigonometryTests {

    @Test func vectorTrig() {
        let a = Vector<Float>([1, 2, 3, 4])  // single precision

        #expect(sin(a).isApproximatelyEqual(to: [0.841471, 0.909297, 0.14112, -0.756802]))
        #expect(cos(a).isApproximatelyEqual(to: [0.540302, -0.416147, -0.989992, -0.653644]))
        #expect(tan(a).isApproximatelyEqual(to: [1.55741, -2.18504, -0.142547, 1.15782], relativeTolerance: 1e-4))

        #expect(csc(a).isApproximatelyEqual(to: [1.18839511, 1.09975017, 7.0861674, -1.32134871]))
        #expect(sec(a).isApproximatelyEqual(to: [1.85081572, -2.40299796, -1.01010867, -1.52988566]))
        #expect(cot(a).isApproximatelyEqual(to: [0.64209262, -0.45765755, -7.01525255, 0.86369115]))

        let b = Vector([1, 2, 3, 4.0])  // double precision

        #expect(sin(b).isApproximatelyEqual(to: [0.841471, 0.909297, 0.14112, -0.756802], relativeTolerance: 1e-4))
        #expect(cos(b).isApproximatelyEqual(to: [0.540302, -0.416147, -0.989992, -0.6536], relativeTolerance: 1e-4))
        #expect(tan(b).isApproximatelyEqual(to: [1.55741, -2.18504, -0.142547, 1.15782], relativeTolerance: 1e-4))

        #expect(csc(b).isApproximatelyEqual(to: [1.18839511, 1.09975017, 7.0861674, -1.32134871]))
        #expect(sec(b).isApproximatelyEqual(to: [1.85081572, -2.40299796, -1.01010867, -1.52988566]))
        #expect(cot(b).isApproximatelyEqual(to: [0.64209262, -0.45765755, -7.01525255, 0.86369115]))
    }

    @Test func vectorArcTrig() {
        let a = Vector<Float>([-1, -0.5, 0, 0.5, 1])  // single precision
        #expect(asin(a) == [-1.57079633, -0.52359878, 0.0, 0.52359878, 1.57079633])
        #expect(acos(a) == [3.14159265, 2.0943951, 1.57079633, 1.04719755, 0.0])
        #expect(atan(a) == [-0.78539816, -0.46364761, 0.0, 0.46364761, 0.78539816])

        let b = Vector([-1, -0.5, 0, 0.5, 1])  // double precision
        #expect(asin(b).isApproximatelyEqual(to: [-1.57079633, -0.52359878, 0.0, 0.52359878, 1.57079633]))
        #expect(acos(b).isApproximatelyEqual(to: [3.14159265, 2.0943951, 1.57079633, 1.04719755, 0.0]))
        #expect(atan(b).isApproximatelyEqual(to: [-0.78539816, -0.46364761, 0.0, 0.46364761, 0.78539816]))
    }

    @Test func matrixTrig() {
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
