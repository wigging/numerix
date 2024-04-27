//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 4/15/24.
//

import Accelerate

/// Calculate the L² norm, also known as Euclidean norm, of a vector with double precision.
/// - Parameter vec: The input vector.
/// - Returns: The norm of the input vector.
public func norm(_ vec: Vector<Double>) -> Double {
    let x = vec.values
    let n = x.count
    let incx = 1
    let nrm = cblas_dnrm2(n, x, incx)
    return nrm
}

/// Calculate the L² norm, also known as Euclidean norm, of a vector with single precision.
/// - Parameter vec: The input vector.
/// - Returns: The norm of the input vector.
public func norm(_ vec: Vector<Float>) -> Float {
    let x = vec.values
    let n = x.count
    let incx = 1
    let nrm = cblas_snrm2(n, x, incx)
    return nrm
}

/// Calculate the L² norm, also known as Euclidean norm, of a matrix with double precision.
/// - Parameter mat: The input matrix.
/// - Returns: The norm of the input matrix.
public func norm(_ mat: Matrix<Double>) -> Double {
    let x = mat.values
    let n = x.count
    let incx = 1
    let nrm = cblas_dnrm2(n, x, incx)
    return nrm
}

/// Calculate the L² norm, also known as Euclidean norm, of a matrix with double precision.
/// - Parameter mat: The input matrix.
/// - Returns: The norm of the input matrix.
public func norm(_ mat: Matrix<Float>) -> Float {
    let x = mat.values
    let n = x.count
    let incx = 1
    let nrm = cblas_snrm2(n, x, incx)
    return nrm
}
