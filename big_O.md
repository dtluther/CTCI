## Big-O Notes

* Big-O corresponds to runtime, also called time complexity.

#### Helpful Hints
* For recursive runtimes, draw out trees to see how much more work happens with each line
* Understand the helpful math at the end of CTCI
* In a **balanced binary search tree**, the max depth is log n, where n is the total number of nodes
* _Generally_, when we see a function with multiple recursive calles, we're looking at exponential runtime
* When doing multiple, non-nested iterations, we add the runtimes; if they are nested, we multiply
    * When adding, if we know the size relationship between the iterations, we only need to worry about the one(s) that dominate the other(s)

#### Notable Examples
```
Which of the following are equivalent to O(N)? Why?
    O(N + P), where P < N/2
    Yes, because we since if P is less than N, N will dominate P as they go to infinity
    O(2N)
    Yes, coefficients drop off as we go to infinity
    O(N + log N)
    Yes, N dominates log N
    O(N + M)
    No, since we have no info of N and M, we do not know which is greater so we much maintain both
```

Draw out example 8 on page 60 for sorting and comparing strings

