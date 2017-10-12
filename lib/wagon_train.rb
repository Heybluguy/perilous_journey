require './lib/linked_list'

class WagonTrain
  attr_reader :list, :supplies

  def initialize
    @list = LinkedList.new
  end

  def append(surname, supplies)
    list.append(surname, supplies)
  end

  def count
    list.count
  end

  def supplies
    current = list.head
    supplies = {}
    while current != nil
      supplies = supplies.merge(current.supplies){|items, item, new_item| new_item + item}
      current = current.next_node
    end
    supplies
  end
end
