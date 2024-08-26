/*
Description for Vector and Matrix structures. This determines the print output
when doing things like `print(vec)` and `print(mat)`.
*/

/// String representation of an Integer, Float, or Double.
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

// Get the last row for each sub-matrix.
// This accounts for the empty line between each sub-matrix.
func getLastRows(_ array: [Int]) -> [Int] {
    array.reduce(into: [Int]()) { partialResult, x in
        if let last = partialResult.last {
            partialResult.append(last * x + x - 1)
        } else {
            partialResult.append(x)
        }
    }
}

// Create a string for printing the Vector, Matrix, or ShapedArray.
// The string is used by the CustomStringConvertible description property.
func arrayDescription<T>(for buffer: UnsafeMutableBufferPointer<T>, with shape: [Int]) -> String {

    // Handle one-dimension array
    if shape.count == 1 || shape.count == 2 && shape[0] == 1 {
        var descr = "( "
        descr += buffer.map { "\($0)" }.joined(separator: "  ")
        descr += " )"
        return descr
    }

    // Chunk size is number of columns
    let chunkSize = shape.last ?? 1

    let chunks = stride(from: 0, to: buffer.count, by: chunkSize).map {
        Array(buffer[$0..<min($0 + chunkSize, buffer.count)])
    }

    // Width used for the printed elements is based on max character length
    let width = buffer.map { "\($0)".count }.max() ?? 1

    // Get each line of the printed array, each line represents a row
    let lines = chunks.map { row in
        row.map { element in
            (String(repeating: " ", count: width) + "\(element)").suffix(width)
        }.joined(separator: "  ")
    }

    // Last rows for each sub-matrix
    var r = shape
    r.removeLast()
    r.reverse()
    let rows = getLastRows(r)

    // Counter and variable to store description
    var n = 0
    var descr = ""

    // Add a line to the description.
    func add(line: String) {

        // Prepend symbol or space to the row
        for row in rows.reversed() {
            switch n % (row + 1) {
            case 0:
                if row == 1 { descr += "( " } else { descr += "⎛ " }
            case row - 1:
                descr += "⎝ "
            case row:
                descr += "  "
            default:
                descr += "⎜ "
            }
        }

        // Add line after prepended symbol
        descr += line

        // Append symbol or space to the row
        for row in rows {
            switch n % (row + 1) {
            case 0:
                if row == 1 { descr += " )" } else { descr += " ⎞" }
            case row - 1:
                descr += " ⎠"
            case row:
                descr += "  "
            default:
                descr += " ⎟"
            }
        }

        // Line return except at end of description
        if n != rows.last! - 1 { descr += "\n" }

        n += 1
    }

    // Last row of the first sub-matrix
    let last = rows.first ?? 1

    // Create each line for the description
    for line in lines {
        if n % (last + 1) == last {
            add(line: String(repeating: " ", count: (width + 2) * chunkSize - 2))
        }
        add(line: line)
    }

    return descr
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

extension ShapedArray: CustomStringConvertible {

    public var description: String {
        var descr = ""
        descr += self.shape.map { "\($0)" }.joined(separator: "x") + " \(type(of: self))\n"
        descr += arrayDescription(for: self.buffer, with: self.shape)
        return descr
    }
}
