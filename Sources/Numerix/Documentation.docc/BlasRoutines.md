# BLAS Routines

Interface for BLAS routines.

Numerix uses the Accelerate framework to access Basic Linear Algebra Subprograms (BLAS) for performing common linear algebra operations. The tables below list BLAS routines along with the related Numerix functions and methods. More information about BLAS is available at <https://netlib.org/blas/> and <https://netlib.org/lapack/>.

## Level 1

This BLAS level contains vector operations. In Numerix, some of these functions are also available for matrix and shaped arrays.

srotg, drotg - generate plane rotation.

srotmg, drotmg - generate modified plane rotation.

sasum, dasum - sum of absolute values. ``Vector/absoluteSum()``

## Level 2

This level contains matrix-vector operations.

## Level 3

This level contains matrix-matrix operations.
