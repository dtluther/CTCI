class Node
    attr_reader :name, :children

    def initialize(name, children_array)
        @name = name
        @children = children_array
    end
end

class Graph
    attr_reader :nodes

    def initialize(nodes)    
        @nodes = nodes
    end
end

node5 = Node.new("node1", [])
node4 = Node.new("node2", [node5])
node3 = Node.new("node1", [node4])
node2 = Node.new("node1", [node3])
node1 = Node.new("node1", [node2, node3])

graph = Graph.new([node1, node2, node3, node4, node5])

def routes_between_nodes(graph)
    
end