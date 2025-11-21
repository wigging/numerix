/*
Functions to swap vector and matrix values.
*/

/// Swap the values of two matrices.
///
/// In this example the scalar values in `mat1` are exchanged for the values in `mat2` and vice versa.
/// ```swift
/// var mat1 = Matrix<Float>([[2, 3, 4], [5, 6, 7]])
/// var mat2 = Matrix<Float>([[9, 8, 7], [10, 12, 13]])
/// swapValues(&mat1, &mat2)
/// ```
/// - Parameters:
///   - a: The first matrix.
///   - b: The second matrix.
public func swapValues<Scalar: MatrixAlgebra>(_ a: inout Matrix<Scalar>, _ b: inout Matrix<Scalar>) {
    Scalar.swapValues(a: &a, b: &b)
}

/// Swap the values of two vectors.
///
/// In this example the scalar values in `vec1` are exchanged for the values in `vec2` and vice versa.
/// ```swift
/// var vec1 = Vector<Float>([2, 3, 4, 5, 6])
/// var vec2 = Vector<Float>([9, 8, 7, 10, 12])
/// swapValues(&vec1, &vec2)
/// ```
/// - Parameters:
///   - a: The first vector.
///   - b: The second vector.
public func swapValues<Scalar: VectorAlgebra>(_ a: inout Vector<Scalar>, _ b: inout Vector<Scalar>) {
    Scalar.swapValues(a: &a, b: &b)
}
