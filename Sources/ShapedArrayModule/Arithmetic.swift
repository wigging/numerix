/*
Arithmetic protocol and extensions for the ShapedArray struct.
*/

import Accelerate

public protocol Arithmetic {
    static func add(_ a: ShapedArray<Self>, _ k: Self) -> ShapedArray<Self>
    static func add(_ a: ShapedArray<Self>, _ b: ShapedArray<Self>) -> ShapedArray<Self>
    static func subtract(_ k: Self, _ a: ShapedArray<Self>) -> ShapedArray<Self>
    static func subtract(_ a: ShapedArray<Self>, _ k: Self) -> ShapedArray<Self>
    static func subtract(_ a: ShapedArray<Self>, _ b: ShapedArray<Self>) -> ShapedArray<Self>
    static func multiply(_ a: ShapedArray<Self>, _ k: Self) -> ShapedArray<Self>
    static func multiply(_ a: ShapedArray<Self>, _ b: ShapedArray<Self>) -> ShapedArray<Self>
    static func divide(_ k: Self, _ b: ShapedArray<Self>) -> ShapedArray<Self>
    static func divide(_ a: ShapedArray<Self>, _ k: Self) -> ShapedArray<Self>
    static func divide(_ a: ShapedArray<Self>, _ b: ShapedArray<Self>) -> ShapedArray<Self>
}

extension Int: Arithmetic {

    public static func add(_ a: ShapedArray<Int>, _ k: Int) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = k &+ a.buffer[i]
        }
        return arr
    }

    public static func add(_ a: ShapedArray<Int>, _ b: ShapedArray<Int>) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = a.buffer[i] &+ b.buffer[i]
        }
        return arr
    }

    public static func subtract(_ k: Int, _ b: ShapedArray<Int>) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: b.shape)
        let count = b.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = k &- b.buffer[i]
        }
        return arr
    }

    public static func subtract(_ a: ShapedArray<Int>, _ k: Int) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = a.buffer[i] &- k
        }
        return arr
    }

    public static func subtract(_ a: ShapedArray<Int>, _ b: ShapedArray<Int>) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = a.buffer[i] &- b.buffer[i]
        }
        return arr
    }

    public static func multiply(_ a: ShapedArray<Int>, _ k: Int) -> ShapedArray<Int> {
        let array = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            array.buffer[i] = k &* a.buffer[i]
        }
        return array
    }

    public static func multiply(_ a: ShapedArray<Int>, _ b: ShapedArray<Int>) -> ShapedArray<Int> {
        let array = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            array.buffer[i] = a.buffer[i] &* b.buffer[i]
        }
        return array
    }

    public static func divide(_ k: Int, _ b: ShapedArray<Int>) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: b.shape)
        let count = b.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = k / b.buffer[i]
        }
        return arr
    }

    public static func divide(_ a: ShapedArray<Int>, _ k: Int) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = a.buffer[i] / k
        }
        return arr
    }

    public static func divide(_ a: ShapedArray<Int>, _ b: ShapedArray<Int>) -> ShapedArray<Int> {
        let arr = ShapedArray<Int>(shape: a.shape)
        let count = a.shape.reduce(1, *)
        for i in 0..<count {
            arr.buffer[i] = a.buffer[i] / b.buffer[i]
        }
        return arr
    }
}

extension Float: Arithmetic {

    public static func add(_ a: ShapedArray<Float>, _ k: Float) -> ShapedArray<Float> {
        var arr = ShapedArray<Float>(shape: a.shape)
        vDSP.add(k, a.buffer, result: &arr.buffer)
        return arr
    }
    
    public static func add(_ a: ShapedArray<Float>, _ b: ShapedArray<Float>) -> ShapedArray<Float> {
        var arr = ShapedArray<Float>(shape: a.shape)
        vDSP.add(a.buffer, b.buffer, result: &arr.buffer)
        return arr
    }
    
    public static func subtract(_ k: Float, _ a: ShapedArray<Float>) -> ShapedArray<Float> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var result = ShapedArray<Float>(shape: a.shape)
        vDSP.subtract(arr, a.buffer, result: &result.buffer)
        return result
    }
    
    public static func subtract(_ a: ShapedArray<Float>, _ k: Float) -> ShapedArray<Float> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var result = ShapedArray<Float>(shape: a.shape)
        vDSP.subtract(arr, a.buffer, result: &result.buffer)
        return result
    }
    
    public static func subtract(_ a: ShapedArray<Float>, _ b: ShapedArray<Float>) -> ShapedArray<Float> {
        precondition(a.shape == b.shape, "Shaped arrays must have same shape")
        var result = ShapedArray<Float>(shape: a.shape)
        vDSP.subtract(a.buffer, b.buffer, result: &result.buffer)
        return result
    }
    
    public static func multiply(_ a: ShapedArray<Float>, _ k: Float) -> ShapedArray<Float> {
        var array = ShapedArray<Float>(shape: a.shape)
        vDSP.multiply(k, a.buffer, result: &array.buffer)
        return array
    }
    
    public static func multiply(_ a: ShapedArray<Float>, _ b: ShapedArray<Float>) -> ShapedArray<Float> {
        var array = ShapedArray<Float>(shape: a.shape)
        vDSP.multiply(a.buffer, b.buffer, result: &array.buffer)
        return array
    }
    
    public static func divide(_ k: Float, _ b: ShapedArray<Float>) -> ShapedArray<Float> {
        var arr = ShapedArray<Float>(shape: b.shape)
        vDSP.divide(k, b.buffer, result: &arr.buffer)
        return arr
    }
    
    public static func divide(_ a: ShapedArray<Float>, _ k: Float) -> ShapedArray<Float> {
        var arr = ShapedArray<Float>(shape: a.shape)
        vDSP.divide(a.buffer, k, result: &arr.buffer)
        return arr
    }
    
    public static func divide(_ a: ShapedArray<Float>, _ b: ShapedArray<Float>) -> ShapedArray<Float> {
        var arr = ShapedArray<Float>(shape: a.shape)
        vDSP.divide(a.buffer, b.buffer, result: &arr.buffer)
        return arr
    }
}

