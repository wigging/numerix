/*
Tests for padded matrix.
*/

import Testing
import Numerix

struct PaddedTests {

    @Test func paddedMatrixDouble() {
        let a = Matrix<Double>(rows: 2, columns: 2, values: [12, 22, 33, 44])

        let b = a.padded(top: 1, bottom: 2, left: 1, right: 3)
        let bb = Matrix<Double>([[0, 0, 0, 0, 0, 0],
                                 [0, 12, 22, 0, 0, 0],
                                 [0, 33, 44, 0, 0, 0],
                                 [0, 0, 0, 0, 0, 0],
                                 [0, 0, 0, 0, 0, 0]])
        #expect(b == bb)

        let c = a.padded(top: 2, bottom: 1, left: 1, right: 2, with: 4)
        let cc = Matrix<Double>([[4, 4, 4, 4, 4],
                                 [4, 4, 4, 4, 4],
                                 [4, 12, 22, 4, 4],
                                 [4, 33, 44, 4, 4],
                                 [4, 4, 4, 4, 4]])
        #expect(c == cc)

        let d = a.padded(by: 2)
        let dd = Matrix<Double>([[0, 0, 0, 0, 0, 0],
                                 [0, 0, 0, 0, 0, 0],
                                 [0, 0, 12, 22, 0, 0],
                                 [0, 0, 33, 44, 0, 0],
                                 [0, 0, 0, 0, 0, 0],
                                 [0, 0, 0, 0, 0, 0]])
        #expect(d == dd)

        let e = a.padded(by: 1, with: 2.5)
        let ee = Matrix<Double>([[2.5, 2.5, 2.5, 2.5],
                                 [2.5, 12, 22, 2.5],
                                 [2.5, 33, 44, 2.5],
                                 [2.5, 2.5, 2.5, 2.5]])
        #expect(e == ee)

        let f = a.padded()
        let ff = Matrix<Double>([[0, 0, 0, 0],
                                 [0, 12, 22, 0],
                                 [0, 33, 44, 0],
                                 [0, 0, 0, 0]])
        #expect(f == ff)
    }

    @Test func paddedMatrixFloat() {
        let a = Matrix<Float>(rows: 2, columns: 2, values: [12, 22, 33, 44])

        let b = a.padded(top: 1, bottom: 2, left: 1, right: 3)
        let bb = Matrix<Float>([[0, 0, 0, 0, 0, 0],
                                [0, 12, 22, 0, 0, 0],
                                [0, 33, 44, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0]])
        #expect(b == bb)

        let c = a.padded(top: 2, bottom: 1, left: 1, right: 2, with: 4)
        let cc = Matrix<Float>([[4, 4, 4, 4, 4],
                                [4, 4, 4, 4, 4],
                                [4, 12, 22, 4, 4],
                                [4, 33, 44, 4, 4],
                                [4, 4, 4, 4, 4]])
        #expect(c == cc)

        let d = a.padded(by: 2)
        let dd = Matrix<Float>([[0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0],
                                [0, 0, 12, 22, 0, 0],
                                [0, 0, 33, 44, 0, 0],
                                [0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0]])
        #expect(d == dd)

        let e = a.padded(by: 1, with: 2.5)
        let ee = Matrix<Float>([[2.5, 2.5, 2.5, 2.5],
                                [2.5, 12, 22, 2.5],
                                [2.5, 33, 44, 2.5],
                                [2.5, 2.5, 2.5, 2.5]])
        #expect(e == ee)

        let f = a.padded()
        let ff = Matrix<Float>([[0, 0, 0, 0],
                                [0, 12, 22, 0],
                                [0, 33, 44, 0],
                                [0, 0, 0, 0]])
        #expect(f == ff)
    }
}
