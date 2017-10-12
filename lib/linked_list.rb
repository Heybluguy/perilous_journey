require './lib/node'
require 'pry'

class LinkedList
  attr_reader :head, :count
  def initialize
    @head = nil
    @count = 0
  end

  def append(surname, supplies = "")
    add_to_count
    if @head == nil
      @head = Node.new(surname, supplies)
    else
      current = @head
      while true
        if current.next_node != nil
          current = current.next_node
        else
          return current.next_node = Node.new(surname, supplies)
        end
      end
    end
  end

  def to_string
    caravan = "The #{head.surname} family"
    current = @head.next_node
    while true
      if current == nil
        return caravan
      else
         caravan += ", followed by the #{current.surname} family"
         current = current.next_node
      end
    end
  end

  def prepend(surname, supplies = "")
    add_to_count
    current = Node.new(surname, supplies)
    current.next_node = @head
    @head = current
  end

  def insert(index, surname, supplies = "")
    add_to_count
    @position = 0
    current = @head
    while true
      if @position < (index - 2)
        current.next_node = current
        @position += 1
      else
        new_node = Node.new(surname, supplies)
        new_node.next_node = current.next_node
        return current.next_node = new_node
      end
    end
  end

  def find(index, families)
    @position = 0
    current = @head
    while true
      caravan = "The #{current.surname} family"
      if @position < index
        current = current.next_node
        @position += 1
      else
        (families - 1).times do
        current = current.next_node
        caravan += ", followed by the #{current.surname} family"
      end
      return caravan
      end
    end
  end

  def includes?(surname)
    current = @head
    while true
      if current.next_node == nil
      return false
      elsif current.surname != surname
        current = current.next_node
      else
        return true
      end
    end
  end

  def pop
    current = @head
    current = current.next_node until current.next_node.next_node == nil
    puts "The #{current.next_node.surname} family has died of dysentery."
    removed = current.next_node
    current.next_node = nil
    @count -= 1
    puts to_string
    removed
  end

  def add_to_count
    @count += 1
  end
end
