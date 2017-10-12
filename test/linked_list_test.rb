require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require 'pry'

class LinkedlistTest < Minitest::Test
  def test_list_exists
    list = LinkedList.new

    assert_instance_of LinkedList, list
  end

  def test_head_is_empty_on_new_list
    list = LinkedList.new

    assert_nil list.head
    assert_equal 0, list.count
  end

  def test_can_append_new_node_to_empty_list
    list = LinkedList.new
    new_node = list.append("West")

    assert_equal new_node, list.head
    assert_nil list.head.next_node
    assert_equal 1, list.count
    assert_equal "The West family", list.to_string
  end

  def test_append_two_nodes
    list = LinkedList.new
    latest_node = list.append("Rhodes")
    newest_node = list.append("Hardy")

    assert_equal newest_node, list.head.next_node
    assert_equal 2, list.count
    assert_equal "The Rhodes family, followed by the Hardy family", list.to_string
  end

  def test_append_three_nodes
    list = LinkedList.new
    list.append("Rhodes")
    list.append("Hardy")
    list.append("Smiths")

    assert_equal 3, list.count
    assert_equal "The Rhodes family, followed by the Hardy family, followed by the Smiths family", list.to_string
  end

  def test_prepend_a_node
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")

    assert_equal "The McKinney family, followed by the Brooks family, followed by the Henderson family", list.to_string
    assert_equal 3, list.count
  end

  def test_prepend_a_node_with_supplies
    list = LinkedList.new
    list.append("Brooks", {"pounds of food" => 200})
    list.append("Henderson")
    list.prepend("McKinney", {"pounds of food" => 200})

    assert_equal "The McKinney family, followed by the Brooks family, followed by the Henderson family", list.to_string
    assert_equal 3, list.count
  end

  def test_insert_a_node
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")
    list.insert(1, "Lawson")

    assert_equal "The McKinney family, followed by the Lawson family, followed by the Brooks family, followed by the Henderson family", list.to_string
    assert_equal 4, list.count
    refute_equal 5,list.count
  end

  def test_insert_a_node_with_supplies
    list = LinkedList.new
    list.append("Brooks", {"pounds of food" => 200})
    list.append("Henderson", {"pounds of food" => 200})
    list.prepend("McKinney", {"pounds of food" => 200})
    list.insert(1, "Lawson", {"pounds of food" => 200})

    assert_equal "The McKinney family, followed by the Lawson family, followed by the Brooks family, followed by the Henderson family", list.to_string
    assert_equal 4, list.count
    refute_equal 5,list.count
  end

  def test_it_finds_nodes
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")
    list.insert(1, "Lawson")

    assert_equal "The McKinney family, followed by the Lawson family, followed by the Brooks family, followed by the Henderson family", list.to_string
    assert_equal "The Brooks family", list.find(2, 1)
    assert_equal "The Lawson family, followed by the Brooks family, followed by the Henderson family", list.find(1, 3)
    refute_equal "The Lawson family, followed by the Brooks family", list.find(1, 3)
  end

  def test_it_includes_a_family
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")
    list.insert(1, "Lawson")

    assert list.includes?("Brooks")
    refute list.includes?("Hardy")
  end

  def test_pops_multiple_families
    list = LinkedList.new
    list.append("Brooks")
    list.append("Henderson")
    list.prepend("McKinney")
    list.insert(1, "Lawson")
    actual = list.pop
    actual = list.pop
    expected = "The McKinney family, followed by the Lawson family"

    assert_equal "Brooks", actual.surname
    assert_instance_of Node, actual
    assert_equal expected, list.to_string
  end
end
