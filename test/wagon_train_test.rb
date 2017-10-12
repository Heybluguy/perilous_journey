require './lib/wagon_train'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class WagonTrainTest < Minitest::Test
  def test_it_exists
    wagon_train = WagonTrain.new
    assert_instance_of WagonTrain, wagon_train
  end

  def test_wagon_has_a_list
    wagon_train = WagonTrain.new
    assert_instance_of LinkedList, wagon_train.list
  end

  def test_leading_wagon_is_empty
    wagon_train = WagonTrain.new
    assert_nil wagon_train.list.head
  end

  def test_appends_wagon_to_wagon_train
    wagon_train = WagonTrain.new
    wagon = wagon_train.append("Burke", {"pounds of food" => 200})

    assert_equal wagon, wagon_train.list.head
  end

  def test_leading_wagon_has_correct_name
    wagon_train = WagonTrain.new
    wagon = wagon_train.append("Burke", {"pounds of food" => 200})

    assert_equal "Burke", wagon_train.list.head.surname
  end

  def test_appends_another_wagon_to_train
    wagon_train = WagonTrain.new
    wagon_train.append("West", {"spare wagon tongues" => 3, "pounds of food" => 300})
    wagon_train.append("Burke", {"pounds of food" => 200})
    expected = {"spare wagon tongues" => 3, "pounds of food" => 500}

    assert_equal 2, wagon_train.count
    assert_equal expected, wagon_train.supplies
  end


end
