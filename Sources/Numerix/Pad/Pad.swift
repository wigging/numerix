/*
Pad protocol.
Inspired my the NumPy pad function https://numpy.org/doc/stable/reference/generated/numpy.pad.html
*/

import Accelerate

@_documentation(visibility: private)
public protocol Pad {
    static func pad(a: Matrix<Self>, value: Self) -> Matrix<Self>
}
