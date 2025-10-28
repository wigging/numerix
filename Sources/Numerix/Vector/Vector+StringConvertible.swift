/*
Vector extensions to conform to CustomStringConvertible and CustomDebugStringConvertible protocols.
*/

extension Vector: CustomStringConvertible {

    public var description: String {
        self.formatted()
    }
}

extension Vector: CustomDebugStringConvertible {

    public var debugDescription: String {
        var descr = "\(self.size)-element \(type(of: self))\n"
        descr += self.formatted()
        return descr
    }
}
