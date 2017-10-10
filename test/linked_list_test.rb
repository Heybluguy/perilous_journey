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

  def test_append_four_nodes
    list = LinkedList.new
    list.append("Rhodes")
    list.append("Hardy")
    list.append("Smiths")
    list.append("Johns")

    assert_equal 4, list.count
    assert_equal "The Rhodes family, followed by the Hardy family, followed by the Smiths family, followed by the Johns family", list.to_string
  end





end
