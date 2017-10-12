require './lib/linked_list'

class WagonTrain
  attr_reader :list

  def initialize
    @list = LinkedList.new
    @supplies = {}
  end

  def append(surname, supplies)
    list.append(surname, supplies)
  end

  def count
    list.count
  end

  
end
