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
* **Complete** binary tree: every level of the tree is fully filled, except for potentially the last one; as far as the last level is filled, it is filled left to right. See below:

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

### In order traversal
* to "visit" (often, we will be asked to print) the left branch, then the current node, then the right branch
    * this means you recursively go go left, current, and right as you go down a branch