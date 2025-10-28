/*
ShapedArrayElement enum to represent elements in a ShapedArray struct.
This allows a ShapedArray to be defined as nested arrays such as [[1, 2], [3, 4]] using array literals.
*/

@_documentation(visibility: private)
public enum ShapedArrayElement<T> {
    case array([ShapedArrayElement<T>])
    case element(T)
}

extension ShapedArrayElement: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: ShapedArrayElement<T>...) {
        self = .array(elements)
    }
}

extension ShapedArrayElement: ExpressibleByIntegerLiteral where T: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: T.IntegerLiteralType) {
        self = .element(T(integerLiteral: value))
    }
}

extension ShapedArrayElement: ExpressibleByFloatLiteral where T: ExpressibleByFloatLiteral {
    public init(floatLiteral value: T.FloatLiteralType) {
        self = .element(T(floatLiteral: value))
    }
}
