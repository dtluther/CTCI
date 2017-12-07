# Notes

## Types of Trees
### Trees vs. Binary Trees
* **Binary tree**: each node has **UP TO** 2 children
    * if any node has more than 2 children, it's not a binary tree
* A "leaf" node is a node without children

### Binary Tree vs. Binary Search Tree
* **Binary search tree**: binary tree in which all left descendants <= node < all right descendants
    * keep in mind every node in the tree must follow these rules
    * can also have left descendants < node <= all right descendants, but less common
    * under some definitions, there are no duplicates; in others duplicates can be on either side, as mentioned above
        * make sure to clarify this with the interviewer

### Balanced vs. Unbalanced
* A purpose of a "balanced" tree is to ensure O(log n) runtime for `insert` and `find`. A balanced tree isn't perfectly balanced (all nodes have 2 children), but it's very close. In order to be balanced BST, the BST must follow these rules:
    1) The depths of node's right subtree and left subtree differ by at most 1
    2) Both the right and left subtree are balances BSTs as well
    
    <br>

    A balanced tree (and the steps to check):
    ![screen shot 2017-12-07 at 11 47 05 am](https://user-images.githubusercontent.com/15662012/33735742-0c21816a-db45-11e7-99fe-078a7d0dadac.png)
    * The difference in depths is 2 - 2 = 0, so still <= 1

    ![root_at_5 at 11 55 31 am](https://user-images.githubusercontent.com/15662012/33736192-875550d6-db46-11e7-9c3a-ace590b6cdb0.png)
    * 1 - 1 = 0, <= 1

    ![root_at_20 at 11 55 31 am copy](https://user-images.githubusercontent.com/15662012/33736193-88d746e4-db46-11e7-9e9d-25955276ac32.png)
    * 1 - 0 = 1, <= 1
    * This tree is balanced because it passes 1 and 2

    <br>

    Unbalanced trees:
    ![screen shot 2017-12-07 at 12 07 04 pm](https://user-images.githubusercontent.com/15662012/33736370-35fc12d2-db47-11e7-8793-74f14a889be0.png)

    ![screen shot 2017-12-07 at 12 06 50 pm](https://user-images.githubusercontent.com/15662012/33736373-37254e94-db47-11e7-9fb9-916a37cacd80.png)

### Complete Binary Trees
* **Complete** binary tree: every level of the tree is fully filled, except for potentially the last level; as far as the last level is filled, it is filled left to right. See below:

    ![screen shot 2017-12-07 at 11 25 05 am](https://user-images.githubusercontent.com/15662012/33734494-680bf2c0-db41-11e7-9ab2-670ec268ee10.png)
    * the only node that is not filled completely has to be filled left to right, as is shown on the right side

### Full Binary Trees
* **Full** binary tree: every node in the tree has either zero or two children; no node has a single child. See below:

    ![screen shot 2017-12-07 at 12 11 13 pm](https://user-images.githubusercontent.com/15662012/33736528-c205158a-db47-11e7-9a41-586c698d3096.png)

### Perfect Binary Trees
* **Perfect** binary tree: a tree that is both full and complete: all **leaf** nodes are at the same level, and this level (the deepest level) has the maximum number of nodes. See below: 

    ![screen shot 2017-12-07 at 12 13 22 pm](https://user-images.githubusercontent.com/15662012/33736619-21f01288-db48-11e7-9bc0-173e4df84008.png)

    * NOTE: perfect trees are rare in interviews and in real life, as a perfect tree must have exactly 2<sup>k</sup> - 1 nodes (where k is the depth, or number of levels). In an interview, never assume the tree is perfect.

## Binary Tree Traversal
In order of most common to least common:

### In-Order Traversal
* "visit" (often, we will be asked to print) the left branch, then the current node, then the right branch
    * this means you recursively go go left, current, and right as you go down a branch
* NOTE: when performed on a BST, in-order traversal visites the nodes in ascending order ("in-order")

### Pre-Order Traversal
* visit the current node, then left branch, then right branch
    * the root is always the **first** node visited
* pre-order traversal visits the current node before the children

### Post-Order Traversal
* visit the left branch, then right branch, then current node
    * the root is always the **last** node visited
* post-order traversal visits the children before the current node

## Binary Heaps (Min-Heaps and Max-Heaps)
* These notes are just for min-heaps; max-heaps are structured essentially the same, but the elements are in descending order rather than ascending order
* A min-heap is a ***complete*** binary tree (the tree is totally filled, other than the rightmost elements on the last level), where **each** node is smaller than it's children
    * thus the root is the minimum element of the in the tree:
* i.e.

    ![screen shot 2017-12-07 at 12 40 31 pm](https://user-images.githubusercontent.com/15662012/33737667-db02eb9e-db4b-11e7-8cbf-fc09f5034cbf.png)

* There are two key operations in min-heap: **insert** and **extract**
    * insert:
        1) always start by inserting an element at the bottom rightmost spot, in order to maintain the completeness property
        ![screen shot 2017-12-07 at 12 51 17 pm](https://user-images.githubusercontent.com/15662012/33738220-71c4bd2c-db4d-11e7-92af-d5e4c6e52982.png)

        2) then, we "fix" or "heapify-up" the tree by swapping the new element with its parent until we find the appropriate spot to maintain the heap property, which in case of the min-heap is to be <= to its parent and >= to its children
        ![screen shot 2017-12-07 at 12 51 26 pm](https://user-images.githubusercontent.com/15662012/33738224-72c5c680-db4d-11e7-84b4-74873b8e6e4a.png)
        ![screen shot 2017-12-07 at 12 51 46 pm](https://user-images.githubusercontent.com/15662012/33738225-73f1d7f6-db4d-11e7-940c-122d61255c13.png)

        * This takes O(log n) time, where n is the number of nodes in the heap
            * log n comes from the depth, so and technically this is log base 2 since it's binary tree
