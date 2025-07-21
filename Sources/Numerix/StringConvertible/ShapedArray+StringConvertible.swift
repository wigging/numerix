/*
ShapedArray extensions to conform to CustomStringConvertible and CustomDebugStringConvertible protocols.
*/

extension ShapedArray: CustomStringConvertible where Scalar: NumberStyle {

    public var description: String {

        // Handle one-dimension array
        if shape.count == 1 || shape.count == 2 && shape[0] == 1 {
            var descr = "( "
            descr += self.buffer.map { "\($0)" }.joined(separator: "  ")
            descr += " )"
            return descr
        }

        // Chunk size is number of columns
        let chunkSize = shape.last ?? 1

        let chunks = stride(from: 0, to: self.buffer.count, by: chunkSize).map {
            Array(self.buffer[$0..<min($0 + chunkSize, self.buffer.count)])
        }

        // Width used for the printed elements is based on max character length
        let width = self.buffer.map { "\($0)".count }.max() ?? 1

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
        func addToDescription(line: String) {

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
                addToDescription(line: String(repeating: " ", count: (width + 2) * chunkSize - 2))
            }
            addToDescription(line: line)
        }

        return descr
    }
}

extension ShapedArray: CustomDebugStringConvertible where Scalar: NumberStyle {

    public var debugDescription: String {
        """
        \(self.shape.map { "\($0)" }.joined(separator: "x")) \(type(of: self))
        \(self.description)
        """
    }
}
