/*
Number style protocol.
*/

public protocol NumberStyle {
    var stringDescription: String { get }
    var integerLength: Int { get }
    var fractionLength: Int { get }
}

extension Int: NumberStyle {
    public var stringDescription: String {
        String(self)
    }

    public var integerLength: Int {
        String(self).count
    }

    public var fractionLength: Int {
        0
    }
}

extension Float: NumberStyle {
    public var stringDescription: String {
        self.formatted(.number.precision(.fractionLength(1...4)))
    }

    public var integerLength: Int {
        String(self).split(separator: ".")[0].count
    }

    public var fractionLength: Int {
        String(self).split(separator: ".")[1].count
    }
}

extension Double: NumberStyle {
    public var stringDescription: String {
        self.formatted(.number.precision(.fractionLength(1...6)))
    }

    public var integerLength: Int {
        String(self).split(separator: ".")[0].count
    }

    public var fractionLength: Int {
        String(self).split(separator: ".")[1].count
    }
}
