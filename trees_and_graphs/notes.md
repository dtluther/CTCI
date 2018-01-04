# Notes

## Types of Trees
### Trees vs. Binary Trees
* **Binary tree**: each node has **UP TO** 2 children
    * If any node has more than 2 children, it's not a binary tree
* A "leaf" node is a node without children

### Binary Tree vs. Binary Search Tree
* **Binary search tree**: binary tree in which all left descendants <= node < all right descendants
    * Keep in mind every node in the tree must follow these rules
    * Can also have left descendants < node <= all right descendants, but less common
    * Under some definitions, there are no duplicates; in others duplicates can be on either side, as mentioned above
        * Make sure to clarify this with the interviewer

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
    * The only node that is not filled completely has to be filled left to right, as is shown on the right side

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
* First "visit" (often, we will be asked to print) the left branch, then the current node, then the right branch
    * This means you recursively go go left, current, and right as you go down a branch
* NOTE: when performed on a BST, in-order traversal visites the nodes in ascending order ("in-order")

### Pre-Order Traversal
* First visit the current node, then left branch, then right branch
    * The root is always the **first** node visited
* Pre-order traversal visits the current node before the children

### Post-Order Traversal
* First visit the left branch, then right branch, then current node
    * The root is always the **last** node visited
* Post-order traversal visits the children before the current node

## Binary Heaps (Min-Heaps and Max-Heaps)
* These notes are just for min-heaps; max-heaps are structured essentially the same, but the elements are in descending order rather than ascending order
* A min-heap is a ***complete*** binary tree (the tree is totally filled, other than the rightmost elements on the last level), where **each** node is smaller than it's children
    * Thus the root is the minimum element of the in the tree:
