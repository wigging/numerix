/*
 Exponential functions for Vector and Matrix structures. The following single
 and double precision operations are supported:
 • exp() for eˣ
 • exp2() for 2ˣ
 • expm1() for eˣ - 1
*/

import Accelerate

// MARK: Vector exponential

/// Calculate eˣ as the exponential function for all single-precision values in a vector.
/// - Parameter vector: The input values.
/// - Returns: Element-wise exponential function of x.
public func exp(_ vec: Vector<Float>) -> Vector<Float> {
    var result = Vector<Float>(length: vec.length)
    vForce.exp(vec.buffer, result: &result.buffer)
    return result
}

/// Calculate eˣ as the exponential function for all double-precision values in a vector.
/// - Parameter vector: The input values.
/// - Returns: Element-wise exponential function of x.
public func exp(_ vec: Vector<Double>) -> Vector<Double> {
    var result = Vector<Double>(length: vec.length)
    vForce.exp(vec.buffer, result: &result.buffer)
    return result
}

/// Calculate 2ˣ as 2 raised to the power of all single-precision values in a vector.
/// - Parameter vector: The input values.
/// - Returns: Element-wise 2 to the power of x.
public func exp2(_ vec: Vector<Float>) -> Vector<Float> {
    var result = Vector<Float>(length: vec.length)
    vForce.exp2(vec.buffer, result: &result.buffer)
    return result
}

/// Calculate 2ˣ as 2 raised to the power of all double-precision values in a vector.
/// - Parameter vector: The input values.
/// - Returns: Element-wise 2 to the power of x.
public func exp2(_ vec: Vector<Double>) -> Vector<Double> {
    var result = Vector<Double>(length: vec.length)
    vForce.exp2(vec.buffer, result: &result.buffer)
    return result
}

/// Calculate eˣ-1 for all single-precision values in a vector.
/// - Parameter vector: The input values.
/// - Returns: Element-wise eˣ-1 where x is each value of the input vector.
public func expm1(_ vec: Vector<Float>) -> Vector<Float> {
    var result = Vector<Float>(length: vec.length)
    vForce.expm1(vec.buffer, result: &result.buffer)
    return result
}

/// Calculate eˣ-1 for all double-precision values in a vector.
/// - Parameter vector: The input values.
/// - Returns: Element-wise eˣ-1 where x is each value of the input vector.
public func expm1(_ vec: Vector<Double>) -> Vector<Double> {
    var result = Vector<Double>(length: vec.length)
    vForce.expm1(vec.buffer, result: &result.buffer)
    return result
}

// MARK: Matrix exponential

/// Calculate the exponential function eˣ for all single-precision values in a matrix.
/// - Parameter matrix: The input values.
/// - Returns: Element-wise exponential function of x.
public func exp(_ matrix: Matrix<Float>) -> Matrix<Float> {
    var mat = Matrix<Float>(rows: matrix.rows, columns: matrix.columns)
    vForce.exp(matrix.buffer, result: &mat.buffer)
    return mat
}

/// Calculate the exponential function eˣ for all double-precision values in a matrix.
/// - Parameter matrix: The input values.
/// - Returns: Element-wise exponential function of x.
public func exp(_ matrix: Matrix<Double>) -> Matrix<Double> {
    var mat = Matrix<Double>(rows: matrix.rows, columns: matrix.columns)
    vForce.exp(matrix.buffer, result: &mat.buffer)
    return mat
}

/// Calculate 2ˣ as 2 raised to the power of all single-precision values in a matrix.
/// - Parameter matrix: The input values.
/// - Returns: Element-wise 2 to the power of x.
public func exp2(_ matrix: Matrix<Float>) -> Matrix<Float> {
    var mat = Matrix<Float>(rows: matrix.rows, columns: matrix.columns)
    vForce.exp2(matrix.buffer, result: &mat.buffer)
    return mat
}

/// Calculate 2ˣ as 2 raised to the power of all double-precision values in a matrix.
/// - Parameter matrix: The input values.
/// - Returns: Element-wise 2 to the power of x.
public func exp2(_ matrix: Matrix<Double>) -> Matrix<Double> {
    var mat = Matrix<Double>(rows: matrix.rows, columns: matrix.columns)
    vForce.exp2(matrix.buffer, result: &mat.buffer)
    return mat
}

/// Calculate eˣ-1 for all single-precision values in a matrix.
/// - Parameter vector: The input values.
/// - Returns: Element-wise eˣ-1 where x is each value of the input matrix.
public func expm1(_ matrix: Matrix<Float>) -> Matrix<Float> {
    var mat = Matrix<Float>(rows: matrix.rows, columns: matrix.columns)
    vForce.expm1(matrix.buffer, result: &mat.buffer)
    return mat
}

/// Calculate eˣ-1 for all double-precision values in a matrix.
/// - Parameter vector: The input values.
/// - Returns: Element-wise eˣ-1 where x is each value of the input matrix.
public func expm1(_ matrix: Matrix<Double>) -> Matrix<Double> {
    var mat = Matrix<Double>(rows: matrix.rows, columns: matrix.columns)
    vForce.expm1(matrix.buffer, result: &mat.buffer)
    return mat
}
