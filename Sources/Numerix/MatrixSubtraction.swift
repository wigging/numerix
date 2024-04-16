//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 4/15/24.
//

import Accelerate

extension Matrix {

    // MARK: Matrix-Scalar subtraction

    public static func - (lhs: T, rhs: Matrix) -> Matrix where T == Double {
        let arr = Array(repeating: lhs, count: rhs.values.count)
        let vec = vDSP.subtract(arr, rhs.values)
        return Matrix(rows: rhs.rows, columns: rhs.columns, values: vec)
    }

    public static func - (lhs: Matrix, rhs: T) -> Matrix where T == Double {
        let arr = Array(repeating: rhs, count: lhs.values.count)
        let vec = vDSP.subtract(lhs.values, arr)
        return Matrix(rows: lhs.rows, columns: lhs.columns, values: vec)
    }

    public static func - (lhs: T, rhs: Matrix) -> Matrix where T == Float {
        let arr = Array(repeating: lhs, count: rhs.values.count)
        let vec = vDSP.subtract(arr, rhs.values)
        return Matrix(rows: rhs.rows, columns: rhs.columns, values: vec)
    }

    public static func - (lhs: Matrix, rhs: T) -> Matrix where T == Float {
        let arr = Array(repeating: rhs, count: lhs.values.count)
        let vec = vDSP.subtract(lhs.values, arr)
        return Matrix(rows: lhs.rows, columns: lhs.columns, values: vec)
    }

    // MARK: Matrix-Matrix subtraction

    public static func - (lhs: Matrix, rhs: Matrix) -> Matrix where T == Double {
        let vec = vDSP.subtract(lhs.values, rhs.values)
        return Matrix(rows: rhs.rows, columns: rhs.columns, values: vec)
    }

    public static func - (lhs: Matrix, rhs: Matrix) -> Matrix where T == Float {
        let vec = vDSP.subtract(lhs.values, rhs.values)
        return Matrix(rows: rhs.rows, columns: rhs.columns, values: vec)
    }
}
