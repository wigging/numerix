//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 4/9/24.
//

import Accelerate

extension Vector {
    
    // MARK: Vector-Scalar subtraction

    public static func - (lhs: T, rhs: Vector) -> Vector where T == Double {
        let a = Array(repeating: lhs, count: rhs.values.count)
        let vec = vDSP.subtract(a, rhs.values)
        return Vector(vec)
    }

    public static func - (lhs: Vector, rhs: T) -> Vector where T == Double {
        let a = Array(repeating: rhs, count: lhs.values.count)
        let vec = vDSP.subtract(lhs.values, a)
        return Vector(vec)
    }

    public static func - (lhs: T, rhs: Vector) -> Vector where T == Float {
        let a = Array(repeating: lhs, count: rhs.values.count)
        let vec = vDSP.subtract(a, rhs.values)
        return Vector(vec)
    }

    public static func - (lhs: Vector, rhs: T) -> Vector where T == Float {
        let a = Array(repeating: rhs, count: lhs.values.count)
        let vec = vDSP.subtract(lhs.values, a)
        return Vector(vec)
    }

    // MARK: Vector-Vector subtraction
    
    public static func - (lhs: Vector, rhs: Vector) -> Vector where T == Double {
        precondition(lhs.values.count == rhs.values.count, "Vectors must be same length")
        let vec = vDSP.subtract(lhs.values, rhs.values)
        return Vector(vec)
    }

    public static func - (lhs: Vector, rhs: Vector) -> Vector where T == Float {
        precondition(lhs.values.count == rhs.values.count, "Vectors must be same length")
        let vec = vDSP.subtract(lhs.values, rhs.values)
        return Vector(vec)
    }
}
