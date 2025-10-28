/*
Trigonometry functions for Vector.
*/

/// Calculate the sine of each element in a vector.
/// ```swift
/// let vec: Vector<Float> = [1, 2, 3, 4, 5]
/// let result = sin(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: A vector representing the sine of the input vector.
public func sin<Scalar>(_ vec: Vector<Scalar>) -> Vector<Scalar> where Scalar: Trigonometry {
    Scalar.sin(vec)
}

/// Calculate the cosine of each element in a vector.
/// ```swift
/// let vec: Vector<Float> = [1, 2, 3, 4, 5]
/// let result = cos(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: A vector representing the cosine of the input vector.
public func cos<Scalar>(_ vec: Vector<Scalar>) -> Vector<Scalar> where Scalar: Trigonometry {
    Scalar.cos(vec)
}

/// Calculate the tangent of each element in a vector.
/// ```swift
/// let vec: Vector<Float> = [1, 2, 3, 4, 5]
/// let result = tan(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: A vector representing the tangent of the input vector.
public func tan<Scalar>(_ vec: Vector<Scalar>) -> Vector<Scalar> where Scalar: Trigonometry {
    Scalar.tan(vec)
}

/// Calculate the arcsine of each element in a vector.
///
/// Elements in the vector should be within the domain -1 ≤ x ≤ 1 otherwise results may be nan.
/// Results are returned on the closed interval -π / 2 ≤ y ≤ π / 2.
/// ```swift
/// let vec = Vector([-1, -0.5, 0, 0.5, 1])
/// let result = asin(vec)
/// ```
/// - Parameter vec: The input vector with values from -1 to 1.
/// - Returns: A vector representing the arcsine of the input vector.
public func asin<Scalar>(_ vec: Vector<Scalar>) -> Vector<Scalar> where Scalar: Trigonometry {
    Scalar.asin(vec)
}

/// Calculate the arccosine of each element in a vector.
/// - Parameter vec: The input vector.
/// - Returns: A vector representing the arccosine of the input vector.
public func acos<Scalar>(_ vec: Vector<Scalar>) -> Vector<Scalar> where Scalar: Trigonometry {
    Scalar.acos(vec)
}

/// Calculate the arctangent of each element in a vector.
/// - Parameter vec: The input vector.
/// - Returns: A vector representing the arctangent of the input vector.
public func atan<Scalar>(_ vec: Vector<Scalar>) -> Vector<Scalar> where Scalar: Trigonometry {
    Scalar.atan(vec)
}

/// Calculate the cosecant as 1 / sinθ for each element in a vector.
/// - Parameter vec: The input vector.
/// - Returns: A vector representing the cosecant of the input vector.
public func csc<Scalar>(_ vec: Vector<Scalar>) -> Vector<Scalar> where Scalar: Trigonometry {
    Scalar.csc(vec)
}

/// Calculate the secant as 1 / cosθ for each element in a vector.
/// - Parameter vec: The input vector.
/// - Returns: A vector representing the secant of the input vector.
public func sec<Scalar>(_ vec: Vector<Scalar>) -> Vector<Scalar> where Scalar: Trigonometry {
    Scalar.sec(vec)
}

/// Calculate the cotangent as 1 / tanθ for each element in a vector.
/// - Parameter vec: The input vector.
/// - Returns: A vector representing the cotangent of the input vector.
public func cot<Scalar>(_ vec: Vector<Scalar>) -> Vector<Scalar> where Scalar: Trigonometry {
    Scalar.cot(vec)
}
