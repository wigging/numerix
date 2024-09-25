# Inverse

Compute the inverse of a matrix.

## Overview

Given a square matrix, compute the inverse of the matrix using single and double precision values. A precondition error occurs if the input matrix is not square. An error is thrown if the inversion fails. This inverse function uses the LAPACK [dgetri](https://netlib.org/lapack/explore-html/da/d28/group__getri_ga8b6904853957cfb37eba1e72a3f372d2.html) function to compute the inverse using the LU factorization from the LAPACK [dgetrf](https://netlib.org/lapack/explore-html/db/d04/group__getrf_gaea332d65e208d833716b405ea2a1ab69.html) function.

## Topics

- ``InverseError``
- ``inverse(_:)-68fm3``
- ``inverse(_:)-7did6``
