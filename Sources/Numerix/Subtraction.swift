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
    let result = Vector(length: rhs.length) { buffer in
        vDSP.subtract(arr, rhs.values, result: &buffer)
    }
    return result
}

public func - (lhs: Double, rhs: Vector<Double>) -> Vector<Double> {
    let arr = Array(repeating: lhs, count: rhs.values.count)
    let result = Vector(length: rhs.length) { buffer in
        vDSP.subtract(arr, rhs.values, result: &buffer)
    }
    return result
}

public func - (lhs: Vector<Float>, rhs: Float) -> Vector<Float> {
    let arr = Array(repeating: rhs, count: lhs.values.count)
    let result = Vector(length: lhs.length) { buffer in
        vDSP.subtract(lhs.values, arr, result: &buffer)
    }
    return result
}

public func - (lhs: Vector<Double>, rhs: Double) -> Vector<Double> {
    let arr = Array(repeating: rhs, count: lhs.values.count)
    let result = Vector(length: lhs.length) { buffer in
        vDSP.subtract(lhs.values, arr, result: &buffer)
    }
    return result
}

public func - (lhs: Vector<Float>, rhs: Vector<Float>) -> Vector<Float> {
    precondition(lhs.values.count == rhs.values.count, "Vectors must be same length")
    let result = Vector(length: lhs.length) { buffer in
        vDSP.subtract(lhs.values, rhs.values, result: &buffer)
    }
    return result
}

public func - (lhs: Vector<Double>, rhs: Vector<Double>) -> Vector<Double> {
    precondition(lhs.values.count == rhs.values.count, "Vectors must be same length")
    let result = Vector(length: lhs.length) { buffer in
        vDSP.subtract(lhs.values, rhs.values, result: &buffer)
    }
    return result
}

// MARK: Matrix subtraction

public func - (lhs: Float, rhs: Matrix<Float>) -> Matrix<Float> {
    let arr = Array(repeating: lhs, count: rhs.values.count)
    let result = Matrix(rows: rhs.rows, columns: rhs.columns) { buffer in
        vDSP.subtract(arr, rhs.values, result: &buffer)
    }
    return result
}

public func - (lhs: Double, rhs: Matrix<Double>) -> Matrix<Double> {
    let arr = Array(repeating: lhs, count: rhs.values.count)
    let result = Matrix(rows: rhs.rows, columns: rhs.columns) { buffer in
        vDSP.subtract(arr, rhs.values, result: &buffer)
    }
    return result
}

public func - (lhs: Matrix<Float>, rhs: Float) -> Matrix<Float> {
    let arr = Array(repeating: rhs, count: lhs.values.count)
    let result = Matrix(rows: lhs.rows, columns: lhs.columns) { buffer in
        vDSP.subtract(lhs.values, arr, result: &buffer)
    }
    return result
}

public func - (lhs: Matrix<Double>, rhs: Double) -> Matrix<Double> {
    let arr = Array(repeating: rhs, count: lhs.values.count)
    let result = Matrix(rows: lhs.rows, columns: lhs.columns) { buffer in
        vDSP.subtract(lhs.values, arr, result: &buffer)
    }
    return result
}

public func - (lhs: Matrix<Float>, rhs: Matrix<Float>) -> Matrix<Float> {
    let result = Matrix(rows: rhs.rows, columns: rhs.columns) { buffer in
        vDSP.subtract(lhs.values, rhs.values, result: &buffer)
    }
    return result
}

public func - (lhs: Matrix<Double>, rhs: Matrix<Double>) -> Matrix<Double> {
    let result = Matrix(rows: rhs.rows, columns: rhs.columns) { buffer in
        vDSP.subtract(lhs.values, rhs.values, result: &buffer)
    }
    return result
}
