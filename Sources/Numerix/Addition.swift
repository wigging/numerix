//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 5/18/24.
//

import Accelerate

// MARK: - Vector addition

/// Element-wise addition of a scalar and a vector with single precision.
/// - Parameters:
///   - lhs: Scalar value.
///   - rhs: Vector of length n.
/// - Returns: Vector of length n.
public func + (lhs: Float, rhs: Vector<Float>) -> Vector<Float> {
    let result = vDSP.add(lhs, rhs.values)
    return Vector(result)
}

/// Element-wise addition of a scalar and a vector with double precision.
/// - Parameters:
///   - lhs: Scalar value.
///   - rhs: Vector of length n.
/// - Returns: Vector of length n.
public func + (lhs: Double, rhs: Vector<Double>) -> Vector<Double> {
    let result = vDSP.add(lhs, rhs.values)
    return Vector(result)
}

/// Element-wise addition of a vector and a scalar with single precision.
/// - Parameters:
///   - lhs: Vector of length n.
///   - rhs: Scalar value
/// - Returns: Vector of length n.
public func + (lhs: Vector<Float>, rhs: Float) -> Vector<Float> {
    let result = vDSP.add(rhs, lhs.values)
    return Vector(result)
}

/// Element-wise addition of a vector and a scalar with double precision.
/// - Parameters:
///   - lhs: Vector of length n.
///   - rhs: Scalar value
/// - Returns: Vector of length n.
public func + (lhs: Vector<Double>, rhs: Double) -> Vector<Double> {
    let result = vDSP.add(rhs, lhs.values)
    return Vector(result)
}

/// Element-wise addition of two vectors with single precision. Vectors must be same length.
/// - Parameters:
///   - lhs: Vector of length n.
///   - rhs: Vector of length n.
/// - Returns: Vector of length n.
public func + (lhs: Vector<Float>, rhs: Vector<Float>) -> Vector<Float> {
    precondition(lhs.length == rhs.length, "Vectors must be same length")
    let result = vDSP.add(lhs.values, rhs.values)
    return Vector(result)
}

/// Element-wise addition of two vectors with double precision. Vectors must be same length.
/// - Parameters:
///   - lhs: Vector of length n.
///   - rhs: Vector of length n.
/// - Returns: Vector of length n.
public func + (lhs: Vector<Double>, rhs: Vector<Double>) -> Vector<Double> {
    precondition(lhs.length == rhs.length, "Vectors must be same length")
    let result = vDSP.add(lhs.values, rhs.values)
    return Vector(result)
}

// MARK: - Matrix addition

/// Element-wise sum of a matrix and a scalar with double precision.
/// - Parameters:
///   - lhs: Scalar value
///   - rhs: Matrix B.
/// - Returns: The sum of scalar + B[i].
public func + (lhs: Float, rhs: Matrix<Float>) -> Matrix<Float> {
    let result = vDSP.add(lhs, rhs.values)
    return Matrix(rows: rhs.rows, columns: rhs.columns, values: result)
}

/// Element-wise sum of a matrix and a scalar with double precision.
/// - Parameters:
///   - lhs: Matrix A.
///   - rhs: Scalar value.
/// - Returns: The sum of A[i] + scalar.
public func + (lhs: Matrix<Float>, rhs: Float) -> Matrix<Float> {
    let result = vDSP.add(rhs, lhs.values)
    return Matrix(rows: lhs.rows, columns: lhs.columns, values: result)
}

/// Element-wise sum of a matrix and a scalar with double precision.
/// - Parameters:
///   - lhs: Scalar value
///   - rhs: Matrix B.
/// - Returns: The sum of scalar + B[i].
public func + (lhs: Double, rhs: Matrix<Double>) -> Matrix<Double> {
    let result = vDSP.add(lhs, rhs.values)
    return Matrix(rows: rhs.rows, columns: rhs.columns, values: result)
}

/// Element-wise sum of a matrix and a scalar with double precision.
/// - Parameters:
///   - lhs: Matrix A.
///   - rhs: Scalar value.
/// - Returns: The sum of A[i] + scalar.
public func + (lhs: Matrix<Double>, rhs: Double) -> Matrix<Double> {
    let result = vDSP.add(rhs, lhs.values)
    return Matrix(rows: lhs.rows, columns: lhs.columns, values: result)
}

/// Element-wise sum of two matrices with single precision.
/// - Parameters:
///   - lhs: Matrix A.
///   - rhs: Matrix B.
/// - Returns: The sum of A[i] + B[i].
public func + (lhs: Matrix<Float>, rhs: Matrix<Float>) -> Matrix<Float> {
    precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must be same shape")
    let result = vDSP.add(lhs.values, rhs.values)
    return Matrix(rows: lhs.rows, columns: lhs.columns, values: result)
}

/// Element-wise sum of two matrices with double precision.
/// - Parameters:
///   - lhs: Matrix A.
///   - rhs: Matrix B.
/// - Returns: The sum of A[i] + B[i].
public func + (lhs: Matrix<Double>, rhs: Matrix<Double>) -> Matrix<Double> {
    precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must be same shape")
    let result = vDSP.add(lhs.values, rhs.values)
    return Matrix(rows: lhs.rows, columns: lhs.columns, values: result)
}
