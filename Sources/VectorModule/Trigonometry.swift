/*
 Vector trigonometry protocol and functions.
 */

import Accelerate

public protocol Trigonometry {
    static func sin(_ a: Vector<Self>) -> Vector<Self>
    static func cos(_ a: Vector<Self>) -> Vector<Self>
    static func tan(_ a: Vector<Self>) -> Vector<Self>
}

extension Float: Trigonometry {

    public static func sin(_ a: Vector<Float>) -> Vector<Float> {
        var result = Vector(like: a)
        vForce.sin(a.buffer, result: &result.buffer)
        return result
    }

    public static func cos(_ a: Vector<Float>) -> Vector<Float> {
        var result = Vector(like: a)
        vForce.cos(a.buffer, result: &result.buffer)
        return result
    }

    public static func tan(_ a: Vector<Float>) -> Vector<Float> {
        var result = Vector(like: a)
        vForce.tan(a.buffer, result: &result.buffer)
        return result
    }
}

extension Double: Trigonometry {

    public static func sin(_ a: Vector<Double>) -> Vector<Double> {
        var result = Vector(like: a)
        vForce.sin(a.buffer, result: &result.buffer)
        return result
    }

    public static func cos(_ a: Vector<Double>) -> Vector<Double> {
        var result = Vector(like: a)
        vForce.cos(a.buffer, result: &result.buffer)
        return result
    }

    public static func tan(_ a: Vector<Double>) -> Vector<Double> {
        var result = Vector(like: a)
        vForce.tan(a.buffer, result: &result.buffer)
        return result
    }
}

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
