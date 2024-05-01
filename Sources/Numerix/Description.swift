//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 3/31/24.
//

/// String representation of a scalar value such as a Float or Double.
public protocol ScalarStringConvertible {
    var scalarDescription: String { get }
}

extension Float: ScalarStringConvertible {
    public var scalarDescription: String { String(format: "%6.2f", self) }
}

extension Double: ScalarStringConvertible {
    public var scalarDescription: String { String(format: "%8.4f", self) }
}

extension Vector: CustomStringConvertible where T: ScalarStringConvertible {

    public var description: String {
        let desc = """
        \(values.count)-element \(type(of: self))
        \(values.map(\.scalarDescription).joined(separator: " "))
        """
        return desc
    }
}

extension Matrix: CustomStringConvertible where T: ScalarStringConvertible {

    public var description: String {
        var vals = ""
        for i in 0..<rows {
            let rowValues = (0..<columns).map { self[i, $0] }
            let rowString = rowValues.map(\.scalarDescription).joined(separator: " ")
            let end = i < rows - 1 ? "\n" : ""
            vals += rowString + end
        }
        let desc = """
        \(rows)x\(columns) \(type(of: self))
        \(vals)
        """
        return desc
    }
}
