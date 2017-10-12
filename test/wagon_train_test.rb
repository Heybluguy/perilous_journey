require './lib/wagon_train'
require 'minitest/autorun'
require 'minitest/pride'

class WagonTrainTest < Minitest::Test
  def setup
    @wagon_train = WagonTrain.new
  end

  def test_it_exists
    assert_instance_of WagonTrain, @wagon_train
  end

  def test_wagon_has_a_list
    assert_instance_of LinkedList, @wagon_train.list
  end

  def test_leading_wagon_is_empty
    assert_nil @wagon_train.list.head
  end

  def test_appends_wagon_to_wagon_train
    wagon = @wagon_train.append("Burke")

    assert_equal wagon, @wagon_train.list.head
  end

  def test_leading_wagon_has_correct_name
    wagon = @wagon_train.append("Burke")

    assert_equal "Burke", @wagon_train.list.head.surname
  end

  def test_appends_another_wagon_to_train
    wagon = @wagon_train.append("West")
    wagon = @wagon_train.append("Burke")

    assert_equal 2, @wagon_train.count
  end
end
