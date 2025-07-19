/*
Power protocol.
*/

@_documentation(visibility: private)
public protocol Power {
    static func power(a: Vector<Self>, exp: Self) -> Vector<Self>
    static func power(a: Matrix<Self>, exp: Self) -> Matrix<Self>
    static func power(a: Vector<Self>, exp: [Self]) -> Vector<Self>
    static func power(a: Matrix<Self>, exp: [Self]) -> Matrix<Self>
}
