import Accelerate

// MARK: Vector logarithm

/// Calculate the natural logarithm for each element in a single-precision vector.
/// ```swift
/// let vec = Vector<Float>([1, 2, 3, 4, 5])
/// let result = log(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: The output vector.
public func log(_ vec: Vector<Float>) -> Vector<Float> {
    var res = Vector<Float>(length: vec.length)
    vForce.log(vec.buffer, result: &res.buffer)
    return res
}

/// Calculate the natural logarithm for each element in a double-precision vector.
/// ```swift
/// let vec = Vector<Double>([1, 2, 3, 4, 5])
/// let result = log(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: The output vector.
public func log(_ vec: Vector<Double>) -> Vector<Double> {
    var res = Vector<Double>(length: vec.length)
    vForce.log(vec.buffer, result: &res.buffer)
    return res
}

/// Calculate log(1+x) for each element in a single-precision vector.
/// ```swift
/// let vec = Vector<Float>([1, 2, 3, 4, 5])
/// let result = log1p(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: The output vector.
public func log1p(_ vec: Vector<Float>) -> Vector<Float> {
    var res = Vector<Float>(length: vec.length)
    vForce.log1p(vec.buffer, result: &res.buffer)
    return res
}

/// Calculate log(1+x) for each element in a double-precision vector.
/// ```swift
/// let vec = Vector<Double>([1, 2, 3, 4, 5])
/// let result = log1p(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: The output vector.
public func log1p(_ vec: Vector<Double>) -> Vector<Double> {
    var res = Vector<Double>(length: vec.length)
    vForce.log1p(vec.buffer, result: &res.buffer)
    return res
}

/// Calculate the base 10 logarithm for each element in a single-precision vector.
/// ```swift
/// let vec = Vector<Float>([1, 2, 3, 4, 5])
/// let result = log10(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: The output vector.
public func log10(_ vec: Vector<Float>) -> Vector<Float> {
    var res = Vector<Float>(length: vec.length)
    vForce.log10(vec.buffer, result: &res.buffer)
    return res
}

/// Calculate the base 10 logarithm for each element in a double-precision vector.
/// ```swift
/// let vec = Vector<Double>([1, 2, 3, 4, 5])
/// let result = log10(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: The output vector.
public func log10(_ vec: Vector<Double>) -> Vector<Double> {
    var res = Vector<Double>(length: vec.length)
    vForce.log10(vec.buffer, result: &res.buffer)
    return res
}

/// Calculate the base 2 logarithm for each element in a single-precision vector.
/// ```swift
/// let vec = Vector<Float>([1, 2, 3, 4, 5])
/// let result = log2(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: The output vector.
public func log2(_ vec: Vector<Float>) -> Vector<Float> {
    var res = Vector<Float>(length: vec.length)
    vForce.log2(vec.buffer, result: &res.buffer)
    return res
}

/// Calculate the base 2 logarithm for each element in a double-precision vector.
/// ```swift
/// let vec = Vector<Double>([1, 2, 3, 4, 5])
/// let result = log2(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: The output vector.
public func log2(_ vec: Vector<Double>) -> Vector<Double> {
    var res = Vector<Double>(length: vec.length)
    vForce.log2(vec.buffer, result: &res.buffer)
    return res
}

/// Calculate the unbiased exponent for each element in a single-precision vector.
/// ```swift
/// let vec = Vector<Float>([1, 2, 3, 4, 5])
/// let result = logb(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: The output vector.
public func logb(_ vec: Vector<Float>) -> Vector<Float> {
    var res = Vector<Float>(length: vec.length)
    vForce.logb(vec.buffer, result: &res.buffer)
    return res
}

/// Calculate the unbiased exponent for each element in a double-precision vector.
/// ```swift
/// let vec = Vector<Double>([1, 2, 3, 4, 5])
/// let result = logb(vec)
/// ```
/// - Parameter vec: The input vector.
/// - Returns: The output vector.
public func logb(_ vec: Vector<Double>) -> Vector<Double> {
    var res = Vector<Double>(length: vec.length)
    vForce.logb(vec.buffer, result: &res.buffer)
    return res
}

// MARK: Matrix logarithm

/// Calculate the natural logarithm for each element in a single-precision matrix.
/// ```swift
/// let mat = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
/// let result = log(mat)
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: The output matrix.
public func log(_ mat: Matrix<Float>) -> Matrix<Float> {
    var res = Matrix<Float>(rows: mat.rows, columns: mat.columns)
    vForce.log(mat.buffer, result: &res.buffer)
    return res
}

