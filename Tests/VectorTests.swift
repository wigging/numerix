/*
 Tests for the Vector structure.
 */

import Testing
@testable import Numerix

struct VectorTests {

    @Test func initialization() {
        let a = Vector([1, 2, 3, 4])
        let b = Vector(like: a)
        let c = Vector<Double>(size: 5)
        let d = Vector(size: 5, fill: 9.2)

        #expect(a == Vector([1, 2, 3, 4]))
        #expect(b == Vector([0, 0, 0, 0]))
        #expect(c == Vector([0, 0, 0, 0, 0.0]))
        #expect(d == Vector([9.2, 9.2, 9.2, 9.2, 9.2]))
    }

    @Test func arrayLiteral() {
        let a: Vector = [1, 2, 3, 4, 5]
        #expect(a == [1, 2, 3, 4, 5])

        let b: Vector = [3, 4.2, 8, 21, 18.94]
        #expect(b == [3, 4.2, 8, 21, 18.94])
    }

    @Test func printing() {
        let a = Vector([4, 5, 8.02, 9, 10])

        var printOutput = ""
        print(a, terminator: "", to: &printOutput)
        #expect(printOutput == "( 4.0  5.0  8.02  9.0  10.0 )")

        var debugOutput = ""
        debugPrint(a, terminator: "", to: &debugOutput)
        #expect(debugOutput == "5-element Vector<Double>\n( 4.0  5.0  8.02  9.0  10.0 )")
    }

    @Test func formatting() {
        let vecA = Vector([4, 5, 8.02, 9, 10])
        let formatA = vecA.formatted()
        #expect(formatA == "( 4.0  5.0  8.02  9.0  10.0 )")

        let vecB = Vector([0.90129, 5, 8.02, 9, 10])
        let formatB = vecB.formatted(specifier: "%.4f")
        #expect(formatB == "( 0.9013  5.0000  8.0200  9.0000  10.0000 )")

        let vecC = Vector([-2, 5, 18, 7, 2215])
        let formatC = vecC.formatted()
        #expect(formatC == "( -2  5  18  7  2215 )")
    }

    @Test func approximatelyEqual() {
        let a = Vector<Float>([5, 6, 7, 8.123])
        let b = Vector<Float>([5, 6, 7, 8.1234567891011])
        #expect(!a.isApproximatelyEqual(to: b))
        #expect(a.isApproximatelyEqual(to: b, absoluteTolerance: 0.001))

        let c = Vector([5, 6, 7, 8.123])
        let d = Vector([5, 6, 7, 8.1234567891011])
        #expect(!c.isApproximatelyEqual(to: d))
        #expect(c.isApproximatelyEqual(to: d, absoluteTolerance: 0.001))
    }

    @Test func exponential() {
        let a = Vector<Float>([1, 2, 3, 4])
        let b = Vector<Double>([1, 2, 3, 4])

        #expect(a.exp() == [2.71828183, 7.3890561, 20.08553692, 54.59815003])
        #expect(b.exp().isApproximatelyEqual(to: [2.71828, 7.38905, 20.08553, 54.59815], relativeTolerance: 1e-4))

        #expect(a.exp2() == [2, 4, 8, 16])
        #expect(b.exp2() == [2, 4, 8, 16])

        #expect(a.expm1().isApproximatelyEqual(to: [1.71828, 6.38905, 19.08553, 53.59815], relativeTolerance: 1e-4))
        #expect(b.expm1().isApproximatelyEqual(to: [1.71828, 6.38905, 19.08553, 53.59815], relativeTolerance: 1e-4))
    }

    @Test func power() {
        let a = Vector<Float>([1, 2, 3, 4])
        let b = Vector<Double>([1, 2, 3, 4])

        #expect(a.power(2) == [1, 4, 9, 16])
        #expect(b.power(2) == [1, 4, 9, 16])

        #expect(a.power([2, 3, 4, 5]).isApproximatelyEqual(to: [1, 8, 81, 1024], relativeTolerance: 1e-4))
        #expect(b.power([2, 3, 4, 5]) == [1, 8, 81, 1024])
    }

