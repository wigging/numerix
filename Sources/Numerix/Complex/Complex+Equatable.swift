/*
Complex extension to conform to Equatable protocol.
*/

import Accelerate

extension Complex: Equatable where Scalar: Equatable {
    public static func == (lhs: Complex, rhs: Complex) -> Bool {
        lhs.real == rhs.real && lhs.imaginary == rhs.imaginary
    }
}
