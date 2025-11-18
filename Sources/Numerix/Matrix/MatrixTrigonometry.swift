/*
Matrix trigonometry protocol and associated extensions and functions.
*/

import Accelerate

@_documentation(visibility: private)
public protocol MatrixTrigonometry {
    static func sin(_ a: Matrix<Self>) -> Matrix<Self>
    static func cos(_ a: Matrix<Self>) -> Matrix<Self>
    static func tan(_ a: Matrix<Self>) -> Matrix<Self>
}

@_documentation(visibility: private)
extension Double: MatrixTrigonometry {

    public static func sin(_ a: Matrix<Double>) -> Matrix<Double> {
        var result = Matrix(like: a)
        vForce.sin(a.buffer, result: &result.buffer)
        return result
    }

    public static func cos(_ a: Matrix<Double>) -> Matrix<Double> {
        var result = Matrix(like: a)
        vForce.cos(a.buffer, result: &result.buffer)
        return result
    }

    public static func tan(_ a: Matrix<Double>) -> Matrix<Double> {
        var result = Matrix(like: a)
        vForce.tan(a.buffer, result: &result.buffer)
        return result
    }
}

@_documentation(visibility: private)
extension Float: MatrixTrigonometry {

    public static func sin(_ a: Matrix<Float>) -> Matrix<Float> {
        var result = Matrix(like: a)
        vForce.sin(a.buffer, result: &result.buffer)
        return result
    }

    public static func cos(_ a: Matrix<Float>) -> Matrix<Float> {
        var result = Matrix(like: a)
        vForce.cos(a.buffer, result: &result.buffer)
        return result
    }

    public static func tan(_ a: Matrix<Float>) -> Matrix<Float> {
        var result = Matrix(like: a)
        vForce.tan(a.buffer, result: &result.buffer)
        return result
    }
}

/// Calculate the sine of each element in a matrix.
/// ```swift
/// let mat: Matrix<Float> = [[1, 2], [3, 4]]
/// let result = sin(mat))
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: A matrix representing the sine of the input matrix.
public func sin<Scalar>(_ mat: Matrix<Scalar>) -> Matrix<Scalar> where Scalar: MatrixTrigonometry {
    Scalar.sin(mat)
}

/// Calculate the cosine of each element in a matrix.
/// ```swift
/// let mat: Matrix<Float> = [[1, 2], [3, 4]]
/// let result = cos(mat))
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: A matrix representing the cosine of the input matrix.
public func cos<Scalar>(_ mat: Matrix<Scalar>) -> Matrix<Scalar> where Scalar: MatrixTrigonometry {
    Scalar.cos(mat)
}

/// Calculate the tangent of each element in a matrix.
/// ```swift
/// let mat: Matrix<Float> = [[1, 2], [3, 4]]
/// let result = tan(mat))
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: A matrix representing the tangent of the input matrix.
public func tan<Scalar>(_ mat: Matrix<Scalar>) -> Matrix<Scalar> where Scalar: MatrixTrigonometry {
    Scalar.tan(mat)
}
