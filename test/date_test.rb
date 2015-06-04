require "minitest/autorun"
require "minitest/pride"

require_relative "../lib/date"

class DateTest < Minitest::Test
  def test_it_exists
    assert Date.new
  end

  def test_it_squares_numbers
    date = Date.new
    assert_equal date.today * date.today, date.square
  end

  def test_it_returns_individual_rotation_numbers
    date = Date.new
    assert_equal [8,2,2,5], date.date_offset
  end



end