//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 3/26/24.
//

import Accelerate

public struct Vector<T: FloatingPoint> {

    public var values: [T]

    public init(_ values: [T]) {
        self.values = values
    }

    public init(size: Int, fill: T = 0.0) {
        self.values = [T](repeating: fill, count: size)
    }

    public subscript(item: Int) -> T {
        get { return values[item] }
        set { values[item] = newValue }
    }
}

// MARK: - Addition

extension Vector {

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

// MARK: - Subtraction

extension Vector {

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

// MARK: - Multiplication

extension Vector {

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

    public static func * (lhs: Vector, rhs: Vector) -> Vector where T == Double {
        let vec = vDSP.multiply(lhs.values, rhs.values)
        return Vector(vec)
    }

    public static func * (lhs: Vector, rhs: Vector) -> Vector where T == Float {
        let vec = vDSP.multiply(lhs.values, rhs.values)
        return Vector(vec)
    }
}

// MARK: - Division
