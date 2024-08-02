/*
Performance tests for clock time and memory usage. These tests can be slow so
comment them out so they don't run with the unit tests. A better approach would
be to use a test plan for these tests.
*/

import XCTest
import Numerix

final class PerformanceTests: XCTestCase {

    /*
    // Clock time 0.434 s
    // Memory peak 807,000 kB
    func testNoCopy() {
        self.measure(metrics: [XCTClockMetric(), XCTMemoryMetric()]) {
            let n = 10_000
            let a = Matrix<Double>(rows: n, columns: n, fill: 0)
            var b = a
            b[0, 0] = 99
            b[0, 1] = 22
        }
    }
    */

    /*
    // Clock time 0.859 s
    // Memory peak 1,610,000 kB
    func testCopy() {
        self.measure(metrics: [XCTClockMetric(), XCTMemoryMetric()]) {
            let n = 10_000
            let a = Matrix<Double>(rows: n, columns: n, fill: 0)
            var b = a.copy()
            b[0, 0] = 99
            b[0, 1] = 22
        }
    }
    */
}
