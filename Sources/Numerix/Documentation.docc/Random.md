# Random Numbers

Random number generation.

## Overview

Numerix provides pseudorandom number generators (PRNGs) which are not cryptographically secure but offer much better performance than Swift's default random type methods. The generators can be used on their own or with Vector, Matrix, and ShapedArray structs to create bulk random values. By default the ``Wyrand`` generator is used with Vector, Matrix, and ShapedArray structs.

## Topics

- ``Wyrand``
- ``Xoshiro128Plus``
- ``Xoroshiro128Plus``
- ``Xoroshiro128PlusPlus``
- ``Vector/random(_:seed:)``
- ``Matrix/random(_:_:seed:)``
- ``Vector/random(_:using:)``
- ``Matrix/random(_:_:using:)``
- ``Vector/randomBNNS(size:bounds:seed:)``
- ``Vector/randomDistribution(size:dist:)``
