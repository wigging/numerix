//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 5/18/24.
//

import Accelerate

// MARK: Vector subtraction

public func - (lhs: Float, rhs: Vector<Float>) -> Vector<Float> {
    let arr = Array(repeating: lhs, count: rhs.values.count)
    let result = vDSP.subtract(arr, rhs.values)
    return Vector(result)
}

public func - (lhs: Double, rhs: Vector<Double>) -> Vector<Double> {
    let arr = Array(repeating: lhs, count: rhs.values.count)
    let result = vDSP.subtract(arr, rhs.values)
    return Vector(result)
}

public func - (lhs: Vector<Float>, rhs: Float) -> Vector<Float> {
    let arr = Array(repeating: rhs, count: lhs.values.count)
    let result = vDSP.subtract(lhs.values, arr)
    return Vector(result)
}

public func - (lhs: Vector<Double>, rhs: Double) -> Vector<Double> {
    let arr = Array(repeating: rhs, count: lhs.values.count)
    let result = vDSP.subtract(lhs.values, arr)
    return Vector(result)
}

public func - (lhs: Vector<Float>, rhs: Vector<Float>) -> Vector<Float> {
    precondition(lhs.values.count == rhs.values.count, "Vectors must be same length")
    let result = vDSP.subtract(lhs.values, rhs.values)
    return Vector(result)
}

public func - (lhs: Vector<Double>, rhs: Vector<Double>) -> Vector<Double> {
    precondition(lhs.values.count == rhs.values.count, "Vectors must be same length")
    let result = vDSP.subtract(lhs.values, rhs.values)
    return Vector(result)
}

// MARK: Matrix subtraction

public func - (lhs: Float, rhs: Matrix<Float>) -> Matrix<Float> {
    let arr = Array(repeating: lhs, count: rhs.values.count)
    let result = vDSP.subtract(arr, rhs.values)
    return Matrix(rows: rhs.rows, columns: rhs.columns, values: result)
}

public func - (lhs: Double, rhs: Matrix<Double>) -> Matrix<Double> {
    let arr = Array(repeating: lhs, count: rhs.values.count)
    let result = vDSP.subtract(arr, rhs.values)
    return Matrix(rows: rhs.rows, columns: rhs.columns, values: result)
}

public func - (lhs: Matrix<Float>, rhs: Float) -> Matrix<Float> {
    let arr = Array(repeating: rhs, count: lhs.values.count)
    let result = vDSP.subtract(lhs.values, arr)
    return Matrix(rows: lhs.rows, columns: lhs.columns, values: result)
}

public func - (lhs: Matrix<Double>, rhs: Double) -> Matrix<Double> {
    let arr = Array(repeating: rhs, count: lhs.values.count)
    let result = vDSP.subtract(lhs.values, arr)
    return Matrix(rows: lhs.rows, columns: lhs.columns, values: result)
}

public func - (lhs: Matrix<Float>, rhs: Matrix<Float>) -> Matrix<Float> {
    let result = vDSP.subtract(lhs.values, rhs.values)
    return Matrix(rows: rhs.rows, columns: rhs.columns, values: result)
}

public func - (lhs: Matrix<Double>, rhs: Matrix<Double>) -> Matrix<Double> {
    let result = vDSP.subtract(lhs.values, rhs.values)
    return Matrix(rows: rhs.rows, columns: rhs.columns, values: result)
}
