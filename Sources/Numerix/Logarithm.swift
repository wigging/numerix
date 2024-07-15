/*
 Logarithmic functions for Vector and Matrix structures. Single and double
 precision operations are supported.
 */

import Accelerate

// MARK: Vector logarithm

public func log(_ vec: Vector<Float>) -> Vector<Float> {
    var res = Vector<Float>(length: vec.length)
    vForce.log(vec.buffer, result: &res.buffer)
    return res
}

public func log(_ vec: Vector<Double>) -> Vector<Double> {
    var res = Vector<Double>(length: vec.length)
    vForce.log(vec.buffer, result: &res.buffer)
    return res
}

public func log1p(_ vec: Vector<Float>) -> Vector<Float> {
    var res = Vector<Float>(length: vec.length)
    vForce.log1p(vec.buffer, result: &res.buffer)
    return res
}

public func log1p(_ vec: Vector<Double>) -> Vector<Double> {
    var res = Vector<Double>(length: vec.length)
    vForce.log1p(vec.buffer, result: &res.buffer)
    return res
}

public func log10(_ vec: Vector<Float>) -> Vector<Float> {
    var res = Vector<Float>(length: vec.length)
    vForce.log10(vec.buffer, result: &res.buffer)
    return res
}

public func log10(_ vec: Vector<Double>) -> Vector<Double> {
    var res = Vector<Double>(length: vec.length)
    vForce.log10(vec.buffer, result: &res.buffer)
    return res
}

public func log2(_ vec: Vector<Float>) -> Vector<Float> {
    var res = Vector<Float>(length: vec.length)
    vForce.log2(vec.buffer, result: &res.buffer)
    return res
}

public func log2(_ vec: Vector<Double>) -> Vector<Double> {
    var res = Vector<Double>(length: vec.length)
    vForce.log2(vec.buffer, result: &res.buffer)
    return res
}

public func logb(_ vec: Vector<Float>) -> Vector<Float> {
    var res = Vector<Float>(length: vec.length)
    vForce.logb(vec.buffer, result: &res.buffer)
    return res
}

public func logb(_ vec: Vector<Double>) -> Vector<Double> {
    var res = Vector<Double>(length: vec.length)
    vForce.logb(vec.buffer, result: &res.buffer)
    return res
}

// MARK: Matrix logarithm

public func log(_ mat: Matrix<Float>) -> Matrix<Float> {
    var res = Matrix<Float>(rows: mat.rows, columns: mat.columns)
    vForce.log(mat.buffer, result: &res.buffer)
    return res
}

public func log(_ mat: Matrix<Double>) -> Matrix<Double> {
    var res = Matrix<Double>(rows: mat.rows, columns: mat.columns)
    vForce.log(mat.buffer, result: &res.buffer)
    return res
}

public func log1p(_ mat: Matrix<Float>) -> Matrix<Float> {
    var res = Matrix<Float>(rows: mat.rows, columns: mat.columns)
    vForce.log1p(mat.buffer, result: &res.buffer)
    return res
}

public func log1p(_ mat: Matrix<Double>) -> Matrix<Double> {
    var res = Matrix<Double>(rows: mat.rows, columns: mat.columns)
    vForce.log1p(mat.buffer, result: &res.buffer)
    return res
}

public func log10(_ mat: Matrix<Float>) -> Matrix<Float> {
    var res = Matrix<Float>(rows: mat.rows, columns: mat.columns)
    vForce.log10(mat.buffer, result: &res.buffer)
    return res
}

public func log10(_ mat: Matrix<Double>) -> Matrix<Double> {
    var res = Matrix<Double>(rows: mat.rows, columns: mat.columns)
    vForce.log10(mat.buffer, result: &res.buffer)
    return res
}

public func log2(_ mat: Matrix<Float>) -> Matrix<Float> {
    var res = Matrix<Float>(rows: mat.rows, columns: mat.columns)
    vForce.log2(mat.buffer, result: &res.buffer)
    return res
}

public func log2(_ mat: Matrix<Double>) -> Matrix<Double> {
    var res = Matrix<Double>(rows: mat.rows, columns: mat.columns)
    vForce.log2(mat.buffer, result: &res.buffer)
    return res
}

public func logb(_ mat: Matrix<Float>) -> Matrix<Float> {
    var res = Matrix<Float>(rows: mat.rows, columns: mat.columns)
    vForce.logb(mat.buffer, result: &res.buffer)
    return res
}

public func logb(_ mat: Matrix<Double>) -> Matrix<Double> {
    var res = Matrix<Double>(rows: mat.rows, columns: mat.columns)
    vForce.logb(mat.buffer, result: &res.buffer)
    return res
}
