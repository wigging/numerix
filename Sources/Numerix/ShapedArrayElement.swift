/*
ShapedArrayElement enum to represent elements in a ShapedArray struct.
This allows a ShapedArray to be defined as nested arrays such as [[1, 2], [3, 4]] using array literals.
*/

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

/*
Functions for getting shape of nested arrays and to flatten nested arrays where
the elements of the nested arrays are ShapedArrayElement. These functions are
used by the ShapedArray struct.
*/

// Get the shape of nested arrays that represent an N-dimensional array.
// This is used for ShapedArray init and ShapedArray literal.
func getShape<T>(_ arr: [ShapedArrayElement<T>]) -> [Int] {
    switch arr.first {
    case .array(let inner):
        [arr.count] + getShape(inner)
    default:
        [arr.count]
    }
}

// Flatten nested arrays to an array.
func flatten<T>(_ arrays: [ShapedArrayElement<T>]) -> [T] {
    var result = [T]()
    for val in arrays {
        switch val {
        case .array(let arr):
            result.append(contentsOf: flatten(arr))
        case .element(let elm):
            result.append(elm)
        }
    }

    return result
}
