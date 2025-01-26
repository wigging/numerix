/*
Tests for the Matrix structure.
*/

import Testing
@testable import Numerix

struct MatrixTests {

    @Test func initialize() {
        let a = Matrix<Double>(rows: 2, columns: 3, values: [3, 4, 8, 10, 11, 18.2])
        let b = Matrix<Float>(rows: 2, columns: 3, fill: 0.0)
        let c = Matrix([[1, 2, 3], [4, 5, 6]])

        #expect(a[0, 0] == 3)
        #expect(b[0, 0] == 0)
        #expect(c[0, 0] == 1)
    }

    @Test func subscripts() {
        // row subscript
        var a: Matrix = [[1, 2, 3],
                         [4, 5, 6],
                         [7, 8, 9]]

        a[row: 2] = [[9, 9, 7]]

        #expect(a[row: 1] == [[4, 5, 6]])
        #expect(a == [[1, 2, 3], [4, 5, 6], [9, 9, 7]])

        // column subscript
        var b: Matrix = [[1, 2, 3],
                         [4, 5, 6],
                         [7, 8, 9]]

        #expect(b[column: 1] == [2, 5, 8])

        b[column: 2] = [9, 9, 7]
        #expect(b == [[1, 2, 9], [4, 5, 9], [7, 8, 7]])
    }

    @Test func arrayLiteral() {
        let a: Matrix = [[1, 2, 3, 4],
                         [5, 6, 7, 8]]
        #expect(a == [[1, 2, 3, 4], [5, 6, 7, 8]])

        let b: Matrix = [[1, 2, 3, 4.7],
                         [5, 16.1, 7, 8],
                         [10, 11, 12, 13]]
        #expect(b == [[1, 2, 3, 4.7], [5, 16.1, 7, 8], [10, 11, 12, 13]])
    }

