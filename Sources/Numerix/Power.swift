/*
 Power functions for Vector and Matrix structures. Single and double precision
 operations are supported.
 */

import Accelerate

// MARK: Vector power

/// Raise each element in a single-precision vector to the power of the exponent.
/// - Parameters:
///   - vec: Vector of bases.
///   - exp: The exponent.
/// - Returns: Vector of bases raised to the power of the exponent.
public func pow(_ vec: Vector<Float>, _ exp: Float) -> Vector<Float> {
    var result = Vector<Float>(length: vec.length)
    let alpha = Array<Float>(repeating: exp, count: vec.length)
    vForce.pow(bases: vec.buffer, exponents: alpha, result: &result.buffer)
    return result
}

/// Raise each element in a double-precision vector to the power of the exponent.
/// - Parameters:
///   - vec: Vector of bases.
///   - exp: The exponent.
/// - Returns: Vector of bases raised to the power of the exponent.
public func pow(_ vec: Vector<Double>, _ exp: Double) -> Vector<Double> {
    var result = Vector<Double>(length: vec.length)
    let alpha = Array<Double>(repeating: exp, count: vec.length)
    vForce.pow(bases: vec.buffer, exponents: alpha, result: &result.buffer)
    return result
}

/// Raise each element in a single-precision vector to the power of each exponent.
/// - Parameters:
///   - vec: Vector of bases.
///   - exp: Array of exponents.
/// - Returns: Vector of bases raised to the power of each exponent.
public func pow(_ vec: Vector<Float>, _ exp: [Float]) -> Vector<Float> {
    precondition(vec.length == exp.count, "Vector length must correspond to number of exponents")
    var result = Vector<Float>(length: vec.length)
    vForce.pow(bases: vec.buffer, exponents: exp, result: &result.buffer)
    return result
}

/// Raise each element in a double-precision vector to the power of each exponent.
/// - Parameters:
///   - vec: Vector of bases.
///   - exp: Array of exponents.
/// - Returns: Vector of bases raised to the power of each exponent.
public func pow(_ vec: Vector<Double>, _ exp: [Double]) -> Vector<Double> {
    precondition(vec.length == exp.count, "Vector length must correspond to number of exponents")
    var result = Vector<Double>(length: vec.length)
    vForce.pow(bases: vec.buffer, exponents: exp, result: &result.buffer)
    return result
}

// MARK: Matrix power

/// Raise each element in a single-precision matrix to the power of the exponent.
/// - Parameters:
///   - vec: Matrix of bases.
///   - exp: The exponent.
/// - Returns: Matrix of bases raised to the power of the exponent.
public func pow(_ mat: Matrix<Float>, _ exp: Float) -> Matrix<Float> {
    var result = Matrix<Float>(rows: mat.rows, columns: mat.columns)
    let alpha = Array<Float>(repeating: exp, count: mat.count)
    vForce.pow(bases: mat.buffer, exponents: alpha, result: &result.buffer)
    return result
}

/// Raise each element in a double-precision matrix to the power of the exponent.
/// - Parameters:
///   - vec: Matrix of bases.
///   - exp: The exponent.
/// - Returns: Matrix of bases raised to the power of the exponent.
public func pow(_ mat: Matrix<Double>, _ exp: Double) -> Matrix<Double> {
    var result = Matrix<Double>(rows: mat.rows, columns: mat.columns)
    let alpha = Array<Double>(repeating: exp, count: mat.count)
    vForce.pow(bases: mat.buffer, exponents: alpha, result: &result.buffer)
    return result
}

/// Raise each element in a single-precision matrix to the power of each exponent.
/// - Parameters:
///   - vec: Matrix of bases.
///   - exp: Array of exponents.
/// - Returns: Matrix of bases raised to the power of each exponent.
public func pow(_ mat: Matrix<Float>, _ exp: [Float]) -> Matrix<Float> {
    precondition(mat.count == exp.count, "Matrix count must correspond to number of exponents")
    var result = Matrix<Float>(rows: mat.rows, columns: mat.columns)
    vForce.pow(bases: mat.buffer, exponents: exp, result: &result.buffer)
    return result
}

/// Raise each element in a double-precision matrix to the power of each exponent.
/// - Parameters:
///   - vec: Matrix of bases.
///   - exp: Array of exponents.
/// - Returns: Matrix of bases raised to the power of each exponent.
public func pow(_ mat: Matrix<Double>, _ exp: [Double]) -> Matrix<Double> {
    precondition(mat.count == exp.count, "Matrix count must correspond to number of exponents")
    var result = Matrix<Double>(rows: mat.rows, columns: mat.columns)
    vForce.pow(bases: mat.buffer, exponents: exp, result: &result.buffer)
    return result
}
