/*
 Exponential functions for vector and matrix types.
 • exp() for eˣ
 • exp2() for 2ˣ
 • more coming soon

 Uses functions from Accelerate vForce
 https://developer.apple.com/documentation/accelerate/veclib/vforce
*/

import Accelerate

// MARK: - Vector exponential functions

/// Calculate eˣ as the exponential function for all single-precision values in a vector.
/// - Parameter vector: The input values.
/// - Returns: Element-wise exponential function of x.
public func exp(_ vector: Vector<Float>) -> Vector<Float> {
    let result = vForce.exp(vector.values)
    let vec = Vector(result)
    return vec
}

/// Calculate eˣ as the exponential function for all double-precision values in a vector.
/// - Parameter vector: The input values.
/// - Returns: Element-wise exponential function of x.
public func exp(_ vector: Vector<Double>) -> Vector<Double> {
    let result = vForce.exp(vector.values)
    let vec = Vector(result)
    return vec
}

/// Calculate 2ˣ as 2 raised to the power of all single-precision values in a vector.
/// - Parameter vector: The input values.
/// - Returns: Element-wise 2 to the power of x.
public func exp2(_ vector: Vector<Float>) -> Vector<Float> {
    let result = vForce.exp2(vector.values)
    let vec = Vector(result)
    return vec
}

/// Calculate 2ˣ as 2 raised to the power of all double-precision values in a vector.
/// - Parameter vector: The input values.
/// - Returns: Element-wise 2 to the power of x.
public func exp2(_ vector: Vector<Double>) -> Vector<Double> {
    let result = vForce.exp2(vector.values)
    let vec = Vector(result)
    return vec
}

// MARK: - Matrix exponential functions

/// Calculate the exponential function eˣ for all single-precision values in a matrix.
/// - Parameter matrix: The input values.
/// - Returns: Element-wise exponential function of x.
public func exp(_ matrix: Matrix<Float>) -> Matrix<Float> {
    let result = vForce.exp(matrix.values)
    let mat = Matrix(rows: matrix.rows, columns: matrix.columns, values: result)
    return mat
}

/// Calculate the exponential function eˣ for all double-precision values in a matrix.
/// - Parameter matrix: The input values.
/// - Returns: Element-wise exponential function of x.
public func exp(_ matrix: Matrix<Double>) -> Matrix<Double> {
    let result = vForce.exp(matrix.values)
    let mat = Matrix(rows: matrix.rows, columns: matrix.columns, values: result)
    return mat
}

/// Calculate 2ˣ as 2 raised to the power of all single-precision values in a matrix.
/// - Parameter matrix: The input values.
/// - Returns: Element-wise 2 to the power of x.
public func exp2(_ matrix: Matrix<Float>) -> Matrix<Float> {
    let result = vForce.exp2(matrix.values)
    let mat = Matrix(rows: matrix.rows, columns: matrix.columns, values: result)
    return mat
}

/// Calculate 2ˣ as 2 raised to the power of all double-precision values in a matrix.
/// - Parameter matrix: The input values.
/// - Returns: Element-wise 2 to the power of x.
public func exp2(_ matrix: Matrix<Double>) -> Matrix<Double> {
    let result = vForce.exp2(matrix.values)
    let mat = Matrix(rows: matrix.rows, columns: matrix.columns, values: result)
    return mat
}
