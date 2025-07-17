/*
Matrix extension to conform to Arithmetic protocol.
*/

extension Matrix where Scalar: Arithmetic {

    /// Element-wise addition of a scalar value and matrix.
    /// - Parameters:
    ///   - lhs: The left-hand side scalar value.
    ///   - rhs: The right-hand side matrix.
    /// - Returns: Element-wise sum of a scalar value and matrix.
    public static func + (lhs: Scalar, rhs: Matrix) -> Matrix {
        Scalar.add(rhs, lhs)
    }

    public static func + (lhs: Matrix, rhs: Scalar) -> Matrix {
        Scalar.add(lhs, rhs)
    }

    public static func + (lhs: Matrix, rhs: Matrix) -> Matrix {
        Scalar.add(lhs, rhs)
    }

    public static func += (lhs: inout Matrix, rhs: Matrix) {
        lhs = lhs + rhs
    }

    public static func - (lhs: Scalar, rhs: Matrix) -> Matrix {
        Scalar.subtract(lhs, rhs)
    }

    public static func - (lhs: Matrix, rhs: Scalar) -> Matrix {
        Scalar.subtract(lhs, rhs)
    }

    public static func - (lhs: Matrix, rhs: Matrix) -> Matrix {
        Scalar.subtract(lhs, rhs)
    }

    /// Matrix multiplication of two matrices.
    /// - Parameters:
    ///   - lhs: The left-hand side matrix.
    ///   - rhs: The right-hand side matrix.
    /// - Returns: Matrix product of the two matrices.
    public static func * (lhs: Matrix, rhs: Matrix) -> Matrix {
        Scalar.matrixMultiply(lhs, rhs)
    }

    /// Element-wise multiplication of a scalar value and matrix.
    /// - Parameters:
    ///   - lhs: The left-hand side scalar value.
    ///   - rhs: The right-hand side matrix.
    /// - Returns: Element-wise product of a scalar value and matrix.
    public static func .* (lhs: Scalar, rhs: Matrix) -> Matrix {
        Scalar.multiply(rhs, lhs)
    }

    public static func .* (lhs: Matrix, rhs: Scalar) -> Matrix {
        Scalar.multiply(lhs, rhs)
    }

    public static func .* (lhs: Matrix, rhs: Matrix) -> Matrix {
        Scalar.multiply(lhs, rhs)
    }

    /// Element-wise matrix multiplication of two matrices.
    ///
    /// Matrices must have same dimensions m × n. This is also known as the Hadamard product or Schur product.
    ///
    /// - Parameters:
    ///   - lhs: Left matrix with dimension of m × n.
    ///   - rhs: Right matrix with dimension m × n.
    /// - Returns: Element-wise matrix product with same dimensions as input matrices.
    public static func ⊙ (lhs: Matrix, rhs: Matrix) -> Matrix {
        precondition(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrices must have same dimensions")
        return Scalar.multiply(lhs, rhs)
    }

    public static func / (lhs: Scalar, rhs: Matrix) -> Matrix {
        Scalar.divide(lhs, rhs)
    }

    public static func / (lhs: Matrix, rhs: Scalar) -> Matrix {
        Scalar.divide(lhs, rhs)
    }

    public static func / (lhs: Matrix, rhs: Matrix) -> Matrix {
        Scalar.divide(lhs, rhs)
    }
}