    @Test func logarithm() {
        let a = Vector<Float>([1, 2, 3, 4, 5])
        let b = Vector<Double>([1, 2, 3, 4, 5])

        #expect(a.log().isApproximatelyEqual(to: [0, 0.6931, 1.0986, 1.3862, 1.6094], relativeTolerance: 1e-4))
        #expect(b.log().isApproximatelyEqual(to: [0, 0.693147, 1.098612, 1.386294, 1.609437], relativeTolerance: 1e-6))

        #expect(a.log1p().isApproximatelyEqual(to: [0.6931, 1.0986, 1.3862, 1.6094, 1.7917], relativeTolerance: 1e-4))
        #expect(b.log1p().isApproximatelyEqual(to: [0.693147, 1.098612, 1.386294, 1.609437, 1.791759],
                                               relativeTolerance: 1e-6))

        #expect(a.log10().isApproximatelyEqual(to: [0.0, 0.30103, 0.47712125, 0.60205999, 0.69897]))
        #expect(a.log10().isApproximatelyEqual(to: [0.0, 0.30103, 0.47712125, 0.60205999, 0.69897]))

        #expect(b.log2().isApproximatelyEqual(to: [0.0, 1.0, 1.5849625, 2, 2.321928], relativeTolerance: 1e-6))
        #expect(b.log2().isApproximatelyEqual(to: [0.0, 1.0, 1.5849625, 2, 2.321928], relativeTolerance: 1e-6))

        #expect(b.logb().isApproximatelyEqual(to: [0, 1, 1, 2, 2]))
        #expect(b.logb().isApproximatelyEqual(to: [0, 1, 1, 2, 2]))
    }

    @Test func integerArithmetic() {
        let k = 5
        let a = Vector([1, 2, 3, 4, 5])
        let b = Vector([4, 5, 6, 7, 8])

        // Equality
        #expect(a == a)
        #expect(a != b)

        // Addition
        #expect(k + a == Vector([6, 7, 8, 9, 10]))
        #expect(a + k == Vector([6, 7, 8, 9, 10]))
        #expect(a + b == Vector([5, 7, 9, 11, 13]))

        var c = Vector([1, 2, 3, 4, 5])
        c += Vector([1, 2, 3, 4, 5])
        #expect(c == Vector([2, 4, 6, 8, 10]))

        // Subtraction
        #expect(k - a == Vector([4, 3, 2, 1, 0]))
        #expect(a - k == Vector([-4, -3, -2, -1, 0]))
        #expect(a - b == Vector([-3, -3, -3, -3, -3]))

        // Multiplication
        #expect(k * a == Vector([5, 10, 15, 20, 25]))
        #expect(a * k == Vector([5, 10, 15, 20, 25]))
        #expect(a * b == Vector([4, 10, 18, 28, 40]))

        // Division
        #expect(k / a == [5, 2, 1, 1, 1])
        #expect(a / k == [0, 0, 0, 0, 1])
        #expect(a / b == [0, 0, 0, 0, 0])
    }

    @Test func floatArithmetic() {
        let k: Float = 5
        let a = Vector<Float>([1, 2, 3, 4, 5])
        let b = Vector<Float>([4, 5, 6, 7, 8])

        // Equality
        #expect(a == a)
        #expect(a != b)

        // Addition
        #expect(k + a == Vector([6, 7, 8, 9, 10]))
        #expect(a + k == Vector([6, 7, 8, 9, 10]))
        #expect(a + b == Vector([5, 7, 9, 11, 13]))

        var c = Vector([1, 2, 3, 4, 5])
        c += Vector([1, 2, 3, 4, 5])
        #expect(c == Vector([2, 4, 6, 8, 10]))

        // Subtraction
        #expect(k - a == Vector([4, 3, 2, 1, 0]))
        #expect(a - k == Vector([-4, -3, -2, -1, 0]))
        #expect(a - b == Vector([-3, -3, -3, -3, -3]))

        // Multiplication
        #expect(k * a == Vector([5, 10, 15, 20, 25]))
        #expect(a * k == Vector([5, 10, 15, 20, 25]))
        #expect(a * b == Vector([4, 10, 18, 28, 40]))

        // Division
        #expect(k / a == [5, 2.5, 1.66666667, 1.25, 1])
        #expect(a / k == [0.2, 0.4, 0.6, 0.8, 1])
        #expect(a / b == [0.25, 0.4, 0.5, 0.57142857, 0.625])
    }

    @Test func doubleArithmetic() {
        let k = 5.0
        let a = Vector([1, 2, 3, 4, 5.0])
        let b = Vector([4, 5, 6, 7, 8.0])

        // Equality
        #expect(a == a)
        #expect(a != b)

        // Addition
        #expect(k + a == Vector([6, 7, 8, 9, 10]))
        #expect(a + k == Vector([6, 7, 8, 9, 10]))
        #expect(a + b == Vector([5, 7, 9, 11, 13]))

        var c = Vector([1, 2, 3, 4, 5.0])
        c += Vector([1, 2, 3, 4, 5.0])
        #expect(c == Vector([2, 4, 6, 8, 10]))

        // Subtraction
        #expect(k - a == Vector([4, 3, 2, 1, 0]))
        #expect(a - k == Vector([-4, -3, -2, -1, 0]))
        #expect(a - b == Vector([-3, -3, -3, -3, -3]))

        // Multiplication
        #expect(k * a == Vector([5, 10, 15, 20, 25]))
        #expect(a * k == Vector([5, 10, 15, 20, 25]))
        #expect(a * b == Vector([4, 10, 18, 28, 40]))

        // Division
        #expect((k / a).isApproximatelyEqual(to: [5, 2.5, 1.66666667, 1.25, 1]))
        #expect(a / k == [0.2, 0.4, 0.6, 0.8, 1])
        #expect((a / b).isApproximatelyEqual(to: [0.25, 0.4, 0.5, 0.57142857, 0.625]))
    }

    @Test func integerAlgebra() {
        let a = Vector([1, 2, 3, 4, 5])
        let b = Vector([4, 5, 6, 7, 8])
        #expect(a.dot(b) == 100)
        #expect(a.norm() == 7)
        #expect(a.sum() == 15)
        #expect(a.absoluteSum() == 15)
        #expect(a.cumulativeSum() == [1, 3, 6, 10, 15])

        var c = Vector([8, 9, 10, 11])
        c.scale(by: 3)
        #expect(c == [24, 27, 30, 33])

        var d = Vector([8, 9, 10, 11])
        var e = Vector([1, 2, 3, 4])
        swapValues(&d, &e)
        #expect(d == [1, 2, 3, 4])
        #expect(e == [8, 9, 10, 11])
    }

    @Test func floatAlgebra() {
        let a = Vector<Float>([1, 2, 3, 4, 5])
        let b = Vector<Float>([4, 5, 6, 7, 8])

        #expect(a.dot(b) == 100)
        #expect(a.norm() == 7.4161984871)
        #expect(a.sum() == 15)
        #expect(a.absoluteSum() == 15)
        #expect(a.cumulativeSum() == [1, 3, 6, 10, 15])

        var c = Vector<Float>([8, 9, 10, 11])
        c.scale(by: 3)
        #expect(c == [24, 27, 30, 33])

        var d = Vector<Float>([8, 9, 10, 11])
        var e = Vector<Float>([1, 2, 3, 4])
        swapValues(&d, &e)
        #expect(d == [1, 2, 3, 4])
        #expect(e == [8, 9, 10, 11])

        var y = Vector<Float>([2, 3, 4, 5, 6, 7])
        let x = Vector<Float>([1, 2, 3, 4, 5, 6])
        y.update(with: x)
        #expect(y == [3, 5, 7, 9, 11, 13])

        y.update(with: x, times: 2)
        #expect(y == [5, 9, 13, 17, 21, 25])
    }

    @Test func doubleAlgebra() {
        let a = Vector([1, 2, 3, 4, 5.0])
        let b = Vector([4, 5, 6, 7, 8.0])

        #expect(a.dot(b) == 100)
        #expect(a.norm() == 7.416198487095663)
        #expect(a.sum() == 15)
        #expect(a.absoluteSum() == 15)
        #expect(a.cumulativeSum() == [1, 3, 6, 10, 15])

        var c = Vector([8, 9, 10, 11.0])
        c.scale(by: 3)
        #expect(c == [24, 27, 30, 33])

        var d = Vector([8, 9, 10, 11.0])
        var e = Vector([1, 2, 3, 4.0])
        swapValues(&d, &e)
        #expect(d == [1, 2, 3, 4.0])
        #expect(e == [8, 9, 10, 11.0])
    }
}
