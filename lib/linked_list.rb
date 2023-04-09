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

    def append(value)
        new_node = Node.new.create_node(value)
        new_node[:pointer] = 'end'
        addresses = []
        first_node = 
        @list.each {|element| addresses.push(element[:address])}
        last_node_index = @list.index {|element| element[:address] == addresses.max}
        if addresses.empty?
            new_node[:address] = 0
            @list.push(new_node)
        else
            new_node[:address] = addresses.max + 1
            @list[last_node_index][:pointer] = new_node[:address]
            @list.push(new_node)
        end
    end

    def prepend(value)
        new_node = Node.new.create_node(value)
        new_node[:address] = 0
        addresses = []
        @list.each do |element|
            element[:address] += 1
            if element[:pointer] != 'end'
                element[:pointer] += 1
            end
            addresses.push(element[:address])
        end
        if addresses.empty?
            new_node[:pointer] = 'end'
            @list.push(new_node)
        else
            new_node[:pointer] = addresses.min
            @list.push(new_node)
        end
    end
end

class Node
    #contains a #value method and a link to the #next_node, set both as nil by default.
    #A node will be represented as a nested array inside the Linked_list object array.
    #Each array will contain data and either a pointer to the next node or a terminator address that signifies the end of the list

    def create_node(value, address = nil, pointer = nil)
        node = {address: address,
                value: value,
                pointer: pointer}
        return node
    end
end
