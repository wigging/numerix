# Determinant

Compute the determinant of a matrix.

## Overview

Given a square matrix, compute the determinant of the matrix using single and double precision values. A precondition error occurs if the input matrix is not square. This determinant uses the LAPACK [sgetrf](https://netlib.org/lapack/explore-html/db/d04/group__getrf_ga003389c854f0674c7955debd7610694c.html) and [dgetrf](https://netlib.org/lapack/explore-html/db/d04/group__getrf_gaea332d65e208d833716b405ea2a1ab69.html) functions for single and double precision LU factorization. The diagonal of the factorization is used to calculate the determinant.

## Topics

- ``DeterminantError``
- ``determinant(_:)-4gb0l``
- ``determinant(_:)-353wm``
