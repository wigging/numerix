/*
Arithmetic protocol.
*/

import Accelerate

infix operator .* : MultiplicationPrecedence
infix operator ⊙ : MultiplicationPrecedence

@_documentation(visibility: private)
public protocol Arithmetic {
    // A + k
    static func add(_ a: Vector<Self>, _ k: Self) -> Vector<Self>
    static func add(_ a: Matrix<Self>, _ k: Self) -> Matrix<Self>
    static func add(_ a: ShapedArray<Self>, _ k: Self) -> ShapedArray<Self>

    // A + B
    static func add(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self>
    static func add(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self>
    static func add(_ a: ShapedArray<Self>, _ b: ShapedArray<Self>) -> ShapedArray<Self>

    // k - A
    static func subtract(_ k: Self, _ a: Vector<Self>) -> Vector<Self>
    static func subtract(_ k: Self, _ a: Matrix<Self>) -> Matrix<Self>
    static func subtract(_ k: Self, _ a: ShapedArray<Self>) -> ShapedArray<Self>

    // A - k
    static func subtract(_ a: Vector<Self>, _ k: Self) -> Vector<Self>
    static func subtract(_ a: Matrix<Self>, _ k: Self) -> Matrix<Self>
    static func subtract(_ a: ShapedArray<Self>, _ k: Self) -> ShapedArray<Self>

    // A - B
    static func subtract(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self>
    static func subtract(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self>
    static func subtract(_ a: ShapedArray<Self>, _ b: ShapedArray<Self>) -> ShapedArray<Self>

    // A * k
    static func multiply(_ a: Vector<Self>, _ k: Self) -> Vector<Self>
    static func multiply(_ a: Matrix<Self>, _ k: Self) -> Matrix<Self>
    static func multiply(_ a: ShapedArray<Self>, _ k: Self) -> ShapedArray<Self>

    // A * B
    static func multiply(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self>
    static func multiply(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self>
    static func multiply(_ a: ShapedArray<Self>, _ b: ShapedArray<Self>) -> ShapedArray<Self>

    // A x B
    static func matrixMultiply(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self>

    // k / A
    static func divide(_ k: Self, _ a: Vector<Self>) -> Vector<Self>
    static func divide(_ k: Self, _ a: Matrix<Self>) -> Matrix<Self>
    static func divide(_ k: Self, _ a: ShapedArray<Self>) -> ShapedArray<Self>

    // A / k
    static func divide(_ a: Vector<Self>, _ k: Self) -> Vector<Self>
    static func divide(_ a: Matrix<Self>, _ k: Self) -> Matrix<Self>
    static func divide(_ a: ShapedArray<Self>, _ k: Self) -> ShapedArray<Self>

    // A / B
    static func divide(_ a: Vector<Self>, _ b: Vector<Self>) -> Vector<Self>
    static func divide(_ a: Matrix<Self>, _ b: Matrix<Self>) -> Matrix<Self>
    static func divide(_ a: ShapedArray<Self>, _ b: ShapedArray<Self>) -> ShapedArray<Self>
}
