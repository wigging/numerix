//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 3/26/24.
//

import Accelerate

public struct Vector<T> {
    
    /// Scalar elements in the vector.
    public var values: [T]
    
    /// Number of elements in the vector.
    public var length: Int {
        values.count
    }
    
    /// Create a vector from an array of values.
    /// - Parameter values: Values of the vector.
    public init(_ values: [T]) {
        self.values = values
    }
    
    /// Create a vector of a certain length filled with the given value.
    /// - Parameters:
    ///   - length: Length of the vector.
    ///   - fill: Value to fill the vector.
    public init(length: Int, fill: T = 0.0) {
        self.values = [T](repeating: fill, count: length)
    }

    public subscript(item: Int) -> T {
        get { return values[item] }
        set { values[item] = newValue }
    }
}

// MARK: - Addition

extension Vector {
    
    /// Element-wise addition of two vectors with double precision. Vectors must be same length.
    /// - Parameters:
    ///   - lhs: Vector of length n.
    ///   - rhs: Vector of length n.
    /// - Returns: Vector of length n.
    public static func + (lhs: Vector, rhs: Vector) -> Vector where T == Double {
        precondition(lhs.length == rhs.length, "Vectors must be same length")
        let vec = vDSP.add(lhs.values, rhs.values)
        return Vector(vec)
    }
    
    /// Element-wise addition of two vectors with single precision. Vectors must be same length.
    /// - Parameters:
    ///   - lhs: Vector of length n.
    ///   - rhs: Vector of length n.
    /// - Returns: Vector of length n.
    public static func + (lhs: Vector, rhs: Vector) -> Vector where T == Float {
        precondition(lhs.length == rhs.length, "Vectors must be same length")
        let vec = vDSP.add(lhs.values, rhs.values)
        return Vector(vec)
    }
    
    /// Element-wise addition of a vector and a scalar with double precision.
    /// - Parameters:
    ///   - lhs: Vector of length n.
    ///   - rhs: Scalar value
    /// - Returns: Vector of length n.
    public static func + (lhs: Vector, rhs: T) -> Vector where T == Double {
        let vec = vDSP.add(rhs, lhs.values)
        return Vector(vec)
    }
    
    /// Element-wise addition of a vector and a scalar with single precision.
    /// - Parameters:
    ///   - lhs: Vector of length n.
    ///   - rhs: Scalar value
    /// - Returns: Vector of length n.
    public static func + (lhs: Vector, rhs: T) -> Vector where T == Float {
        let vec = vDSP.add(rhs, lhs.values)
        return Vector(vec)
    }
    
    /// Element-wise addition of a scalar and a vector with double precision.
    /// - Parameters:
    ///   - lhs: Scalar value.
    ///   - rhs: Vector of length n.
    /// - Returns: Vector of length n.
    public static func + (lhs: T, rhs: Vector) -> Vector where T == Double {
        let vec = vDSP.add(lhs, rhs.values)
        return Vector(vec)
    }

    /// Element-wise addition of a scalar and a vector with single precision.
    /// - Parameters:
    ///   - lhs: Scalar value.
    ///   - rhs: Vector of length n.
    /// - Returns: Vector of length n.
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
