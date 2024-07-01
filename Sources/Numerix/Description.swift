/*
 Description for Vector and Matrix.
 This determines the print output when doing things like `print(vec)` and `print(mat)`.
 */

/// String representation of a numeric value such as a Float or Double.
public protocol NumberString {
    var numberDescription: String { get }
}

extension Int: NumberString {
    public var numberDescription: String {
        "\(self)"
    }
}

extension Float: NumberString {
    public var numberDescription: String {
        String(format: "%.2f", self)
    }
}

extension Double: NumberString {
    public var numberDescription: String {
        String(format: "%.4f", self)
    }
}

extension Vector: CustomStringConvertible where T: NumberString {

    public var description: String {
        let desc = """
        \(self.length)-element \(type(of: self))
        \(self.buffer.map(\.numberDescription).joined(separator: " "))
        """
        return desc
    }
}

extension Matrix: CustomStringConvertible where T: NumberString, T: Comparable {

    public var description: String {
        var desc = ""

        // Matrix size and type
        desc += "\(self.rows)x\(self.columns) \(type(of: self))\n"

        // Max column width for each matrix column
        //
        // This is not efficient for a large matrix. Consider transposing so
        // that iterating over rows actually iterates over the columns then get
        // max value for each column.
        var colVals = [T]()
        var maxColWidth = [Int]()

        for j in 0..<self.columns {
            for i in 0..<self.rows {
                colVals.append(self[i, j])
            }
            maxColWidth.append(colVals.max()!.numberDescription.count)
            colVals = []
        }

        // Matrix values as strings with padding
        for i in 0..<self.rows {
            for j in 0..<self.columns {
                let colWidth = maxColWidth[j]
                let valWidth = self[i, j].numberDescription.count
                let pad = String(repeating: " ", count: colWidth - valWidth)
                let valDesc = pad + self[i, j].numberDescription + "  "
                desc += valDesc
            }
            desc += "\n"
        }

        return desc
    }
}
