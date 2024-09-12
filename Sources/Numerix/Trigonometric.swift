/*
Trigonometic functions for Vector and Matrix structures.
*/

import Accelerate

// MARK: Vector trig functions

/// Calculate the sine of each element in a single-precision vector.
/// ```swift
/// let vec: Vector<Float> = [1, 2, 3, 4, 5]
/// let result = sin(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: A vector representing the sine of the input vector.
public func sin(_ vec: Vector<Float>) -> Vector<Float> {
    var output = Vector<Float>(length: vec.length)
    vForce.sin(vec.buffer, result: &output.buffer)
    return output
}

/// Calculate the sine of each element in a double-precision vector.
/// ```swift
/// let vec: Vector<Double> = [1, 2, 3, 4, 5]
/// let result = sin(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: A vector representing the sine of the input vector.
public func sin(_ vec: Vector<Double>) -> Vector<Double> {
    var output = Vector<Double>(length: vec.length)
    vForce.sin(vec.buffer, result: &output.buffer)
    return output
}

/// Calculate the cosine of each element in a single-precision vector.
/// ```swift
/// let vec: Vector<Float> = [1, 2, 3, 4, 5]
/// let result = cos(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: A vector representing the cosine of the input vector.
public func cos(_ vec: Vector<Float>) -> Vector<Float> {
    var output = Vector<Float>(length: vec.length)
    vForce.cos(vec.buffer, result: &output.buffer)
    return output
}

/// Calculate the cosine of each element in a double-precision vector.
/// ```swift
/// let vec: Vector<Double> = [1, 2, 3, 4, 5]
/// let result = cos(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: A vector representing the cosine of the input vector.
public func cos(_ vec: Vector<Double>) -> Vector<Double> {
    var output = Vector<Double>(length: vec.length)
    vForce.cos(vec.buffer, result: &output.buffer)
    return output
}

/// Calculate the tangent of each element in a single-precision vector.
/// ```swift
/// let vec: Vector<Float> = [1, 2, 3, 4, 5]
/// let result = tan(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: A vector representing the tangent of the input vector.
public func tan(_ vec: Vector<Float>) -> Vector<Float> {
    var output = Vector<Float>(length: vec.length)
    vForce.tan(vec.buffer, result: &output.buffer)
    return output
}

/// Calculate the tangent of each element in a double-precision vector.
/// ```swift
/// let vec: Vector<Double> = [1, 2, 3, 4, 5]
/// let result = tan(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: A vector representing the tangent of the input vector.
public func tan(_ vec: Vector<Double>) -> Vector<Double> {
    var output = Vector<Double>(length: vec.length)
    vForce.tan(vec.buffer, result: &output.buffer)
    return output
}

// MARK: Matrix trig functions

/// Calculate the sine of each element in a single-precision matrix.
/// ```swift
/// let mat: Matrix<Float> = [[1, 2], [3, 4]]
/// let result = sin(mat))
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: A matrix representing the sine of the input matrix.
public func sin(_ mat: Matrix<Float>) -> Matrix<Float> {
    var output = Matrix<Float>(rows: mat.rows, columns: mat.columns)
    vForce.sin(mat.buffer, result: &output.buffer)
    return output
}

/// Calculate the sine of each element in a double-precision matrix.
/// ```swift
/// let mat: Matrix<Double> = [[1, 2], [3, 4]]
/// let result = sin(mat))
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: A matrix representing the sine of the input matrix.
public func sin(_ mat: Matrix<Double>) -> Matrix<Double> {
    var output = Matrix<Double>(rows: mat.rows, columns: mat.columns)
    vForce.sin(mat.buffer, result: &output.buffer)
    return output
}

/// Calculate the cosine of each element in a single-precision matrix.
/// ```swift
/// let mat: Matrix<Float> = [[1, 2], [3, 4]]
/// let result = cos(mat))
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: A matrix representing the cosine of the input matrix.
public func cos(_ mat: Matrix<Float>) -> Matrix<Float> {
    var output = Matrix<Float>(rows: mat.rows, columns: mat.columns)
    vForce.cos(mat.buffer, result: &output.buffer)
    return output
}