    @Test func printing() {
        let a = Matrix([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12.5]])
        var outputA = ""
        print(a, terminator: "", to: &outputA)
        #expect(outputA == """
        ⎛ 1.0   2.0   3.0   4.0 ⎞
        ⎜ 5.0   6.0   7.0   8.0 ⎟
        ⎝ 9.0  10.0  11.0  12.5 ⎠
        """)

        let b = Matrix([[2.5, 1, 8.235], [0.45, 23.5, 3]])
        var outputB = ""
        print(b, terminator: "", to: &outputB)
        #expect(outputB == """
        ⎛ 2.5    1.0  8.235 ⎞
        ⎝ 0.45  23.5  3.0   ⎠
        """)
    }

    @Test func debugPrinting() {
        let a = Matrix([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12.5]])
        var outputA = ""
        debugPrint(a, terminator: "", to: &outputA)
        #expect(outputA == """
        3x4 Matrix<Double>
        ⎛ 1.0   2.0   3.0   4.0 ⎞
        ⎜ 5.0   6.0   7.0   8.0 ⎟
        ⎝ 9.0  10.0  11.0  12.5 ⎠
        """)

        let b = Matrix([[2.5, 1, 8.235], [0.45, 23.5, 3]])
        var outputB = ""
        debugPrint(b, terminator: "", to: &outputB)
        #expect(outputB == """
        2x3 Matrix<Double>
        ⎛ 2.5    1.0  8.235 ⎞
        ⎝ 0.45  23.5  3.0   ⎠
        """)
    }

    @Test func approximatelyEqual() {
        let a = Matrix<Float>([[1, 2, 3, 4], [5, 6, 7, 8.123]])
        let b = Matrix<Float>([[1, 2, 3, 4], [5, 6, 7, 8.1234567891011]])
        #expect(!a.isApproximatelyEqual(to: b))
        #expect(a.isApproximatelyEqual(to: b, absoluteTolerance: 0.001))

        let c = Matrix([[1, 2, 3, 4], [5, 6, 7, 8.123]])
        let d = Matrix([[1, 2, 3, 4], [5, 6, 7, 8.1234567891011]])
        #expect(!c.isApproximatelyEqual(to: d))
        #expect(c.isApproximatelyEqual(to: d, absoluteTolerance: 0.001))
    }

    @Test func padding() {
        let a: Matrix<Float> = [[1, 2], [3, 4]]
        let b: Matrix<Float> = [[0, 0, 0, 0],
                                [0, 1, 2, 0],
                                [0, 3, 4, 0],
                                [0, 0, 0, 0]]
        #expect(a.pad() == b)

        let c: Matrix<Double> = [[1, 2], [3, 4]]
        let d: Matrix<Double> = [[0, 0, 0, 0],
                                [0, 1, 2, 0],
                                [0, 3, 4, 0],
                                [0, 0, 0, 0]]
        #expect(c.pad(with: 0) == d)

        let e: Matrix = [[1, 2], [3, 4.0]]
        let f: Matrix = [[9, 9, 9, 9],
                         [9, 1, 2, 9],
                         [9, 3, 4, 9],
                         [9, 9, 9, 9.0]]
        #expect(e.pad(with: 9) == f)
    }

    @Test func copying() {
        // Modifying matrix B also modifies matrix A because matrix B is
        // a reference to matrix A
        let a: Matrix = [[0, 0, 0], [0, 0, 0]]
        var b = a
        b[0, 0] = 99
        b[0, 1] = 22
        #expect(a == [[99, 22, 0], [0, 0, 0]])

        // Modifying matrix D does not modify matrix C because matrix D is
        // a complete copy of matrix C
        let c: Matrix = [[0, 0, 0], [0, 0, 0]]
        var d = c.copy()
        d[0, 0] = 99
        d[0, 1] = 22
        #expect(c == [[0, 0, 0], [0, 0, 0]])
    }

    @Test func iteration() {
        let mat = Matrix([[1, 2, 3],
                          [4, 5, 6],
                          [7, 8, 9.0]])

        // Iterate over rows
        var counter = 1
        for row in mat {
            if counter == mat.rows {
                #expect(row == [7, 8, 9.0])
            }
            counter += 1
        }

        // Iterate over columns
        counter = 1
        for col in mat.transpose() {
            if counter == mat.columns {
                #expect(col == [3, 6, 9.0])
            }
            counter += 1
        }
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

    @Test func inverse() {
        let a = Matrix<Float>([[1, 2], [3, 4]])
        let invA = a.inverse()
        #expect(invA == [[-2, 1], [1.5, -0.5]])

        let b = Matrix<Double>([[1, 2], [3, 4]])
        let invB = b.inverse()
        #expect(invB == [[-2, 1], [1.5, -0.5]])
    }

    @Test func exponential() {
        let a = Matrix<Float>([[1, 2], [3, 4]])
        let b = Matrix<Double>([[1, 2], [3, 4]])

        #expect(a.exp() == [[2.71828183, 7.3890561], [20.08553692, 54.59815003]])
        #expect(b.exp().isApproximatelyEqual(to: [[2.71828, 7.38905], [20.08553, 54.59815]], relativeTolerance: 1e-4))

        #expect(a.exp2() == [[2, 4], [8, 16]])
        #expect(b.exp2() == [[2, 4], [8, 16]])

        #expect(a.expm1().isApproximatelyEqual(to: [[1.71828, 6.38905], [19.08553, 53.59815]], relativeTolerance: 1e-4))
        #expect(b.expm1().isApproximatelyEqual(to: [[1.71828, 6.38905], [19.08553, 53.59815]], relativeTolerance: 1e-4))
    }

    @Test func power() {
        let a = Matrix<Float>([[1, 2], [3, 4]])
        let b = Matrix<Double>([[1, 2], [3, 4]])

        #expect(a.power(2) == [[1, 4], [9, 16]])
        #expect(b.power(2) == [[1, 4], [9, 16]])

        #expect(a.power([2, 3, 4, 5]).isApproximatelyEqual(to: [[1, 8], [81, 1024]], relativeTolerance: 1e-4))
        #expect(b.power([2, 3, 4, 5]) == [[1, 8], [81, 1024]])
    }

    @Test func logarithm() {
        let a = Matrix<Float>([[1, 2], [3, 4]])
        let b = Matrix<Double>([[1, 2], [3, 4]])

        #expect(a.log().isApproximatelyEqual(to: [[0, 0.6931], [1.0986, 1.3862]], relativeTolerance: 1e-4))
        #expect(b.log().isApproximatelyEqual(to: [[0, 0.693147], [1.098612, 1.386294]], relativeTolerance: 1e-6))

        #expect(a.log1p().isApproximatelyEqual(to: [[0.6931, 1.0986], [1.3862, 1.6094]], relativeTolerance: 1e-4))
        #expect(b.log1p().isApproximatelyEqual(to: [[0.693147, 1.098612], [1.386294, 1.609437]],
                                               relativeTolerance: 1e-6))

        #expect(a.log10().isApproximatelyEqual(to: [[0.0, 0.30103], [0.47712125, 0.60205999]]))
        #expect(a.log10().isApproximatelyEqual(to: [[0.0, 0.30103], [0.47712125, 0.60205999]]))

        #expect(b.log2().isApproximatelyEqual(to: [[0.0, 1.0], [1.5849625, 2]], relativeTolerance: 1e-6))
        #expect(b.log2().isApproximatelyEqual(to: [[0.0, 1.0], [1.5849625, 2]], relativeTolerance: 1e-6))

        #expect(b.logb().isApproximatelyEqual(to: [[0, 1], [1, 2]]))
        #expect(b.logb().isApproximatelyEqual(to: [[0, 1], [1, 2]]))
    }

    @Test func integerArithmetic() {
        let k = 5
        let a = Matrix([[1, 2, 3], [4, 5, 6]])
        let b = Matrix([[7, 8, 9], [3, 4, 5]])
        let c = Matrix([[1, 2], [3, 4], [5, 6]])

        // Equality
        #expect(a == a)
        #expect(a != b)

        // Addition
        #expect(k + a == Matrix([[6, 7, 8], [9, 10, 11]]))
        #expect(a + k == Matrix([[6, 7, 8], [9, 10, 11]]))
        #expect(a + b == Matrix([[8, 10, 12], [7, 9, 11]]))

        var d = Matrix([[1, 2, 3], [4, 5, 6]])
        d += b
        #expect(d == Matrix([[8, 10, 12], [7, 9, 11]]))

        // Subtraction
        #expect(k - a == Matrix([[4, 3, 2], [1, 0, -1]]))
        #expect(a - k == Matrix([[-4, -3, -2], [-1, 0, 1]]))
        #expect(a - b == Matrix([[-6, -6, -6], [1, 1, 1]]))

        // Element-wise multiplication
        #expect(k .* a == Matrix([[5, 10, 15], [20, 25, 30]]))
        #expect(a .* k == Matrix([[5, 10, 15], [20, 25, 30]]))
        #expect(a .* b == Matrix([[7, 16, 27], [12, 20, 30]]))

        // Matrix multiplication
        #expect(a * c == Matrix([[22, 28], [49, 64]]))

        // Division
        #expect(k / a == [[5, 2, 1], [1, 1, 0]])
        #expect(a / k == [[0, 0, 0], [0, 1, 1]])
        #expect(a / b == [[0, 0, 0], [1, 1, 1]])

        // Methods
        // #expect(a.dot(b) == 100)
        // #expect(a.sum() == 15)
        // #expect(a.absoluteSum() == 15)
    }

    @Test func floatArithmetic() {
        let k: Float = 5
        let a = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
        let b = Matrix<Float>([[7, 8, 9], [3, 4, 5]])
        let c = Matrix<Float>([[1, 2], [3, 4], [5, 6]])

        // Equality
        #expect(a == a)
        #expect(a != b)

        // Addition
        #expect(k + a == Matrix([[6, 7, 8], [9, 10, 11]]))
        #expect(a + k == Matrix([[6, 7, 8], [9, 10, 11]]))
        #expect(a + b == Matrix([[8, 10, 12], [7, 9, 11]]))

        var d = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
        d += b
        #expect(d == Matrix([[8, 10, 12], [7, 9, 11]]))

        // Subtraction
        #expect(k - a == Matrix([[4, 3, 2], [1, 0, -1]]))
        #expect(a - k == Matrix([[-4, -3, -2], [-1, 0, 1]]))
        #expect(a - b == Matrix([[-6, -6, -6], [1, 1, 1]]))

        // Element-wise multiplication
        #expect(k .* a == Matrix([[5, 10, 15], [20, 25, 30]]))
        #expect(a .* k == Matrix([[5, 10, 15], [20, 25, 30]]))
        #expect(a .* b == Matrix([[7, 16, 27], [12, 20, 30]]))

        // Matrix multiplication
        #expect(a * c == Matrix([[22, 28], [49, 64]]))

        // Division
        #expect((k / a).isApproximatelyEqual(to: [[5, 2.5, 1.66666667], [1.25, 1.0, 0.83333333]]))
        #expect(a / k == [[0.2, 0.4, 0.6], [0.8, 1.0, 1.2]])
        #expect((a / b).isApproximatelyEqual(to: [[0.14285714, 0.25, 0.33333333], [1.33333333, 1.25, 1.2]]))

        // Methods
        // #expect(a.dot(b) == 100)
        // #expect(a.sum() == 15)
        // #expect(a.absoluteSum() == 15)
    }

    @Test func doubleArithmetic() {
        let k = 5.0
        let a = Matrix([[1, 2, 3], [4, 5, 6.0]])
        let b = Matrix([[7, 8, 9], [3, 4, 5.0]])
        let c = Matrix([[1, 2], [3, 4], [5, 6.0]])

        // Equality
        #expect(a == a)
        #expect(a != b)

        // Addition
        #expect(k + a == Matrix([[6, 7, 8], [9, 10, 11]]))
        #expect(a + k == Matrix([[6, 7, 8], [9, 10, 11]]))
        #expect(a + b == Matrix([[8, 10, 12], [7, 9, 11]]))

        var d = Matrix([[1, 2, 3], [4, 5, 6.0]])
        d += b
        #expect(d == Matrix([[8, 10, 12], [7, 9, 11]]))

        // Subtraction
        #expect(k - a == Matrix([[4, 3, 2], [1, 0, -1]]))
        #expect(a - k == Matrix([[-4, -3, -2], [-1, 0, 1]]))
        #expect(a - b == Matrix([[-6, -6, -6], [1, 1, 1]]))

        // Element-wise multiplication
        #expect(k .* a == Matrix([[5, 10, 15], [20, 25, 30]]))
        #expect(a .* k == Matrix([[5, 10, 15], [20, 25, 30]]))
        #expect(a .* b == Matrix([[7, 16, 27], [12, 20, 30]]))

        // Matrix multiplication
        #expect(a * c == Matrix([[22, 28], [49, 64]]))

        // Division
        #expect((k / a).isApproximatelyEqual(to: [[5, 2.5, 1.66666667], [1.25, 1.0, 0.83333333]]))
        #expect((a / k).isApproximatelyEqual(to: [[0.2, 0.4, 0.6], [0.8, 1.0, 1.2]]))
        #expect((a / b).isApproximatelyEqual(to: [[0.14285714, 0.25, 0.33333333], [1.33333333, 1.25, 1.2]]))

        // Methods
        // #expect(a.dot(b) == 100)
        // #expect(a.sum() == 15)
        // #expect(a.absoluteSum() == 15)
    }

    @Test func integerAlgebra() {
        let a = Matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
        let b = Matrix([[2, 3, 4, 5], [6, 7, 8, 9]])

        #expect(a.norm() == 16)
        #expect(a.transpose() == Matrix([[1, 4, 7], [2, 5, 8], [3, 6, 9]]))
        #expect(b.transpose() == Matrix([[2, 6], [3, 7], [4, 8], [5, 9]]))

        var c = Matrix([[1, 2, 3], [4, 5, 6]])
        c.scale(by: 3)
        #expect(c == [[3, 6, 9], [12, 15, 18]])

        var d = Matrix([[1, 2, 3], [4, 5, 6]])
        var e = Matrix([[9, 10, 11], [12, 13, 14]])
        swapValues(&d, &e)
        #expect(d == [[9, 10, 11], [12, 13, 14]])
        #expect(e == [[1, 2, 3], [4, 5, 6]])
    }

    @Test func floatAlgebra() {
        let a = Matrix<Float>([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
        let b = Matrix<Float>([[2, 3, 4, 5], [6, 7, 8, 9]])

        #expect(a.norm() == 16.881943)
        #expect(a.transpose() == Matrix<Float>([[1, 4, 7], [2, 5, 8], [3, 6, 9]]))
        #expect(b.transpose() == Matrix<Float>([[2, 6], [3, 7], [4, 8], [5, 9]]))

        var c = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
        c.scale(by: 3.0)
        #expect(c == [[3, 6, 9], [12, 15, 18.0]])

        var d = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
        var e = Matrix<Float>([[9, 10, 11], [12, 13, 14]])
        swapValues(&d, &e)
        #expect(d == [[9, 10, 11], [12, 13, 14]])
        #expect(e == [[1, 2, 3], [4, 5, 6]])
    }

    @Test func doubleAlgebra() {
        let a = Matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9.0]])
        let b = Matrix([[2, 3, 4, 5], [6, 7, 8, 9.0]])

        #expect(a.norm() == 16.881943016134134)
        #expect(a.transpose() == Matrix([[1, 4, 7], [2, 5, 8], [3, 6, 9.0]]))
        #expect(b.transpose() == Matrix([[2, 6], [3, 7], [4, 8], [5, 9.0]]))

        var c = Matrix([[1, 2, 3], [4, 5, 6.0]])
        c.scale(by: 3.0)
        #expect(c == [[3, 6, 9], [12, 15, 18.0]])

        var d = Matrix([[1, 2, 3], [4, 5, 6.0]])
        var e = Matrix([[9, 10, 11], [12, 13, 14.0]])
        swapValues(&d, &e)
        #expect(d == [[9, 10, 11], [12, 13, 14.0]])
        #expect(e == [[1, 2, 3], [4, 5, 6.0]])
    }
}