extension Double: Arithmetic {

    public static func add(_ a: ShapedArray<Double>, _ k: Double) -> ShapedArray<Double> {
        var arr = ShapedArray<Double>(shape: a.shape)
        vDSP.add(k, a.buffer, result: &arr.buffer)
        return arr
    }

    public static func add(_ a: ShapedArray<Double>, _ b: ShapedArray<Double>) -> ShapedArray<Double> {
        var arr = ShapedArray<Double>(shape: a.shape)
        vDSP.add(a.buffer, b.buffer, result: &arr.buffer)
        return arr
    }

    public static func subtract(_ k: Double, _ a: ShapedArray<Double>) -> ShapedArray<Double> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var result = ShapedArray<Double>(shape: a.shape)
        vDSP.subtract(arr, a.buffer, result: &result.buffer)
        return result
    }

    public static func subtract(_ a: ShapedArray<Double>, _ k: Double) -> ShapedArray<Double> {
        let arr = Array(repeating: k, count: a.buffer.count)
        var result = ShapedArray<Double>(shape: a.shape)
        vDSP.subtract(arr, a.buffer, result: &result.buffer)
        return result
    }

    public static func subtract(_ a: ShapedArray<Double>, _ b: ShapedArray<Double>) -> ShapedArray<Double> {
        precondition(a.shape == b.shape, "Shaped arrays must have same shape")
        var result = ShapedArray<Double>(shape: a.shape)
        vDSP.subtract(a.buffer, b.buffer, result: &result.buffer)
        return result
    }

    public static func multiply(_ a: ShapedArray<Double>, _ k: Double) -> ShapedArray<Double> {
        var array = ShapedArray<Double>(shape: a.shape)
        vDSP.multiply(k, a.buffer, result: &array.buffer)
        return array
    }

    public static func multiply(_ a: ShapedArray<Double>, _ b: ShapedArray<Double>) -> ShapedArray<Double> {
        var array = ShapedArray<Double>(shape: a.shape)
        vDSP.multiply(a.buffer, b.buffer, result: &array.buffer)
        return array
    }

    public static func divide(_ k: Double, _ b: ShapedArray<Double>) -> ShapedArray<Double> {
        var arr = ShapedArray<Double>(shape: b.shape)
        vDSP.divide(k, b.buffer, result: &arr.buffer)
        return arr
    }

    public static func divide(_ a: ShapedArray<Double>, _ k: Double) -> ShapedArray<Double> {
        var arr = ShapedArray<Double>(shape: a.shape)
        vDSP.divide(a.buffer, k, result: &arr.buffer)
        return arr
    }

    public static func divide(_ a: ShapedArray<Double>, _ b: ShapedArray<Double>) -> ShapedArray<Double> {
        var arr = ShapedArray<Double>(shape: a.shape)
        vDSP.divide(a.buffer, b.buffer, result: &arr.buffer)
        return arr
    }
}

extension ShapedArray where Scalar: Arithmetic {

    /// Element-wise addition of a scalar and shaped array.
    /// - Parameters:
    ///   - left: The left-hand side scalar value `k`.
    ///   - right: The right-hand side shaped array `A`.
    /// - Returns: A shaped array that is the result of `k + A`.
    public static func + (lhs: Scalar, rhs: ShapedArray) -> ShapedArray {
        Scalar.add(rhs, lhs)
    }

    /// Element-wise addition of a scalar and shaped array.
    /// - Parameters:
    ///   - left: The left-hand side shaped array `A`.
    ///   - right: The right-hand side scalar value `k`.
    /// - Returns: A shaped array that is the result of `A + k`.
    public static func + (lhs: ShapedArray, rhs: Scalar) -> ShapedArray {
        Scalar.add(lhs, rhs)
    }

    /// Element-wise addition of two shaped arrays.
    /// - Parameters:
    ///   - left: The left-hand side shaped array `A`.
    ///   - right: The right-hand side shaped array `B`.
    /// - Returns: A shaped array that is the result of `A + B`.
    public static func + (lhs: ShapedArray, rhs: ShapedArray) -> ShapedArray {
        Scalar.add(lhs, rhs)
    }

