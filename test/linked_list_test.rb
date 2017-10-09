require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require 'pry'

class LinkedlistTest < Minitest::Test
  def test_head_of_list
    list = LinkedList.new

    assert_instance_of LinkedList, list
  end
end
