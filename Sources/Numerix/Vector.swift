//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 3/26/24.
//

public struct Vector<T: FloatingPoint> {

    public var values: [T]

    public init(_ values: [T]) {
        self.values = values
    }

    public init(size: Int, fill: T = 0.0) {
        self.values = [T](repeating: fill, count: size)
    }

    public subscript(item: Int) -> T {
        get { return values[item] }
        set { values[item] = newValue }
    }
}
