//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 6/26/24.
//

class DataBuffer<T> {
    var buffer: UnsafeMutableBufferPointer<T>

    init(count: Int, fill: T) {
        let start = UnsafeMutablePointer<T>.allocate(capacity: count)
        self.buffer = UnsafeMutableBufferPointer(start: start, count: count)
        self.buffer.initialize(repeating: fill)
    }

    init(count: Int) {
        let start = UnsafeMutablePointer<T>.allocate(capacity: count)
        self.buffer = UnsafeMutableBufferPointer(start: start, count: count)
    }

    init(array: Array<T>) {
        let count = array.count
        let start = UnsafeMutablePointer<T>.allocate(capacity: count)
        self.buffer = UnsafeMutableBufferPointer(start: start, count: count)
        _ = self.buffer.initialize(fromContentsOf: array)
    }

    init(buffer: UnsafeMutableBufferPointer<T>) {
        let count = buffer.count
        let start = UnsafeMutablePointer<T>.allocate(capacity: count)
        self.buffer = UnsafeMutableBufferPointer(start: start, count: count)
        _ = self.buffer.initialize(from: buffer)
    }

    deinit {
        self.buffer.deinitialize()
        self.buffer.deallocate()
    }
}
