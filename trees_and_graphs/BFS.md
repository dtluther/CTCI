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