class Linked_list

#The linkedlist will be represented as an array containing smaller individual nested hashes of class Node.
    def initialize(list = Array.new(0))
        @list = list
    end

#Append method: creates a list of addresses and a new node with end pointer
#Finds the last node in the list and changes its pointer to the new node being
#appended

    def append(value)
        new_node = Node.new.create_node(value)
        new_node[:pointer] = 'end'
        addresses = []
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

#prepend method: creates an array with addresses and a new node with address of 0
#moves addresses of all other elements by 1 then places the new node inside

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

#returns the size of the list

    def size
        return @list.size
    end

#head returns the first node in the list

    def head
        return @list.select {|element| element[:address] == 0}
    end

#tail returns the last node in the list

    def tail
        return @list.select {|element| element[:pointer] == 'end'}
    end

#at(index) returns the node at the given index

    def at(index)
        return @list.select {|element| element[:address] == index}
    end

#pop removes the last element from the list
#stores the last node in last_node then removes it from @list
#finds the new last node in @list then changes its pointer to 'end'
#returns last_node

    def pop
        addresses = self.generate_addresses
        last_node = @list.select {|element| element[:address] == addresses.max}
        addresses.delete(addresses.max)
        @list.delete_if {|element| element == last_node[0]}
        new_last_node_index = @list.find_index {|element| element[:address] == addresses.max}
        @list[new_last_node_index][:pointer] = 'end'
        return last_node
    end

#contains?(value) returns true if the passed in value is in the list and otherwise returns false.

    def contains?(value)
        values = self.generate_values
        return values.include?(value)
    end

#find(value) returns the index of the node containing value, or nil if not found.
#actually returns the address and the index

    def find(value)
        values = self.generate_values
        addresses = self.generate_addresses
        address_and_index = {}
        if values.none?(value)
            return nil
        elsif values.include?(value)
            address_and_index[:index] = values.find_index(value)
            address_and_index[:address] = addresses[address_and_index[:index]]
        end
        return address_and_index
    end

#to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil

    def to_s
        values = generate_values
        addresses = generate_addresses
        string_rep = ''
        until addresses.empty? 
            next_address = addresses.index(addresses.min)
            if addresses.size == 1
                string_rep.concat("(#{values[next_address]})")
            else
                string_rep.concat("(#{values[next_address]}) --> ")
            end
            addresses.delete_at(next_address)
            values.delete_at(next_address)
        end
        return string_rep
    end
    
#Optional:
#insert_at(value, index) that inserts a new node with the provided value at the given index.
#remove_at(index) that removes the node at the given index.

    def generate_values
        values = []
        @list.each {|element| values.push(element[:value])}
        return values
    end

    def generate_addresses
        addresses = []
        @list.each {|element| addresses.push(element[:address])}
        return addresses
    end

end

class Node
    
    #creates a node that has a hash
    #hash contains an address, a value, and a pointer to the next node

    def create_node(value, address = nil, pointer = nil)
        node = {address: address,
                value: value,
                pointer: pointer}
        return node
    end
end