/// Calculate the natural logarithm for each element in a double-precision matrix.
/// ```swift
/// let mat = Matrix<Double>([[1, 2, 3], [4, 5, 6]])
/// let result = log(mat)
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: The output matrix.
public func log(_ mat: Matrix<Double>) -> Matrix<Double> {
    var res = Matrix<Double>(rows: mat.rows, columns: mat.columns)
    vForce.log(mat.buffer, result: &res.buffer)
    return res
}

/// Calculate log(1+x) for each element in a single-precision matrix.
/// ```swift
/// let mat = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
/// let result = log1p(mat)
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: The output matrix.
public func log1p(_ mat: Matrix<Float>) -> Matrix<Float> {
    var res = Matrix<Float>(rows: mat.rows, columns: mat.columns)
    vForce.log1p(mat.buffer, result: &res.buffer)
    return res
}

/// Calculate log(1+x) for each element in a double-precision matrix.
/// ```swift
/// let mat = Matrix<Double>([[1, 2, 3], [4, 5, 6]])
/// let result = log1p(mat)
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: The output matrix.
public func log1p(_ mat: Matrix<Double>) -> Matrix<Double> {
    var res = Matrix<Double>(rows: mat.rows, columns: mat.columns)
    vForce.log1p(mat.buffer, result: &res.buffer)
    return res
}

/// Calculate the base 10 logarithm for each element in a single-precision matrix.
/// ```swift
/// let mat = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
/// let result = log10(mat)
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: The output matrix.
public func log10(_ mat: Matrix<Float>) -> Matrix<Float> {
    var res = Matrix<Float>(rows: mat.rows, columns: mat.columns)
    vForce.log10(mat.buffer, result: &res.buffer)
    return res
}

/// Calculate the base 10 logarithm for each element in a double-precision matrix.
/// ```swift
/// let mat = Matrix<Double>([[1, 2, 3], [4, 5, 6]])
/// let result = log10(mat)
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: The output matrix.
public func log10(_ mat: Matrix<Double>) -> Matrix<Double> {
    var res = Matrix<Double>(rows: mat.rows, columns: mat.columns)
    vForce.log10(mat.buffer, result: &res.buffer)
    return res
}

/// Calculate the base 2 logarithm for each element in a single-precision matrix.
/// ```swift
/// let mat = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
/// let result = log2(mat)
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: The output matrix.
public func log2(_ mat: Matrix<Float>) -> Matrix<Float> {
    var res = Matrix<Float>(rows: mat.rows, columns: mat.columns)
    vForce.log2(mat.buffer, result: &res.buffer)
    return res
}

/// Calculate the base 2 logarithm for each element in a double-precision matrix.
/// ```swift
/// let mat = Matrix<Double>([[1, 2, 3], [4, 5, 6]])
/// let result = log2(mat)
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: The output matrix.
public func log2(_ mat: Matrix<Double>) -> Matrix<Double> {
    var res = Matrix<Double>(rows: mat.rows, columns: mat.columns)
    vForce.log2(mat.buffer, result: &res.buffer)
    return res
}

/// Calculate the unbiased exponent for each element in a single-precision matrix.
/// ```swift
/// let mat = Matrix<Float>([[1, 2, 3], [4, 5, 6]])
/// let result = logb(mat)
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: The output matrix.
public func logb(_ mat: Matrix<Float>) -> Matrix<Float> {
    var res = Matrix<Float>(rows: mat.rows, columns: mat.columns)
    vForce.logb(mat.buffer, result: &res.buffer)
    return res
}

/// Calculate the unbiased exponent for each element in a double-precision matrix.
/// ```swift
/// let mat = Matrix<Double>([[1, 2, 3], [4, 5, 6]])
/// let result = logb(mat)
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: The output matrix.
public func logb(_ mat: Matrix<Double>) -> Matrix<Double> {
    var res = Matrix<Double>(rows: mat.rows, columns: mat.columns)
    vForce.logb(mat.buffer, result: &res.buffer)
    return res
}

// MARK: ShapedArray logarithm

/// Calculate the natural logarithm for each element in a single-precision shaped array.
/// ```swift
/// let array = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
/// let result = log(array)
/// ```
/// - Parameter array: The input as a shaped array.
/// - Returns: A shaped array that is element-wise natural logarithm of the input.
public func log(_ array: ShapedArray<Float>) -> ShapedArray<Float> {
    var result = ShapedArray<Float>(shape: array.shape)
    vForce.log(array.buffer, result: &result.buffer)
    return result
}

