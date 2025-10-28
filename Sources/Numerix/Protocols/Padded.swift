/*
Padded protocol.
Inspired by the NumPy pad function https://numpy.org/doc/stable/reference/generated/numpy.pad.html
*/

import Accelerate

@_documentation(visibility: private)
public protocol Padded {
    static func padded(a: Matrix<Self>, top: Int, bottom: Int, left: Int, right: Int, value: Self) -> Matrix<Self>
}
