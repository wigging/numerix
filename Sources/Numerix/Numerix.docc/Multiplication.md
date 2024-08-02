# Multiplication

Multiplication operators for Vector and Matrix structures.

## Overview

Most of the vector and matrix multiplication operators use `*` but there are some differences that should be noted. For example, element-wise vector multiplication is performed with the `*` operator while element-wise matrix multiplication uses the `.*` operator. See the table below for a summary of the multiplication operators. In the table, scalars are represented by `s`, vectors by lower case letters such as `a` and `b`, and matrices by upper case letters `A` and `B`.

Description                                      | Operation
------------------------------------------------ | ---------
Element-wise multiplication of scalar and vector | `s * b`   
Element-wise multiplication of vector and scalar | `a * s`   
Element-wise multiplication of two vectors       | `a * b`
Element-wise multiplication of two matrices      | `A .* B`   
Multiplication of two matrices                   | `A * B`   


## Topics

### Scalar-Vector multiplication

- ``*(_:_:)-430lu``
- ``*(_:_:)-8s6rb``

### Vector-Scalar multiplication

- ``*(_:_:)-4eb93``
- ``*(_:_:)-4c96n``

### Vector-Vector multiplication

- ``*(_:_:)-2quv6``
- ``*(_:_:)-6qpmi``

### Scalar-Matrix multiplication

- ``*(_:_:)-55l1g``
- ``*(_:_:)-ovlq``

### Matrix multiplication

- ``*(_:_:)-3dhox``
- ``*(_:_:)-16bxl``
- ``*(_:_:)-9iigj``

- ``*=(_:_:)-7ccv4``
- ``*=(_:_:)-7bvjy``

- ``.*(_:_:)-1fnxr``
- ``.*(_:_:)-1isgw``

- ``⊙(_:_:)-3cut5``
- ``⊙(_:_:)-73mgh``
