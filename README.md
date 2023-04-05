# linked_list

This will be a recreation of a linked list data structure
in the Ruby language.

A linked list consists of at least a node and a pointer to the
next node in the list.

I'll be making a linkedlist class that represents the full list and will have
the following methods (copy-pasted from Odin Project: 


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

Optional:
    #insert_at(value, index) that inserts a new node with the provided value at the given index.
    #remove_at(index) that removes the node at the given index.

I'll also make a node class that represents an individual node in the list
