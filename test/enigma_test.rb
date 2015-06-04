require "minitest/autorun"
require "minitest/pride"

require_relative "../lib/enigma"

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new("hello")
    assert enigma
  end

  def test_it_returns_a_key
    enigma = Enigma.new("message")
    assert enigma.key
  end

  def test_it_returns_a_date
    enigma = Enigma.new("message")
    assert enigma.date
  end

  def test_it_slices_message_into_four_character_slices
    enigma = Enigma.new("message")
    assert_equal [["m", "e", "s", "s"], ["a", "g", "e"]], enigma.quarter_slice
  end

  def test_it_successfully_rotates_forward_an_easy_message_with_easy_key
    enigma = Enigma.new("ab", Key.new("01010"))
    assert_equal [["j","n"]], enigma.rotate_forward
  end

  def test_it_successfully_rotates_a_long_message
    enigma = Enigma.new("message", Key.new("19283"))
    assert_equal [["a", "u", "j", "2"], ["1", "w", "8"]], enigma.rotate_forward
  end

  def test_it_successfully_rotates_backward_an_easy_message
    enigma = Enigma.new("jn", Key.new("01010"))
    assert_equal [["a", "b"]], enigma.rotate_backward
  end

  def test_it_successfully_rotates_backward_a_long_message
    enigma = Enigma.new("auj21w8", Key.new("19283"))
    assert_equal [["m", "e", "s", "s"], ["a", "g", "e"]], enigma.rotate_backward
  end

  def test_it_encryptes_easy_message_with_easy_key
    enigma = Enigma.new("ab", Key.new("10101"))
    assert_equal "se", enigma.encrypt
  end

  def test_it_encryptes
    enigma = Enigma.new("Open the POD bay doors please HAL", Key.new("54321"))
    assert_equal ".v,auzc4uvj3uh8lujjbby5c8k8f1dc08", enigma.encrypt
  end

  def test_it_decryptes_easy_message_with_easy_key
    enigma = Enigma.new("se", Key.new("10101"))
    assert_equal "ab", enigma.decrypt
  end

  def test_it_decryptes
    enigma = Enigma.new(".v,auzc4uvj3uh8lujjbby5c8k8f1dc08", Key.new("54321"))
    assert_equal ("open the pod bay doors please hal"), enigma.decrypt
  end


end