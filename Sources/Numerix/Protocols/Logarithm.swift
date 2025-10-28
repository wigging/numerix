/*
Logarithm protocol.
*/

import Accelerate

@_documentation(visibility: private)
public protocol Logarithm {
    static func log(a: Vector<Self>) -> Vector<Self>
    static func log(a: Matrix<Self>) -> Matrix<Self>

    static func log1p(a: Vector<Self>) -> Vector<Self>
    static func log1p(a: Matrix<Self>) -> Matrix<Self>

    static func log10(a: Vector<Self>) -> Vector<Self>
    static func log10(a: Matrix<Self>) -> Matrix<Self>

    static func log2(a: Vector<Self>) -> Vector<Self>
    static func log2(a: Matrix<Self>) -> Matrix<Self>

    static func logb(a: Vector<Self>) -> Vector<Self>
    static func logb(a: Matrix<Self>) -> Matrix<Self>
}
