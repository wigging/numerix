/*
Linear algebra protocol.

For matrix determinant, in LAPACK the INFO value is used as the U index `i` in
the error message, this index is one-based so it needs to be zero-based (INFO - 1)
for Swift error message.

Note that there is already an `inverse` function in Swift.

Note that the `inv` implementation here uses LAPACK `dgetrf` and `dgetri` functions.
In LAPACK the INFO value is used as the index `i` in the error message, this index
is one-based so it needs to be zero-based (INFO - 1) for the Swift error message.
*/

@_documentation(visibility: private)
public protocol Algebra {

    static func absoluteSum(a: Vector<Self>) -> Self

    static func copy(a: Matrix<Self>, b: Matrix<Self>)
    static func copy(a: Vector<Self>, b: Vector<Self>)

    static func cumulativeSum(a: Vector<Self>) -> Vector<Self>

    static func det(a: Matrix<Self>) -> Self

    static func dot(a: Vector<Self>, b: Vector<Self>) -> Self

    static func inv(a: Matrix<Self>) -> Matrix<Self>

    static func norm(a: Matrix<Self>) -> Self
    static func norm(a: Vector<Self>) -> Self

    static func scale(a: inout Matrix<Self>, by k: Self)
    static func scale(a: inout Vector<Self>, by k: Self)

    static func sum(a: Vector<Self>) -> Self

    static func swapValues(a: inout Matrix<Self>, b: inout Matrix<Self>)
    static func swapValues(a: inout Vector<Self>, b: inout Vector<Self>)

    static func transpose(a: Matrix<Self>) -> Matrix<Self>

    static func update(a: inout Vector<Self>, k: Self, b: Vector<Self>)
}
