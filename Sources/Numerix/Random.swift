/*
 Extensions for the Matrix structure to generate a matrix containing random
 numbers. Single and double precision values are supported.
 */

import Accelerate

extension Matrix where T == Float {

    /// Create a Matrix containing random values with single precision.
    /// - Parameters:
    ///   - rows: Number of rows.
    ///   - columns: Number of columns.
    ///   - dist: Specify the distribution of the random numbers where 1 is
    ///   uniform (0,1), 2 is uniform (-1,1) and 3 is normal (0,1).
    /// - Returns: A Matrix of random values.
    public static func random(rows: Int, columns: Int, dist: Int) -> Matrix {
        var idist = dist
        var num = rows * columns

        // Must be between 0 and 4095, and iseed[3] must be odd
        // See https://netlib.org/lapack/explore-html/d5/dd2/group__larnv.html
        var iseed: [Int] = (0..<3).map { _ in Int.random(in: 1..<4095) }
        iseed += [2 * (Int.random(in: 1..<4095) / 2) + 1 ]

        let mat = Matrix<Float>(rows: rows, columns: columns)
        slarnv_(&idist, &iseed, &num, mat.buffer.baseAddress)
        return mat
    }
}

extension Matrix where T == Double {

    /// Create a Matrix containing random values with double precision.
    /// - Parameters:
    ///   - rows: Number of rows.
    ///   - columns: Number of columns.
    ///   - dist: Specify the distribution of the random numbers where 1 is 
    ///   uniform (0,1), 2 is uniform (-1,1) and 3 is normal (0,1).
    /// - Returns: A Matrix of random values.
    public static func random(rows: Int, columns: Int, dist: Int) -> Matrix {
        var idist = dist
        var num = rows * columns

        // Must be between 0 and 4095, and iseed[3] must be odd
        // See https://netlib.org/lapack/explore-html/d5/dd2/group__larnv.html
        var iseed: [Int] = (0..<3).map { _ in Int.random(in: 1..<4095) }
        iseed += [2 * (Int.random(in: 1..<4095) / 2) + 1 ]

        let mat = Matrix<Double>(rows: rows, columns: columns)
        dlarnv_(&idist, &iseed, &num, mat.buffer.baseAddress)
        return mat
    }
}
