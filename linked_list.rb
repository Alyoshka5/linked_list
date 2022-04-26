class LinkedList
    def initialize(value)
        @head_node = Node.new(value)
    end

    def append(value)
        new_node = Node.new(value)
        current_node = @head_node
        until current_node.next == nil
            current_node = current_node.next
        end
        current_node.next = new_node
    end

    def prepend(value)
        new_node = Node.new(value)
        new_node.next = @head_node
        @head_node = new_node
    end

    def size
        count = 0
        current_node = @head_node
        until current_node == nil
            count += 1
            current_node = current_node.next
        end
        count
    end

    def head
        @head_node
    end

    def tail
        current_node = @head_node
        until current_node.next == nil
            current_node = current_node.next
        end
        current_node
    end

    def at(index)
        i = 0
        current_node = @head_node
        until i == index
            i += 1
            current_node = current_node.next
        end
        current_node
    end

    def pop
        previous_node = @head_node
        current_node = @head_node.next
        until current_node.next == nil
            previous_node = current_node
            current_node = current_node.next
        end
        previous_node.next = nil
    end

    def contains?(value)
        current_node = @head_node
        until current_node == nil
            if current_node.value == value
                return true
            end
            current_node = current_node.next
        end
        false  # value not found
    end

    def find(value)
        i = 0
        current_node = @head_node
        until current_node == nil
            if current_node.value == value
                return i
            end
            i += 1
            current_node = current_node.next
        end
        nil  # value not found
    end

    def insert_at(value, index)
        if index == 0
            prepend(value)
        else
            i = 0
            new_node = Node.new(value)
            current_node = @head_node
            until i == index - 1
                i += 1
                current_node = current_node.next
            end
            new_node.next = current_node.next
            current_node.next = new_node
        end
    end

    def remove_at(index)
        if index == 0
            @head_node = @head_node.next
        else
            i = 0
            current_node = @head_node
            until i == index - 1
                i += 1
                current_node = current_node.next
            end
            current_node.next = current_node.next.next  # node 2 steps ahead
        end 
    end

    def to_s
        values = []
        current_node = @head_node
        until current_node.next == nil do
            values << current_node.value
            current_node = current_node.next
        end
        values << current_node.value
        "( " + values.join(" ) -> ( ") + " ) -> nil"
    end
end

class Node
    attr_reader :value
    attr_accessor :next
    def initialize(value)
        @value = value
        @next = nil
    end
end