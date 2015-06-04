require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/key'

class TestKeyGenerator < Minitest::Test
  def test_it_generates_random_number
    random_key1 = Key.new.generate
    random_key2 = Key.new.generate
    refute random_key1 == random_key2
  end

  def test_it_groups_key_into_four_two_digit_offset_numbers
    key = Key.new("54321")
    assert_equal [54,43,32,21], key.number_group
  end

end
