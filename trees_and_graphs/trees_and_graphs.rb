require 'byebug'

class Node
    attr_reader :name, :neighbors
    attr_accessor :seen

    def initialize(name, neighbors_array)
        @name = name
        @neighbors = neighbors_array
        @seen = false
    end
end

class Graph
    attr_reader :nodes

    def initialize(nodes)    
        @nodes = nodes
    end
end

node6 = Node.new("node5", [])
node5 = Node.new("node5", [])
node4 = Node.new("node4", [node5])
node3 = Node.new("node3", [node4])
node2 = Node.new("node2", [node3, node6])
node1 = Node.new("node1", [node2, node3])

graph = Graph.new([node1, node2, node3, node4, node5])

def routes_between_nodes(source, terminal) # source is a term for start node, terminal for end
    # # Naive solution would be to iterate through each of the neighbor's neighbors
    # # of each node until the other node is found or there are no further nodes left
    # # in the neighbors's neighbors
    # # This is DFS. Are DFS/BFS considered Naive solutions?
    #
    # if source.neighbors.length > 0
    #     source.neighbors.each do |node|
    #         node
    #         return true if node == terminal
    #         return routes_between_nodes(node, terminal)
    #     end
    # end
    #
    # false

    # BFS Implementation
    queue = []

end

p routes_between_nodes(node1, node5)
p routes_between_nodes(node3, node6)