/// Calculate the cosine of each element in a double-precision matrix.
/// ```swift
/// let mat: Matrix<Double> = [[1, 2], [3, 4]]
/// let result = cos(mat))
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: A matrix representing the cosine of the input matrix.
public func cos(_ mat: Matrix<Double>) -> Matrix<Double> {
    var output = Matrix<Double>(rows: mat.rows, columns: mat.columns)
    vForce.cos(mat.buffer, result: &output.buffer)
    return output
}

/// Calculate the tangent of each element in a single-precision matrix.
/// ```swift
/// let mat: Matrix<Float> = [[1, 2], [3, 4]]
/// let result = tan(mat))
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: A matrix representing the tangent of the input matrix.
public func tan(_ mat: Matrix<Float>) -> Matrix<Float> {
    var output = Matrix<Float>(rows: mat.rows, columns: mat.columns)
    vForce.tan(mat.buffer, result: &output.buffer)
    return output
}

/// Calculate the tangent of each element in a double-precision matrix.
/// ```swift
/// let mat: Matrix<Double> = [[1, 2], [3, 4]]
/// let result = tan(mat))
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: A matrix representing the tangent of the input matrix.
public func tan(_ mat: Matrix<Double>) -> Matrix<Double> {
    var output = Matrix<Double>(rows: mat.rows, columns: mat.columns)
    vForce.tan(mat.buffer, result: &output.buffer)
    return output
}

// MARK: ShapedArray trig functions

/// Calculate the sine of each element in a single-precision shaped array.
/// - Parameter array: The input shaped array.
/// - Returns: A shaped array where each element is the sine of the input.
public func sin(_ array: ShapedArray<Float>) -> ShapedArray<Float> {
    var result = ShapedArray<Float>(shape: array.shape)
    vForce.sin(array.buffer, result: &result.buffer)
    return result
}

/// Calculate the sine of each element in a double-precision shaped array.
/// - Parameter array: The input shaped array.
/// - Returns: A shaped array where each element is the sine of the input.
public func sin(_ array: ShapedArray<Double>) -> ShapedArray<Double> {
    var result = ShapedArray<Double>(shape: array.shape)
    vForce.sin(array.buffer, result: &result.buffer)
    return result
}

/// Calculate the cosine of each element in a single-precision shaped array.
/// - Parameter array: The input shaped array.
/// - Returns: A shaped array where each element is the cosine of the input.
public func cos(_ array: ShapedArray<Float>) -> ShapedArray<Float> {
    var result = ShapedArray<Float>(shape: array.shape)
    vForce.cos(array.buffer, result: &result.buffer)
    return result
}

/// Calculate the cosine of each element in a double-precision shaped array.
/// - Parameter array: The input shaped array.
/// - Returns: A shaped array where each element is the cosine of the input.
public func cos(_ array: ShapedArray<Double>) -> ShapedArray<Double> {
    var result = ShapedArray<Double>(shape: array.shape)
    vForce.cos(array.buffer, result: &result.buffer)
    return result
}

/// Calculate the tangent of each element in a single-precision shaped array.
/// - Parameter array: The input shaped array.
/// - Returns: A shaped array where each element is the tangent of the input.
public func tan(_ array: ShapedArray<Float>) -> ShapedArray<Float> {
    var result = ShapedArray<Float>(shape: array.shape)
    vForce.tan(array.buffer, result: &result.buffer)
    return result
}

/// Calculate the tangent of each element in a double-precision shaped array.
/// - Parameter array: The input shaped array.
/// - Returns: A shaped array where each element is the tangent of the input.
public func tan(_ array: ShapedArray<Double>) -> ShapedArray<Double> {
    var result = ShapedArray<Double>(shape: array.shape)
    vForce.tan(array.buffer, result: &result.buffer)
    return result
}
