/*
Tests for matrix pad.
*/

import Testing
import Numerix

struct PaddedTests {

    @Test func padMatrixDouble() {
        let a = Matrix<Double>(rows: 2, columns: 2, values: [12, 22, 33, 44])

        let b = a.pad(top: 1, bottom: 2, left: 1, right: 3)
        let bb = Matrix<Double>([[0, 0, 0, 0, 0, 0],
                                 [0, 12, 22, 0, 0, 0],
                                 [0, 33, 44, 0, 0, 0],
                                 [0, 0, 0, 0, 0, 0],
                                 [0, 0, 0, 0, 0, 0]])
        #expect(b == bb)

        let c = a.pad(top: 2, bottom: 1, left: 1, right: 2, with: 4)
        let cc = Matrix<Double>([[4, 4, 4, 4, 4],
                                 [4, 4, 4, 4, 4],
                                 [4, 12, 22, 4, 4],
                                 [4, 33, 44, 4, 4],
                                 [4, 4, 4, 4, 4]])
        #expect(c == cc)

        let d = a.pad(by: 2)
        let dd = Matrix<Double>([[0, 0, 0, 0, 0, 0],
                                 [0, 0, 0, 0, 0, 0],
                                 [0, 0, 12, 22, 0, 0],
                                 [0, 0, 33, 44, 0, 0],
                                 [0, 0, 0, 0, 0, 0],
                                 [0, 0, 0, 0, 0, 0]])
        #expect(d == dd)

        let e = a.pad(by: 1, with: 2.5)
        let ee = Matrix<Double>([[2.5, 2.5, 2.5, 2.5],
                                 [2.5, 12, 22, 2.5],
                                 [2.5, 33, 44, 2.5],
                                 [2.5, 2.5, 2.5, 2.5]])
        #expect(e == ee)

        let f = a.pad()
        let ff = Matrix<Double>([[0, 0, 0, 0],
                                 [0, 12, 22, 0],
                                 [0, 33, 44, 0],
                                 [0, 0, 0, 0]])
        #expect(f == ff)
    }

    @Test func padMatrixFloat() {
        let a = Matrix<Float>(rows: 2, columns: 2, values: [12, 22, 33, 44])

        let b = a.pad(top: 1, bottom: 2, left: 1, right: 3)
        let bb = Matrix<Float>([[0, 0, 0, 0, 0, 0],
                                [0, 12, 22, 0, 0, 0],
                                [0, 33, 44, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0]])
        #expect(b == bb)

        let c = a.pad(top: 2, bottom: 1, left: 1, right: 2, with: 4)
        let cc = Matrix<Float>([[4, 4, 4, 4, 4],
                                [4, 4, 4, 4, 4],
                                [4, 12, 22, 4, 4],
                                [4, 33, 44, 4, 4],
                                [4, 4, 4, 4, 4]])
        #expect(c == cc)

        let d = a.pad(by: 2)
        let dd = Matrix<Float>([[0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0],
                                [0, 0, 12, 22, 0, 0],
                                [0, 0, 33, 44, 0, 0],
                                [0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0]])
        #expect(d == dd)

        let e = a.pad(by: 1, with: 2.5)
        let ee = Matrix<Float>([[2.5, 2.5, 2.5, 2.5],
                                [2.5, 12, 22, 2.5],
                                [2.5, 33, 44, 2.5],
                                [2.5, 2.5, 2.5, 2.5]])
        #expect(e == ee)

        let f = a.pad()
        let ff = Matrix<Float>([[0, 0, 0, 0],
                                [0, 12, 22, 0],
                                [0, 33, 44, 0],
                                [0, 0, 0, 0]])
        #expect(f == ff)
    }
}
