//
//  FunctionTests.swift
//  
//
//  Created by Gavin Wiggins on 4/12/24.
//

import XCTest
import Numerix

final class FunctionTests: XCTestCase {

    func testVectorApprox() {
        let vec1 = Vector<Double>([1, 2, 3, 4])
        let vec2 = Vector<Double>([1, 2, 3, 4])
        XCTAssert(isApprox(vec1, vec2))

        let vec3 = Vector<Float>([1, 2, 3, 4])
        let vec4 = Vector<Float>([1, 2, 3, 4])
        XCTAssert(isApprox(vec3, vec4))
    }

    func testMatrixApprox() {
        let mat1 = Matrix<Double>([[1, 2, 3, 4],
                                   [5, 6, 7, 8]])

        let mat2 = Matrix<Double>([[1, 2, 3, 4],
                                   [5, 6, 7, 8]])
        
        XCTAssert(isApprox(mat1, mat2))

        let mat3 = Matrix<Float>([[1, 2, 3, 4],
                                  [5, 6, 7, 8]])

        let mat4 = Matrix<Float>([[1, 2, 3, 4],
                                  [5, 6, 7, 8]])

        XCTAssert(isApprox(mat3, mat4))
    }
}
