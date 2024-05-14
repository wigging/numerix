//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 5/12/24.
//

import Foundation

public struct Complex<T> {
    public let real: T
    public let imag: T

    public init(real: T, imag: T) {
        self.real = real
        self.imag = imag
    }
}
