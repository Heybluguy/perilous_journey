require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test
  def test_it_node_exists
    node = Node.new("Burke")

    assert_instance_of Node, node
  end

  def test_it_has_a_next_node
    node = Node.new("Burke")

    assert_nil node.next_node
    refute_equal 1, node.next_node
  end

  def test_it_has_a_surname
    node = Node.new("Burke")

    assert_equal "Burke", node.surname
  end

  def test_it_has_a_different_surname
    node = Node.new("Senior")

    assert_equal "Senior", node.surname
  end

  def test_it_node_exists_with_supplies
    node = Node.new("Burke", {"pounds of food" => 200})

    assert_instance_of Node, node
  end
end
