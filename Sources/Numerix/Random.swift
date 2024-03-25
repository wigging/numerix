//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 3/24/24.
//

import Accelerate

extension Matrix where T == Double {
    
    public static func random(rows: Int, columns: Int) -> Matrix {
        var idist: Int32 = 1
        var iseed: [Int32] = [1, 2, 3, 1]
        var n = Int32(rows * columns)
        let x = Array<Double>(unsafeUninitializedCapacity: rows * columns) { buffer, initializedCount in
            dlarnv_(&idist, &iseed, &n, buffer.baseAddress)
            initializedCount = rows * columns
        }
        let m = Matrix(rows: rows, columns: columns, values: x)
        return m
    }
}

extension Matrix where T == Float {
    
    public static func random(rows: Int, columns: Int) -> Matrix {
        var idist: Int32 = 1
        var iseed: [Int32] = [1, 2, 3, 1]
        var n = Int32(rows * columns)
        let x = Array<Float>(unsafeUninitializedCapacity: rows * columns) { buffer, initializedCount in
            slarnv_(&idist, &iseed, &n, buffer.baseAddress)
            initializedCount = rows * columns
        }
        let m = Matrix(rows: rows, columns: columns, values: x)
        return m
    }
}
