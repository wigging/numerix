/*
Matrix extensions to conform to CustomStringConvertible and CustomDebugStringConvertible protocols.
*/

extension Matrix: CustomStringConvertible {

    public var description: String {
        self.formatted()
    }
}

extension Matrix: CustomDebugStringConvertible {

    public var debugDescription: String {
        """
        \(self.rows)x\(self.columns) \(type(of: self))
        \(self.description)
        """
    }
}
