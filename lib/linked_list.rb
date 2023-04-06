class Linked_list
#append(value) adds a new node containing value to the end of the list
#prepend(value) adds a new node containing value to the start of the list
#size returns the total number of nodes in the list
#head returns the first node in the list
#tail returns the last node in the list
#at(index) returns the node at the given index
#pop removes the last element from the list
#contains?(value) returns true if the passed in value is in the list and otherwise returns false.
#find(value) returns the index of the node containing value, or nil if not found.
#to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil

#Optional:
#insert_at(value, index) that inserts a new node with the provided value at the given index.
#remove_at(index) that removes the node at the given index.

#The linkedlist will be represented as an array containing smaller individual nested array of class Node.
    def initialize(list = Array.new(0))
        @list = list
    end



end

class Node
    #contains a #value method and a link to the #next_node, set both as nil by default.
    #A node will be represented as a nested array inside the Linked_list object array.
    #Each array will contain data and either a pointer to the next node or a terminator address that signifies the end of the list
    def initialize(value, position = nil)
        @value = value
        @position = position
    end
    
end
