# Linear Algebra

Vector and Matrix linear algebra operations.

## Overview

Numerix uses the Accelerate framework to access Basic Linear Algebra Subprograms (BLAS) and the Linear Algebra Package (LAPACK) for performing common linear algebra operations. More information about BLAS and LAPACK is available at <https://netlib.org/blas/> and <https://netlib.org/lapack/> respectively.

## Topics

### Vector operations

- ``Vector/absoluteSum()``
- ``Vector/copy(_:)``
- ``Vector/cumulativeSum()``
- ``Vector/dot(_:)``
- ``Vector/norm()``
- ``Vector/scale(by:)``
- ``Vector/sum()``
- ``Vector/update(with:times:)``
- ``swapValues(_:_:)-(Vector<Scalar>,_)``

### Matrix operations

- ``Matrix/copy(_:)``
- ``Matrix/determinant()``
- ``Matrix/inverse()``
- ``Matrix/norm()``
- ``Matrix/scale(by:)``
- ``Matrix/transpose()``
- ``swapValues(_:_:)-(Matrix<Scalar>,_)``
