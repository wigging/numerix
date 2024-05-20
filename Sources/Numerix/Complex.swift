//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 5/12/24.
//

import Foundation

public struct Complex<T> {

    /// Real part a for the complex number a + bi.
    public let real: T

    /// Imaginary part bi for the complex number a + bi.
    public let imag: T

    /// Create a complex number a + bi from real and imaginary parts.
    /// - Parameters:
    ///   - real: Real part a in complex number a + bi.
    ///   - imag: Imaginary part bi in complex number a + bi.
    public init(real: T, imag: T) {
        self.real = real
        self.imag = imag
    }
}
