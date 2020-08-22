class Node
    attr_accessor :next
    attr_reader   :value
    def initialize(value)
      @value = value
      @next  = nil
    end
    def to_s
      "Node with value: #{@value}"
    end
end

class LinkedList
    def initialize
      @head = nil
      @size = 1
    end

    def append(value)
      if @head
        find_tail.next = Node.new(value)
      else
        @head = Node.new(value)
      end
    end

    def find_tail
      node = @head
      return node if !node.next
      return node if !node.next while (node = node.next)
    end

    def size

        if @head.nil?
            return 0
        else
            size = 0
            node = @head
             until node.next.nil?
                size = size + 1
                node = node.next
               
             end
             return size + 1
        end 
                
    end

    def head_node
        node = @head
        return node if node = node
        
    end

    def at(index)
      node = @head
      index.times do
        node = node.next
      end
      return node
      
    end

    def pop
      new_tail = at(@size - 2)
      new_tail.next = nil
      @tail = @new_tail

      @size -= 1
      
    end

    def append_after(target, value)
      node           = find(target)
      return unless node
      old_next       = node.next
      node.next      = Node.new(value)
      node.next.next = old_next
    end

    def find(value)
      node = @head
      return false if !node.next
      return node  if node.value == value
      while (node = node.next)
        return node if node.value == value
      end
    end
    
    def contains?
      node = @head
      @size.times do
        if node.value == value
          return true
        else
          if node.next != nil
            node = node.next
          end
        end
      end
      return false
    end 

    def find_before(value)
      node = @head
      return false if !node.next
      return node  if node.next.value == value
      while (node = node.next)
        return node if node.next && node.next.value == value
      end
    end
    def print
      node = @head
      puts node
      while (node = node.next)
        puts node
      end
    end
end

list = LinkedList.new
list.append(10)
list.append(20)
list.append(30)
list.append_after(10, 15)
list.append_after(20, 25)


p "list size: #{list.size}"
p "the head node is : #{list.head_node}"
p "the tail is: #{list.find_tail}"
p "the node is at: #{list.at(3)}"
p "the removed node is: #{list.pop}"
list.contains?
list.print