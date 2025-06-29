/*
Tests for random numbers and random vectors.
*/

import Testing
import Numerix

struct RandomTests {

    @Test func wyrand() {
        var rand = Wyrand(seed: 12345)
        #expect(rand.next() == 13157676964440363053)

        let a: Float = rand.next()
        #expect(a == 0.9815675)

        let b: Double = rand.next()
        #expect(b ==  0.7952823641045631)
    }

    @Test func xoshiro() {
        var rng = Xoshiro128Plus(seed: (2719949631, 2719949631, 2719949631, 2719949631))
        let a: Float = rng.next()
        #expect(a == 0.26657522)
    }

    @Test func xoroshiro() {
        var rng = Xoroshiro128Plus(seed: (12274935454779349997, 7213431619994351707))
        let a: Double = rng.next()
        #expect(a == 0.05646649603323106)

        var rngg = Xoroshiro128PlusPlus(seed: (12274935454779349997, 7213431619994351707))
        let b: Double = rngg.next()
        #expect(b == 0.8419936520290631)
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

    @Test func randomBNNSVector() {
        let a = Vector<Float>.randomBNNS(size: 5, bounds: (0, 10), seed: 12345)
        #expect(a == [0.6392093, 5.32152, 8.716668, 6.9390416, 0.23953494])
    }

    @Test func randomDist() {
        let a = Vector<Float>.randomDistribution(size: 4)
        let b = Vector<Double>.randomDistribution(size: 5)
        #expect(a[0] <= 1.0)
        #expect(b[0] <= 1.0)
    }
}
