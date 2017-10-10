class Node

  def initialize(surname)
    @surname = surname
    @next_node = next_node
  end

  def surname
    @surname
  end

  def next_node
    @next_node
  end

  def next_node=(node)
    @next_node = node
  end
end
