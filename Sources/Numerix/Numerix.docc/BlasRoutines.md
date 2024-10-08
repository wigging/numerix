# BLAS Routines

Interface for BLAS routines.

Numerix uses the Accelerate framework to access Basic Linear Algebra Subprograms (BLAS) for performing common linear algebra operations. The tables below list the BLAS routines and the related Numerix functions for each level of functionality. 

## Level 1

This level contains vector operations.

| BLAS   | Numerix                           | Description                           |
| ------ | --------------------------------- | ------------------------------------- |
| srotg  | -                                 | generate plane rotation               |
| drotg  | -                                 | ^                                     |
| srotmg | -                                 | generate modified plane rotation      |
| drotmg | -                                 | ^                                     |
| srot   | -                                 | apply plane rotation                  |
| drot   | -                                 | ^                                     |
| srotm  | -                                 | apply modified plane rotation         |
| drotm  | -                                 | ^                                     |
| swap   | -                                 | swap vectors                          |
| dwap   | -                                 | ^                                     |
| sscal  | ``scale(_:by:)-355s9``            | scale a vector by a constant          |
| dscal  | ``scale(_:by:)-2q46w``            | ^                                     |
| scopy  | -                                 | copy a vector to another vector       |
| dcopy  | -                                 | ^                                     |
| saxpy  | -                                 | constant times a vector plus a vector |
| daxpy  | -                                 | ^                                     |
| sdot   | ``dotProduct(_:_:stride:)-3rymf`` | dot product                           |
| ddot   | ``dotProduct(_:_:stride:)-1m3h0`` | ^                                     |
| snrm2  | ``norm(_:)-4m1aa``                | Euclidean norm                        |
| ^      | ``norm(_:)-5e524``                | ^                                     |
| dnrm2  | ``norm(_:)-9ebgx``                | ^                                     |
| ^      | ``norm(_:)-6q1aq``                | ^                                     |
| sasum  | ``absoluteSum(_:)-4x5t0``         | sum of absolute values                |
| dasum  | ``absoluteSum(_:)-8k8v7``         | ^                                     |
| isasum | -                                 | index of max absolute value           |
| idasum | -                                 | ^                                     |

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
