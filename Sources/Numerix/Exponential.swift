/*
 Exponential functions for vector and matrix types.
 
 Wraps the following vForce functions:
 • exp()
 • more coming soon

 Docs for vForce https://developer.apple.com/documentation/accelerate/veclib/vforce
*/

import Accelerate

// MARK: - Vector exponential functions

/// Calculate the exponential exp(x) or e(x) for all single-precision values in a vector.
/// - Parameter vector: The input values.
/// - Returns: Element-wise exponential of x.
public func exp(_ vector: Vector<Float>) -> Vector<Float> {
    let result = vForce.exp(vector.values)
    let vec = Vector(result)
    return vec
}

/// Calculate the exponential exp(x) or e(x) for all double-precision values in a vector.
/// - Parameter vector: The input values.
/// - Returns: Element-wise exponential of x.
public func exp(_ vector: Vector<Double>) -> Vector<Double> {
    let result = vForce.exp(vector.values)
    let vec = Vector(result)
    return vec
}

// MARK: - Matrix exponential functions

/// Calculate the exponential exp(x) or e(x) for all single-precision values in a matrix.
/// - Parameter vector: The input values.
/// - Returns: Element-wise exponential of x.
public func exp(_ matrix: Matrix<Float>) -> Matrix<Float> {
    let result = vForce.exp(matrix.values)
    let mat = Matrix(rows: matrix.rows, columns: matrix.columns, values: result)
    return mat
}

/// Calculate the exponential exp(x) or e(x) for all double-precision values in a matrix.
/// - Parameter vector: The input values.
/// - Returns: Element-wise exponential of x.
public func exp(_ matrix: Matrix<Double>) -> Matrix<Double> {
    let result = vForce.exp(matrix.values)
    let mat = Matrix(rows: matrix.rows, columns: matrix.columns, values: result)
    return mat
}