* i.e.

    ![screen shot 2017-12-07 at 12 40 31 pm](https://user-images.githubusercontent.com/15662012/33737667-db02eb9e-db4b-11e7-8cbf-fc09f5034cbf.png)

* There are two key operations in min-heap: **insert** and **extract** (specifically **extract_min**)
    * insert:
        1) Always start by inserting an element at the bottom rightmost spot, in order to maintain the completeness property
        ![screen shot 2017-12-07 at 12 51 17 pm](https://user-images.githubusercontent.com/15662012/33738220-71c4bd2c-db4d-11e7-92af-d5e4c6e52982.png)

        2) Then, we "fix" or "heapify-up" the tree by swapping the new element with its parent until we find the appropriate spot to maintain the heap property, which in case of the min-heap is to be <= to its parent and >= to its children
        ![screen shot 2017-12-07 at 12 51 26 pm](https://user-images.githubusercontent.com/15662012/33738224-72c5c680-db4d-11e7-84b4-74873b8e6e4a.png)
        ![screen shot 2017-12-07 at 12 51 46 pm](https://user-images.githubusercontent.com/15662012/33738225-73f1d7f6-db4d-11e7-940c-122d61255c13.png)

        * This takes O(log n) time, where n is the number of nodes in the heap
            * log n comes from the depth, so and technically this is log base 2 since it's binary tree
    * extract:
        1) Swap the minimum element (the root) with the last (bottommost, rightmost) element
            * Min element is always at the top in a min-heap
        2) Bubble down, or heapify down, by swapping the new root with its children until the heap property is restored
            * How do we pick left or right child?
                * Pick the smaller one in order to maintain the min-heap ordering (you would pick the larger one if you wanted to maintain the max heap ordering)
                    * Otherwise, our new parent would again be larger than its other child
        * e.g., heapifying down after extracting min:

            ![screen shot 2018-01-02 at 11 27 52 am](https://user-images.githubusercontent.com/15662012/34496867-1998806c-efb0-11e7-9841-cdd139d107ee.png)
            * Min element was extracted and then the last element (80) replaced it and became the new root

            ![screen shot 2018-01-02 at 11 32 01 am](https://user-images.githubusercontent.com/15662012/34497024-95a28d92-efb0-11e7-9606-30cdbd52a80d.png)
            ![screen shot 2018-01-02 at 11 31 21 am](https://user-images.githubusercontent.com/15662012/34496997-82303390-efb0-11e7-8207-fb0a4c9a05a0.png)
        
        * this also takes O(log n) time

### Tries (Prefix Trees)
* A **trie** is a variant of an n-ary tree in which characters are stored at each node. Each path down the tree may represent a word, for instance.
* The `*` nodes (a.k.a. null nodes) are often used to indicate complete words (see `*` under M-A-N-Y below)
    * The implementation of the `*` nodes vary, i.e., they could be a special type of child (such as a **TerminatingTrieNode**, which inherits from **TrieNode**), or we could use a boolean flag **terminates** within the "parent" node
* A node in a trie could have between `1` and `ALPHABET_SIZE + 1` children (or 0, through `ALPHABET_SIZE` if a boolean flag is used instead of a `*` node)

    ![screen shot 2017-12-07 at 4 06 48 pm](https://user-images.githubusercontent.com/15662012/33744923-b349e84c-db68-11e7-820b-8ad7e98ba40c.png)

* Commonly, a trie is used to store the entire (English) language for quick prefix lookups
    * While a hash can very quickly look up whether a string is a valid word, it cannot tell us if a string is a prefix of any valid words; but a trie can do this very quickly
        * How quickly?
            * O(K), where K is the length of the string
                * NOTE: this is actually the same runtime as a hash table will take, although we often refer to hash table lookups as O(1) time, this isn't entirely true; it must read through all of the characters in the input, which takes O(K) time in a word lookup
* Many problems involving lists of words leverage a trie as an optimization. In situations when we search through a tree on related prefixes repeatedly (e.g., M, then M-A, then M-A-N, then M-A-N-Y), we might pass around a reference to the current node in the tree. This will allow us to just check if `Y` is a child of `MAN`, as opposed to starting from the root each time.

### Graphs
* A tree is a type of graph, but not all graphs are trees
    * Simply, a tree is a connected graph without cycles 
* A **graph** is simply a connection of nodes with edges between (some of) them.
    * Can be either directed (like the following graph) or undirected
        * Think of a one-way street vs. a two-way street
    * A graph can cosist of multiple isolated subgraphs
        * If there is a path to every vertex on the graph, it is called a ***connected*** graph
    * A graph can also have cycles, or be **acyclic**

        ![screen shot 2017-12-07 at 4 15 27 pm](https://user-images.githubusercontent.com/15662012/33745141-e7c6a4b0-db69-11e7-8a23-fde97105c956.png)

Two common ways to represent a graph:
#### Adjacency List
* Most common way to representa  graph
* Every node/vertex stores a list of adjacent nodes/vertices
    * In an undirected graph, an edge like `(a, b)` would be stored twice: once in `a`'s adjacent vertices and once in `b`s adjacent vertices
* NOTE: A graph is useful because, unlike in a tree, you can't necessarily reach all the nodes from a single node, as in a case of isolated subraphs or being stuck in a cycle
    * A graph class is not necessary though, just often cleaner
        * Could be represented as an array, or hash table like below:
        
            ![screen shot 2017-12-07 at 4 33 33 pm](https://user-images.githubusercontent.com/15662012/33745558-63eed5a6-db6c-11e7-90c1-676727002ac1.png)
        
#### Adjacency Matrix
* An NxN boolean matrix (where N is the number of nodes), where a true value at matrix[i][j] indicastes an edge from node i to node j (an integer matrix with 0 and 1 is also often used)
    * In an undirected graph, the matrix will be symmetric; in a directed graph it will not (necessarily) be

        ![screen shot 2017-12-07 at 4 41 27 pm](https://user-images.githubusercontent.com/15662012/33745730-8101904c-db6d-11e7-902f-cc642bc406b3.png)

    NOTE: The same graph algorithms (BFS, DFS, etc.) can be performed on listes an matrices (although can be slightly less efficient on matricies)
        * In adjacency lists you can easily iterate through the neighbors of a node
        * In adjacency matrices, you need to iterate through all the nodes to identify a node's neighbors first

#### Graph Search
* Two most common ways: **breadth-first** search (BFS) and **depth-first** search (DFS)
    * depth-first search: begin at the root (or another arbitrarily selected node) and explore each branch completely (keep moving to a child) before going on to the next branch: deep before wide
    * breadth-first search" begin at the root (or another arbitrarily selected node) and explore each neighbor before going onto any of their children: wide before deep
    * e.g., assuming neighbors are iterated in numerical order:

        ![screen shot 2017-12-07 at 9 14 56 pm](https://user-images.githubusercontent.com/15662012/33752045-069c5bb2-db94-11e7-9223-d09c8e7d7490.png)

* DFS is often preferred if want to look at every node in the graph (both are fine, but DFS is a bit simpler)
    * NOTE: pre-order and other forms of tree traversal are forms of DFS
        * The key difference is that, for a graph, we need to check if the node has been visited lest we get stuck in an infinite loop
    * DFS is implemented recursively
* BFS is generally better if we want to find the shortest path (or just any path) between two nodes
    * BFS implements an iterative solution with a queue
        * Common mistake is to try to implement recursively
* A **bi-directional search** is used to find the shortest distance between a source and destination node: when the searches collide, a path has been found
    ![screen shot 2017-12-07 at 11 28 09 pm](https://user-images.githubusercontent.com/15662012/33755590-57edc854-dba6-11e7-953b-9a44a3080f77.png)

    * To see why this is faster, consider a graph where every node has at most `k` adjacent nodes and the shortest path from node `s` to node `t` has length `d`:
        * In a tradition BFS, we search up to k nodes in the first "level" of the search. In the second level, k<sup>2</sup> (thus far). We would do this d times, so O(k<sup>d</sup>) nodes.
        * In bi-directional search, the two searches collide after approximately d/2 levels (the midpoint of the path). The search from s visits approximately k<sup>d/2</sup> nodes, as does the search from t. So that's approximately 2k<sup>d/2</sup>, or O(k<sup>d/2</sup>), nodes total
        * NOTE: this improvement factor of k<sup>d/2</sup> is significant;
        * Put another way, before ours system could search "friend of friend" paths, and now it can search "friend of friend of friend of friend" paths, so twice as long