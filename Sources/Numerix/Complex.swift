//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 5/12/24.
//

import Foundation

/// A complex number type with real and imaginary parts.
public struct Complex<T> {

    /// Real part for the complex number a + bi.
    public let real: T

    /// Imaginary part for the complex number a + bi.
    public let imag: T

    /// Create a complex number a + bi from real and imaginary parts.
    ///
    /// ```swift
    /// let c = Complex(real: 2.0, imag: 3.0)
    /// ```
    ///
    /// - Parameters:
    ///   - real: Real part in complex number a + bi.
    ///   - imag: Imaginary part in complex number a + bi.
    public init(real: T, imag: T) {
        self.real = real
        self.imag = imag
    }
}
