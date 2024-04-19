//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 4/18/24.
//

import Accelerate

extension Vector {

    // MARK: Vector-scalar multiplication

    public static func * (lhs: T, rhs: Vector) -> Vector where T == Double {
        let vec = vDSP.multiply(lhs, rhs.values)
        return Vector(vec)
    }

    public static func * (lhs: Vector, rhs: T) -> Vector where T == Double {
        let vec = vDSP.multiply(rhs, lhs.values)
        return Vector(vec)
    }

    public static func * (lhs: T, rhs: Vector) -> Vector where T == Float {
        let vec = vDSP.multiply(lhs, rhs.values)
        return Vector(vec)
    }

    public static func * (lhs: Vector, rhs: T) -> Vector where T == Float {
        let vec = vDSP.multiply(rhs, lhs.values)
        return Vector(vec)
    }

    // MARK: Vector-vector multiplication

    public static func * (lhs: Vector, rhs: Vector) -> Vector where T == Double {
        let vec = vDSP.multiply(lhs.values, rhs.values)
        return Vector(vec)
    }

    public static func * (lhs: Vector, rhs: Vector) -> Vector where T == Float {
        let vec = vDSP.multiply(lhs.values, rhs.values)
        return Vector(vec)
    }
}
