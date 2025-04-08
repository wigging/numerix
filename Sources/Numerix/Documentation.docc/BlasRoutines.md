# BLAS Routines

Interface for BLAS routines.

Numerix uses the Accelerate framework to access Basic Linear Algebra Subprograms (BLAS) for performing common linear algebra operations. The sections below list the related Numerix functions and methods for each BLAS level. More information about BLAS is available at <https://netlib.org/blas/> and <https://netlib.org/lapack/>.

## Level 1 BLAS

Vector operations.

- ``Vector/dot(_:)``
- ``Vector/norm()``
- ``Vector/scale(by:)``
- ``Vector/sum()``
- ``Vector/absoluteSum()``
- ``Vector/cumulativeSum()``
- ``Numerix/swapValues(_:_:)-(Vector<Scalar>,_)``

## Level 2 BLAS

Matrix-Vector operations.

## Level 3 BLAS

Matrix-Matrix operations.
