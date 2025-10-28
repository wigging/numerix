/*
Trigonometry functions for Matrix.
*/

/// Calculate the sine of each element in a matrix.
/// ```swift
/// let mat: Matrix<Float> = [[1, 2], [3, 4]]
/// let result = sin(mat))
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: A matrix representing the sine of the input matrix.
public func sin<Scalar>(_ mat: Matrix<Scalar>) -> Matrix<Scalar> where Scalar: Trigonometry {
    Scalar.sin(mat)
}

/// Calculate the cosine of each element in a matrix.
/// ```swift
/// let mat: Matrix<Float> = [[1, 2], [3, 4]]
/// let result = cos(mat))
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: A matrix representing the cosine of the input matrix.
public func cos<Scalar>(_ mat: Matrix<Scalar>) -> Matrix<Scalar> where Scalar: Trigonometry {
    Scalar.cos(mat)
}

/// Calculate the tangent of each element in a matrix.
/// ```swift
/// let mat: Matrix<Float> = [[1, 2], [3, 4]]
/// let result = tan(mat))
/// ```
/// - Parameter mat: The input matrix.
/// - Returns: A matrix representing the tangent of the input matrix.
public func tan<Scalar>(_ mat: Matrix<Scalar>) -> Matrix<Scalar> where Scalar: Trigonometry {
    Scalar.tan(mat)
}
