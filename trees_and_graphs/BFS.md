# Breadth-First Search (BFS)
* Lecture from MIT OpenCourseware https://www.youtube.com/watch?v=s-CYnVz-uh4

### Applications for Graph Searches
* Web crawling
    * To find all the pages on the web, have to keep following links
    * Google often uses BFS (pages you already have, and keep going)
* Social networking
* Network broadcasting
* Garbage collection (in CS)
* Model checking
    * You have some finite model of code, or circuit, etc. and you want to prove it does what you think it was
    * The graph is all the possible states that the circuit or program could possibly have, and you give it some initial state and see if it can reach other states
* Solving puzzles & games
    * A rubix cube

* **Diameter**: If you always follow the best path (in the worst case), this is the number of steps you have to take (number of edges you have to traverse until you hit your goal)
    * Puzzlers call this "God's number"
    * If you always follow the best path, this is the number of moves it takes to reach the desired outcome

### Graph Representations
* Adjacency Lists
    * Can be represented as
        1) Hash table (or array if using numerical indices)
            * Key is a node, the value at that key is a linked list of neighbor nodes
            * Great option if you want to create multiple graphs with a single group of nodes
                * Can't do this with the OOP way because you have to designate the specific neighbors for one node object, and you can't (shouldn't) have multiple lists of neighbor nodes
        2) Object Oriented (Graph and Node Objects)
            * `Node` has `@neighbors` as an attribute
            * `Graph` is an array of `Node`s
        3) Implicit representation
            * v.neighbors (Ruby) can be a function which computes exactly what you need
                * Uses less space because it just uses the node's space, rather than saving anything in memory
            * Advantage in that you may not need to find every node, just the necessary ones to reach the state you are looking for
            