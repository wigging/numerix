//
//  File.swift
//  
//
//  Created by Gavin Wiggins on 4/15/24.
//

import XCTest
import Numerix

func assertApproxEqual(_ a: Vector<Double>, _ b: Vector<Double>, file: StaticString = #filePath, line: UInt = #line) {
    XCTAssert(isApprox(a, b))
}

func assertApproxEqual(_ a: Vector<Float>, _ b: Vector<Float>, file: StaticString = #filePath, line: UInt = #line) {
    XCTAssert(isApprox(a, b))
}

func assertApproxEqual(_ a: Matrix<Double>, _ b: Matrix<Double>, file: StaticString = #filePath, line: UInt = #line) {
    XCTAssert(isApprox(a, b))
}

func assertApproxEqual(_ a: Matrix<Float>, _ b: Matrix<Float>, file: StaticString = #filePath, line: UInt = #line) {
    XCTAssert(isApprox(a, b))
}
