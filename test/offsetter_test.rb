require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/offsetter'

class OffsetterTest < Minitest::Test

  def test_it_returns_the_key_in_groups_of_two
    offsetter = Offsetter.new(Key.new("54321"))
    assert_equal [54,43,32,21], offsetter.key_values
  end

  def test_it_returns_the_last_four_characters_of_the_squared_date
    offsetter = Offsetter.new
    assert_equal [8, 2, 2, 5], offsetter.date_to_key
  end


  def test_it_adds_the_key_values_to_the_date_values
    offsetter = Offsetter.new(Key.new("54321"))
    assert_equal [62, 45, 34, 26], offsetter.rotator_values
  end

end