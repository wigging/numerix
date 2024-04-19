//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 4/5/24.
//

import Accelerate

extension Vector {

    // MARK: Vector-Vector addition

    public static func + (lhs: Vector, rhs: Vector) -> Vector where T == Double {
        precondition(lhs.values.count == rhs.values.count, "Vectors must be same length")
        let vec = vDSP.add(lhs.values, rhs.values)
        return Vector(vec)
    }

    public static func + (lhs: Vector, rhs: Vector) -> Vector where T == Float {
        precondition(lhs.values.count == rhs.values.count, "Vectors must be same length")
        let vec = vDSP.add(lhs.values, rhs.values)
        return Vector(vec)
    }

    // MARK: Vector-Scalar addition

    public static func + (lhs: Vector, rhs: T) -> Vector where T == Double {
        let vec = vDSP.add(rhs, lhs.values)
        return Vector(vec)
    }

    public static func + (lhs: T, rhs: Vector) -> Vector where T == Double {
        let vec = vDSP.add(lhs, rhs.values)
        return Vector(vec)
    }

    public static func + (lhs: Vector, rhs: T) -> Vector where T == Float {
        let vec = vDSP.add(rhs, lhs.values)
        return Vector(vec)
    }

    public static func + (lhs: T, rhs: Vector) -> Vector where T == Float {
        let vec = vDSP.add(lhs, rhs.values)
        return Vector(vec)
    }
}
