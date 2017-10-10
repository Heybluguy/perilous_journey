require './lib/node'

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
      first = @head
      while(true)
        if first.next_node != nil
          first = first.next_node
        else
          return first.next_node = Node.new(surname)
        end
      end
    end
  end

  def to_string
    first_family = "The #{head.surname} family"
    first = @head.next_node
    while(true)
      if first == nil
        return first_family
      else
         first_family += ", followed by the #{first.surname} family"
         first = first.next_node
      end
    end
  end

  def prepend(surname)
    @count += 1
    first = Node.new(surname)
    first.next_node = @head
    @head = first
  end

end
