/*
Functions that format Vector and Matrix values for printing.
Used by Vector `description` in `CustomDebugStringConvertible`.
Used by Matrix `description` in `CustomDebugStringConvertible`.
*/

extension Vector {

    private func formatValue(_ value: Scalar, specifier: String?) -> String {
        guard let spec = specifier else { return "\(value)" }
        return String(format: spec, value as! CVarArg)
    }

    /// Format the vector as a string representation.
    ///
    /// Use the optional format specifier to define the numeric format used for
    /// the underlying vector values. See the [IEEE printf specification][1] for
    /// more information about the format specifiers.
    /// ```swift
    /// let vec = Vector([0.90129, 5, 8.02, 9, 10])
    /// let formatVec = vec.formatted(specifier: "%.4f")
    /// // ( 0.9013  5.0000  8.0200  9.0000  10.0000 )
    /// ```
    /// [1]: https://pubs.opengroup.org/onlinepubs/9799919799/functions/fprintf.html
    /// - Parameter specifier: Format specifier.
    /// - Returns: String of vector values.
    public func formatted(specifier: String? = nil) -> String {
        var desc = "( "
        desc += self.buffer.map { formatValue($0, specifier: specifier) }.joined(separator: "  ")
        desc += " )"
        return desc
    }
}

extension Matrix {

    private func formatValue(_ value: Scalar, specifier: String?) -> String {
        guard let spec = specifier else { return "\(value)" }
        return String(format: spec, value as! CVarArg)
    }

    /// Format the matrix as a string representation.
    ///
    /// Use the optional format specifier to define the numeric format used for
    /// the underlying matrix values. See the [IEEE printf specification][1] for
    /// more information about the format specifiers.
    /// ```swift
    /// let mat = Matrix([[1, 5.2, 4], [10.1, 4, -12]])
    /// let formatMat = mat.formatted(specifier: "%.2f")
    /// // ⎛  1.00  5.20    4.00 ⎞
    /// // ⎝ 10.10  4.00  -12.00 ⎠
    /// ```
    /// [1]: https://pubs.opengroup.org/onlinepubs/9799919799/functions/fprintf.html
    /// - Parameter specifier: Format specifier.
    /// - Returns: String of matrix values.
    public func formatted(specifier: String? = nil) -> String {
        var desc = ""

        // Matrix is only one row so print as a row vector
        if self.rows == 1 {
            desc += "( "
            desc += self.buffer.map { formatValue($0, specifier: specifier) }.joined(separator: "  ")
            desc += " )"
            return desc
        }

        // Max integer width and fraction width for each matrix column
        var maxIntWidth = Array(repeating: 0, count: self.columns)
        var maxFracWidth = Array(repeating: 0, count: self.columns)

        for i in 0..<rows {
            for j in 0..<columns {
                let value = formatValue(self[i, j], specifier: specifier)
                var intLength = value.count
                var fracLength = 0

                if value.contains(".") {
                    intLength = value.split(separator: ".")[0].count
                    fracLength = value.split(separator: ".")[1].count
                }

                maxIntWidth[j] = Swift.max(maxIntWidth[j], intLength)
                maxFracWidth[j] = Swift.max(maxFracWidth[j], fracLength)
            }
        }

        // Matrix values as strings with padding
        for i in 0..<rows {
            switch i {
            case 0:
                desc += "⎛ "
            case rows - 1:
                desc += "⎝ "
            default:
                desc += "⎜ "
            }

            for j in 0..<columns {
                let value = formatValue(self[i, j], specifier: specifier)
                var intLength = value.count
                var fracLength = 0

                if value.contains(".") {
                    intLength = value.split(separator: ".")[0].count
                    fracLength = value.split(separator: ".")[1].count
                }

                let leftPad = String(repeating: " ", count: maxIntWidth[j] - intLength)
                let rightPad = String(repeating: " ", count: maxFracWidth[j] - fracLength)
                let valueDesc = leftPad + value + rightPad

                if j != columns - 1 {
                    desc += valueDesc + "  "
                } else {
                    desc += valueDesc
                }
            }

            switch i {
            case 0:
                desc += " ⎞\n"
            case rows - 1:
                desc += " ⎠"
            default:
                desc += " ⎟\n"
            }
        }

        return desc
    }
}