    /// In-place element-wise addition of a shaped array and scalar.
    /// - Parameters:
    ///   - left: The left-hand side mutable shaped array.
    ///   - right: The right-hand side scalar value.
    public static func += (left: inout ShapedArray, right: Scalar) {
        left = left + right
    }

    /// In-place element-wise addition of two shaped arrays.
    /// - Parameters:
    ///   - left: The left-hand side mutable input shaped array.
    ///   - right: The right-hand side shaped array to add to the left-hand side mutable shaped array.
    public static func += (left: inout ShapedArray, right: ShapedArray) {
        precondition(left.shape == right.shape, "Shaped arrays must have same shape")
        left = left + right
    }

    /// Element-wise subtraction of a scalar and shaped array.
    /// - Parameters:
    ///   - left: The left-hand side scalar value `k`.
    ///   - right: The right-hand side shaped array `A`.
    /// - Returns: A shaped array that is the result of `k - A`.
    public static func - (lhs: Scalar, rhs: ShapedArray) -> ShapedArray {
        Scalar.subtract(lhs, rhs)
    }

    /// Element-wise subtraction of a scalar and shaped array.
    /// - Parameters:
    ///   - left: The left-hand side shaped array `A`.
    ///   - right: The right-hand side scalar value `k`.
    /// - Returns: A shaped array that is the result of `A - k`.
    public static func - (lhs: ShapedArray, rhs: Scalar) -> ShapedArray {
        Scalar.subtract(lhs, rhs)
    }

    /// Element-wise subtraction of two shaped arrays.
    /// - Parameters:
    ///   - lhs: The left-hand side shaped array `A`.
    ///   - rhs: The right-hand side shaped array `B`.
    /// - Returns: A shaped array that is the result of `A + B`.
    public static func - (lhs: ShapedArray, rhs: ShapedArray) -> ShapedArray {
        Scalar.subtract(lhs, rhs)
    }

    /// Element-wise multiplication of a scalar value and a shaped array.
    /// - Parameters:
    ///   - lhs: The input scalar value `k` on the left-hand side.
    ///   - rhs: The input shaped array `A` on the right-hand side.
    /// - Returns: The output shaped array `B` where `k * A = B`.
    public static func * (lhs: Scalar, rhs: ShapedArray) -> ShapedArray {
        Scalar.multiply(rhs, lhs)
    }

    /// Element-wise multiplication of a shaped array and a scalar value.
    /// - Parameters:
    ///   - lhs: The input shaped array `A` on the left-hand side.
    ///   - rhs: The input scalar value `k` on the right-hand side.
    /// - Returns: The output shaped array `B` where `k * A = B`.
    public static func * (lhs: ShapedArray, rhs: Scalar) -> ShapedArray {
        Scalar.multiply(lhs, rhs)
    }

    /// Element-wise multiplication of two shaped arrays.
    /// - Parameters:
    ///   - lhs: The input shaped array `A` on the left-hand side.
    ///   - rhs: The input shaped array `B` on the right-hand side.
    /// - Returns: The output shaped array `C` where `A * B = C`.
    public static func * (lhs: ShapedArray, rhs: ShapedArray) -> ShapedArray {
        Scalar.multiply(lhs, rhs)
    }

    /// Element-wise division operator for dividing a scalar by a shaped array.
    /// - Parameters:
    ///   - lhs: The scalar value.
    ///   - rhs: The shaped array.
    /// - Returns: The element-wise division of a scalar by a shaped array.
    public static func / (lhs: Scalar, rhs: ShapedArray) -> ShapedArray {
        Scalar.divide(lhs, rhs)
    }

    /// Element-wise division operator for dividing a scalar by a shaped array.
    /// - Parameters:
    ///   - lhs: The shaped array.
    ///   - rhs: The scalar value.
    /// - Returns: The element-wise division of a scalar by a shaped array.
    public static func / (lhs: ShapedArray, rhs: Scalar) -> ShapedArray {
        Scalar.divide(lhs, rhs)
    }

    /// Element-wise division operator for dividing two shaped arrays. Shaped
    /// arrays must have the same shape.
    /// - Parameters:
    ///   - lhs: The left shaped array.
    ///   - rhs: The right shaped array.
    /// - Returns: The element-wise division of two shaped arrays.
    public static func / (lhs: ShapedArray, rhs: ShapedArray) -> ShapedArray {
        Scalar.divide(lhs, rhs)
    }

    /// In-place element-wise division of a shaped array and scalar.
    /// - Parameters:
    ///   - lhs: The left-hand side mutable shaped array.
    ///   - rhs: The right-hand side scalar value.
    public static func /= (lhs: inout ShapedArray, rhs: Scalar) {
        lhs = lhs / rhs
    }

    /// In-place element-wise division of two shaped arrays.
    /// - Parameters:
    ///   - lhs: The left-hand side mutable shaped array.
    ///   - rhs: The right-hand side shaped array.
    public static func /= (lhs: inout ShapedArray, rhs: ShapedArray) {
        precondition(lhs.shape == rhs.shape, "Shaped arrays must have the same shape")
        lhs = lhs / rhs
    }
}
