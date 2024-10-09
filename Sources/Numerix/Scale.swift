/*
Scale a vector by a constant.
*/

import Accelerate

/// Scale a vector by a constant using single precision.
/// 
/// This function uses the BLAS `sscal` routine.
/// - Parameters:
///   - vec: The input vector.
///   - alpha: The scalar value to multiply by.
/// - Returns: A scaled vector.
public func scale(_ vec: Vector<Float>, by alpha: Float) -> Vector<Float> {
    let result = Vector<Float>(size: vec.size)
    cblas_scopy(vec.size, vec.buffer.baseAddress, 1, result.buffer.baseAddress, 1)
    cblas_sscal(vec.size, alpha, result.buffer.baseAddress, 1)
    return result
}

/// Scale a vector by a constant using double precision.
///
/// This function uses the BLAS `dscal` routine.
/// - Parameters:
///   - vec: The input vector.
///   - alpha: The scalar value to multiply by.
/// - Returns: A scaled vector.
public func scale(_ vec: Vector<Double>, by alpha: Double) -> Vector<Double> {
    let result = Vector<Double>(size: vec.size)
    cblas_dcopy(vec.size, vec.buffer.baseAddress, 1, result.buffer.baseAddress, 1)
    cblas_dscal(vec.size, alpha, result.buffer.baseAddress, 1)
    return result
}
