class Node
  def initialize(surname, supplies = "")
    @surname = surname
    @next_node = next_node
    @supplies = supplies
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

  def supplies
    @supplies
  end
end
