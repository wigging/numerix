# BLAS Routines

Interface for BLAS routines.

Numerix uses the Accelerate framework to access Basic Linear Algebra Subprograms (BLAS) for performing common linear algebra operations. The tables below list BLAS routines along with the related Numerix functions and methods. More information about BLAS is available at <https://netlib.org/blas/> and <https://netlib.org/lapack/>.

## Level 1

This BLAS level contains vector operations. In Numerix, some of these functions are also available for matrix and shaped arrays.

| BLAS   | Numerix                                      | Description                           |
| ------ | -------------------------------------------- | ------------------------------------- |
| srotg  | -                                            | generate plane rotation               |
| drotg  | -                                            | ^                                     |
| srotmg | -                                            | generate modified plane rotation      |
| drotmg | -                                            | ^                                     |
| srot   | -                                            | apply plane rotation                  |
| drot   | -                                            | ^                                     |
| srotm  | -                                            | apply modified plane rotation         |
| drotm  | -                                            | ^                                     |
| sswap  | ``swap(_:_:)-4yeys``                         | swap vectors                          |
| dswap  | ``swap(_:_:)-5w07b``                         | ^                                     |
| sscal  | ``scale(_:by:)-355s9``                       | scale a vector by a constant          |
| dscal  | ``scale(_:by:)-2q46w``                       | ^                                     |
| scopy  | -                                            | copy a vector to another vector       |
| dcopy  | -                                            | ^                                     |
| saxpy  | -                                            | constant times a vector plus a vector |
| daxpy  | -                                            | ^                                     |
| sdot   | ``dotProduct(_:_:stride:)-3rymf``            | dot product                           |
| ddot   | ``dotProduct(_:_:stride:)-1m3h0``            | ^                                     |
| snrm2  | ``norm(_:)-4m1aa``                           | Euclidean norm                        |
| dnrm2  | ``norm(_:)-9ebgx``                           | ^                                     |
| sasum  | ``absoluteSum(_:)-4x5t0``                    | sum of absolute values                |
| dasum  | ``absoluteSum(_:)-8k8v7``                    | ^                                     |
| isasum | ``Vector/indexOfMaxAbsValue(stride:)-2rj9a`` | index of max absolute value           |
| idasum | ``Vector/indexOfMaxAbsValue(stride:)-7qrfz`` | ^                                     |

## Level 2

This level contains matrix-vector operations.

| BLAS   | Numerix                           | Description                           |
| ------ | --------------------------------- | ------------------------------------- |
| sgemv  | -                                 |                                       |
| dgemv  | -                                 |                                       |

## Level 3

This level contains matrix-matrix operations.

| BLAS   | Numerix                           | Description                           |
| ------ | --------------------------------- | ------------------------------------- |
| sgemm  | -                                 |                                       |
| dgemm  | -                                 |                                       |
