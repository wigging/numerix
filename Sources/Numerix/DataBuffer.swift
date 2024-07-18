/*
 DataBuffer class for storing underlying Vector and Matrix data in a mutable
 memory buffer.
 */

class DataBuffer<T> {
    var buffer: UnsafeMutableBufferPointer<T>

    init(count: Int, fill: T) {
        self.buffer = UnsafeMutableBufferPointer<T>.allocate(capacity: count)
        self.buffer.initialize(repeating: fill)
    }

    init(count: Int) {
        self.buffer = UnsafeMutableBufferPointer<T>.allocate(capacity: count)
    }

    init(array: [T]) {
        self.buffer = UnsafeMutableBufferPointer<T>.allocate(capacity: array.count)
        _ = self.buffer.initialize(fromContentsOf: array)
    }

    init(buffer: UnsafeMutableBufferPointer<T>) {
        self.buffer = UnsafeMutableBufferPointer<T>.allocate(capacity: buffer.count)
        _ = self.buffer.initialize(from: buffer)
    }

    deinit {
        self.buffer.deinitialize()
        self.buffer.deallocate()
    }
}
