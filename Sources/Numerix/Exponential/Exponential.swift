/*
Exponential protocol.
*/

import Accelerate

@_documentation(visibility: private)
public protocol Exponential {
    static func exp(a: Vector<Self>) -> Vector<Self>
    static func exp2(a: Vector<Self>) -> Vector<Self>
    static func expm1(a: Vector<Self>) -> Vector<Self>
    static func exp(a: Matrix<Self>) -> Matrix<Self>
    static func exp2(a: Matrix<Self>) -> Matrix<Self>
    static func expm1(a: Matrix<Self>) -> Matrix<Self>
}
