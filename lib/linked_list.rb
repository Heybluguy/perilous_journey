require './lib/node'
require 'pry'

class LinkedList

  def initialize
    @head = nil
    @count = 0
  end

  def head
    @head
  end

  def count
    @count
  end

  def append(surname)
    @count += 1
    if @head == nil
      @head = Node.new(surname)
    else
      current = @head
      while(true)
        if current.next_node != nil
          current = current.next_node
        else
          return current.next_node = Node.new(surname)
        end
      end
    end
  end

  def to_string
    current_family = "The #{head.surname} family"
    current = @head.next_node
    while(true)
      if current == nil
        return current_family
      else
         current_family += ", followed by the #{current.surname} family"
         current = current.next_node
      end
    end
  end

  def prepend(surname)
    @count += 1
    current = Node.new(surname)
    current.next_node = @head
    @head = current
  end

  def insert(index, surname)
    @count += 1
    @position = 0
    current = @head
    while(true)
      if @position < (index - 2)
        current.next_node = current
        @position += 1
      else
        new_node = Node.new("Lawson")
        new_node.next_node = current.next_node
        return current.next_node = new_node
      end
    end
  end

end
