/*
Tests for random numbers and random vectors.
*/

import Testing
@testable import Numerix

struct RandomTests {

    @Test func randomWyRand() {
        var rand = WyRand(seed: 12345)
        #expect(rand.next() == 13157676964440363053)

        let a: Float = rand.nextUniform()
        #expect(a == 0.9815675)

        let b: Double = rand.nextUniform()
        #expect(b ==  0.7952823641045631)
    }

    @Test func randomVector() {
        // No seed
        let a = Vector<Float>.random(size: 3)
        #expect(a[0] < 1.0)

        let b = Vector<Double>.random(size: 3)
        #expect(b[0] < 1.0)

        // With seed
        let c = Vector<Float>.random(size: 4, seed: 12345)
        #expect(c == Vector<Float>([0.71327907, 0.9815675, 0.79528236, 0.25364798]))

        let d = Vector<Double>.random(size: 4, seed: 12345)
        #expect(d == Vector<Double>([0.7132790974854359, 0.9815675033121781, 0.7952823641045631, 0.25364800714420743]))
    }
}
