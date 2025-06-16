/*
Number style protocol.
*/

@_documentation(visibility: private)
public protocol NumberStyle {
    var stringDescription: String { get }
    var integerLength: Int { get }
    var fractionLength: Int { get }
}

@_documentation(visibility: private)
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

@_documentation(visibility: private)
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

@_documentation(visibility: private)
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
