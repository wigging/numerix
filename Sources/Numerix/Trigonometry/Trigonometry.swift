/*
Trigonometry protocol.
*/

import Accelerate

@_documentation(visibility: private)
public protocol Trigonometry {
    static func sin(_ a: Vector<Self>) -> Vector<Self>
    static func sin(_ a: Matrix<Self>) -> Matrix<Self>

    static func cos(_ a: Vector<Self>) -> Vector<Self>
    static func cos(_ a: Matrix<Self>) -> Matrix<Self>

    static func tan(_ a: Vector<Self>) -> Vector<Self>
    static func tan(_ a: Matrix<Self>) -> Matrix<Self>

    static func asin(_ a: Vector<Self>) -> Vector<Self>
    static func acos(_ a: Vector<Self>) -> Vector<Self>
    static func atan(_ a: Vector<Self>) -> Vector<Self>
    static func csc(_ a: Vector<Self>) -> Vector<Self>
    static func sec(_ a: Vector<Self>) -> Vector<Self>
    static func cot(_ a: Vector<Self>) -> Vector<Self>
}