/// Calculate the natural logarithm for each element in a double-precision shaped array.
/// ```swift
/// let array = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
/// let result = log(array)
/// ```
/// - Parameter array: The input as a shaped array.
/// - Returns: A shaped array that is element-wise natural logarithm of the input.
public func log(_ array: ShapedArray<Double>) -> ShapedArray<Double> {
    var result = ShapedArray<Double>(shape: array.shape)
    vForce.log(array.buffer, result: &result.buffer)
    return result
}

/// Calculate log(1+x) for each element in a single-precision shaped array.
/// ```swift
/// let array = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
/// let result = log1p(array)
/// ```
/// - Parameter array: The input as a shaped array.
/// - Returns: A shaped array that is element-wise `log(1+x)` of the input.
public func log1p(_ array: ShapedArray<Float>) -> ShapedArray<Float> {
    var result = ShapedArray<Float>(shape: array.shape)
    vForce.log1p(array.buffer, result: &result.buffer)
    return result
}

/// Calculate log(1+x) for each element in a double-precision shaped array.
/// ```swift
/// let array = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
/// let result = log1p(array)
/// ```
/// - Parameter array: The input as a shaped array.
/// - Returns: A shaped array that is element-wise `log(1+x)` of the input.
public func log1p(_ array: ShapedArray<Double>) -> ShapedArray<Double> {
    var result = ShapedArray<Double>(shape: array.shape)
    vForce.log1p(array.buffer, result: &result.buffer)
    return result
}

/// Calculate the base 10 logarithm for each element in a single-precision shaped array.
/// ```swift
/// let array = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
/// let result = log10(array)
/// ```
/// - Parameter array: The input shaped array.
/// - Returns: A shaped array as the element-wise base 10 logarithm of the input.
public func log10(_ array: ShapedArray<Float>) -> ShapedArray<Float> {
    var result = ShapedArray<Float>(shape: array.shape)
    vForce.log10(array.buffer, result: &result.buffer)
    return result
}

/// Calculate the base 10 logarithm for each element in a double-precision shaped array.
/// ```swift
/// let array = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
/// let result = log10(array)
/// ```
/// - Parameter array: The input shaped array.
/// - Returns: A shaped array as the element-wise base 10 logarithm of the input.
public func log10(_ array: ShapedArray<Double>) -> ShapedArray<Double> {
    var result = ShapedArray<Double>(shape: array.shape)
    vForce.log10(array.buffer, result: &result.buffer)
    return result
}

/// Calculate the base 2 logarithm for each element in a single-precision shaped array.
/// ```swift
/// let array = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
/// let result = log2(array)
/// ```
/// - Parameter array: The input shaped array.
/// - Returns: A shaped array that is the element-wise log2 of the input.
public func log2(_ array: ShapedArray<Float>) -> ShapedArray<Float> {
    var result = ShapedArray<Float>(shape: array.shape)
    vForce.log2(array.buffer, result: &result.buffer)
    return result
}

/// Calculate the base 2 logarithm for each element in a double-precision shaped array.
/// ```swift
/// let array = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
/// let result = log2(array)
/// ```
/// - Parameter array: The input shaped array.
/// - Returns: A shaped array that is the element-wise log2 of the input.
public func log2(_ array: ShapedArray<Double>) -> ShapedArray<Double> {
    var result = ShapedArray<Double>(shape: array.shape)
    vForce.log2(array.buffer, result: &result.buffer)
    return result
}

/// Calculate the unbiased exponent for each element in a single-precision shaped array.
/// ```swift
/// let array = ShapedArray<Float>([[1, 2, 3], [4, 5, 6]])
/// let result = logb(array)
/// ```
/// - Parameter array: The input shaped array.
/// - Returns: A shaped array that is the element-wise logb of the input.
public func logb(_ array: ShapedArray<Float>) -> ShapedArray<Float> {
    var result = ShapedArray<Float>(shape: array.shape)
    vForce.logb(array.buffer, result: &result.buffer)
    return result
}

/// Calculate the unbiased exponent for each element in a double-precision shaped array.
/// ```swift
/// let array = ShapedArray<Double>([[1, 2, 3], [4, 5, 6]])
/// let result = logb(array)
/// ```
/// - Parameter array: The input shaped array.
/// - Returns: A shaped array that is the element-wise logb of the input.
public func logb(_ array: ShapedArray<Double>) -> ShapedArray<Double> {
    var result = ShapedArray<Double>(shape: array.shape)
    vForce.logb(array.buffer, result: &result.buffer)
    return result
}
