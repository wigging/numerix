//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 3/24/24.
//

import Accelerate

extension Matrix where T == Double {
    
    /// Create a Matrix containing random values with double precision.
    /// - Parameters:
    ///   - rows: Number of rows.
    ///   - columns: Number of columns.
    ///   - dist: Specify the distribution of the random numbers where 1 is 
    ///   uniform (0,1), 2 is uniform (-1,1) and 3 is normal (0,1).
    /// - Returns: A Matrix of random values.
    public static func random(rows: Int, columns: Int, dist: Int32) -> Matrix {
        var idist: Int32 = dist
        
        // Must be between 0 and 4095, and iseed[3] must be odd
        // See https://netlib.org/lapack/explore-html/d5/dd2/group__larnv.html
        var iseed: [Int32] = (0..<3).map { _ in Int32.random(in: 1..<4095) }
        iseed += [2 * (Int32.random(in:1..<4095) / 2) + 1 ]

        var n = Int32(rows * columns)
        var x = Array(repeating: 0.0, count: rows * columns)
        dlarnv_(&idist, &iseed, &n, &x)
        
        let m = Matrix(rows: rows, columns: columns, values: x)
        return m
    }
}

extension Matrix where T == Float {
    
    /// Create a Matrix containing random values with single precision.
    /// - Parameters:
    ///   - rows: Number of rows.
    ///   - columns: Number of columns.
    ///   - dist: Specify the distribution of the random numbers where 1 is
    ///   uniform (0,1), 2 is uniform (-1,1) and 3 is normal (0,1).
    /// - Returns: A Matrix of random values.
    public static func random(rows: Int, columns: Int, dist: Int32) -> Matrix {
        var idist: Int32 = dist
        
        // Must be between 0 and 4095, and iseed[3] must be odd
        // See https://netlib.org/lapack/explore-html/d5/dd2/group__larnv.html
        var iseed: [Int32] = (0..<3).map { _ in Int32.random(in: 1..<4095) }
        iseed += [2 * (Int32.random(in:1..<4095) / 2) + 1 ]
        
        var n = Int32(rows * columns)
        var x = Array<Float>(repeating: 0.0, count: rows * columns)
        slarnv_(&idist, &iseed, &n, &x)
        
        let m = Matrix(rows: rows, columns: columns, values: x)
        return m
    }
}
