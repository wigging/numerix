/*
Tests for random numbers and random vectors.
*/

import Testing
import Numerix

struct RandomTests {

    @Test func wyrand() {
        var rng = Wyrand(seed: 12345)
        #expect(rng.next() == 13157676964440363053)

        let a: Float = rng.next()
        #expect(a == 0.9815675)

        let b: Double = rng.next()
        #expect(b ==  0.7952823641045631)
    }

    @Test func wyrandVector() {
        // Without seed
        let a = Vector<Float>.random(5)
        #expect(a[0] < 1)

        let aa = Vector<Double>.random(5)
        #expect(aa[0] < 1)

        // With seed
        let b = Vector<Float>.random(5, seed: 123456)
        #expect(b == [0.81488985, 0.30684602, 0.31690413, 0.3039148, 0.18646216])

        let bb = Vector<Double>.random(4, seed: 123456)
        #expect(bb == [0.8148898875141517, 0.3068460469993851, 0.3169041625894291, 0.30391479120110254])

        // With generator
        var rng = Wyrand(seed: 123456)
        let c = Vector<Float>.random(5, using: &rng)
        #expect(c == [0.81488985, 0.30684602, 0.31690413, 0.3039148, 0.18646216])

        var rngg = Wyrand(seed: 123456)
        let cc = Vector<Double>.random(4, using: &rngg)
        #expect(cc == [0.8148898875141517, 0.3068460469993851, 0.3169041625894291, 0.30391479120110254])
    }

    @Test func wyrandMatrix() {
        // Without seed
        let a = Matrix<Float>.random(3, 3)
        #expect(a[0, 0] < 1)

        let aa = Matrix<Double>.random(3, 3)
        #expect(aa[0, 0] < 1)

        // With seed
        let b = Matrix<Float>.random(2, 2, seed: 123456)
        #expect(b == [[0.81488985, 0.30684602], [0.31690413, 0.3039148]])

        let bb = Matrix<Double>.random(2, 2, seed: 123456)
        #expect(bb == [[0.8148898875141517, 0.3068460469993851], [0.3169041625894291, 0.30391479120110254]])

        // With generator
        var rng = Wyrand(seed: 123456)
        let c = Matrix<Float>.random(2, 2, using: &rng)
        #expect(c == [[0.81488985, 0.30684602], [0.31690413, 0.3039148]])

        var rngg = Wyrand(seed: 123456)
        let cc = Matrix<Double>.random(2, 2, using: &rngg)
        #expect(cc == [[0.8148898875141517, 0.3068460469993851], [0.3169041625894291, 0.30391479120110254]])
    }

    @Test func xoroshiro() {
        // Xoroshiro128Plus
        var rng = Xoroshiro128Plus(seed: (12274935454779349997, 7213431619994351707))
        #expect(rng.next() == 1041623001064150088)

        let a: Float = rng.next()
        #expect(a == 0.061123848)

        let b: Double = rng.next()
        #expect(b == 0.1307673047034703)

        // Xoroshiro128PlusPlus
        var rngg = Xoroshiro128PlusPlus(seed: (12274935454779349997, 7213431619994351707))
        #expect(rngg.next() == 15532041410668181718)

        let c: Float = rngg.next()
        #expect(c == 0.4994716)

        let d: Double = rngg.next()
        #expect(d == 0.7990605775501556)
    }

    @Test func xoroshiroVector() {
        // Xoroshiro128Plus
        var rng = Xoroshiro128Plus(seed: (12274935454779349997, 7213431619994351707))
        let a = Vector<Float>.random(5, using: &rng)
        #expect(a == [0.05646646, 0.061123848, 0.13076729, 0.672823, 0.86956143])

        let b = Vector<Double>.random(4, using: &rng)
        #expect(b == [0.12803432662341308, 0.17036647757843948, 0.8789760758360461, 0.6166839170638875])

        // Xoroshiro128PlusPlus
        var rngg = Xoroshiro128PlusPlus(seed: (12274935454779349997, 7213431619994351707))
        let c = Vector<Float>.random(5, using: &rngg)
        #expect(c == [0.84199363, 0.4994716, 0.7990605, 0.74130404, 0.2992577])

        let d = Vector<Double>.random(4, using: &rngg)
        #expect(d == [0.6241821269000679, 0.18502002919976157, 0.2555743212406011, 0.5790431050892778])
    }

    @Test func xoroshiroMatrix() {
        // Xoroshiro128Plus
        var rng = Xoroshiro128Plus(seed: (12274935454779349997, 7213431619994351707))
        let a = Matrix<Float>.random(2, 2, using: &rng)
        #expect(a == [[0.05646646, 0.061123848], [0.13076729, 0.672823]])

        let b = Matrix<Double>.random(2, 2, using: &rng)
        #expect(b == [[0.8695614471421985, 0.12803432662341308], [0.17036647757843948, 0.8789760758360461]])

        // Xoroshiro128PlusPlus
        var rngg = Xoroshiro128PlusPlus(seed: (12274935454779349997, 7213431619994351707))
        let c = Matrix<Float>.random(2, 2, using: &rngg)
        #expect(c == [[0.84199363, 0.4994716], [0.7990605, 0.74130404]])

        let d = Matrix<Double>.random(2, 2, using: &rngg)
        #expect(d == [[0.2992577376225274, 0.6241821269000679], [0.18502002919976157, 0.2555743212406011]])
    }

    @Test func xoshiro() {
        var rng = Xoshiro128Plus(seed: (2719949631, 2719949631, 2719949631, 2719949631))
        #expect(rng.next() == 1144931966)

        let a: Float = rng.next()
        #expect(a == 0.6332876)
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
