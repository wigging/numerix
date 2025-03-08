/*
Functions that format the vector values for printing.
Used by Vector `description` in `CustomDebugStringConvertible`.
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
