require 'pry'
require_relative 'key'
require_relative 'date'
require_relative 'offsetter'

class Enigma
 attr_accessor(:key, :date, :message)

  def initialize(message, key = Key.new, date = Date.new)
    @message = message.downcase
    @key = key
    @date = date
    @offset = Offsetter.new(key).rotator_values
  end

  def quarter_slice
    @message.chars.each_slice(4).to_a
  end

  def character_map
    ("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]
  end

  def rotate_forward
    quarter_slice.map do |subarray|
      subarray.map.with_index do |character, index|
        new_index = (character_map.index(character) + @offset[index]).modulo(39)
        character_map[new_index]
      end
    end
  end

  def rotate_backward
    quarter_slice.map do |subarray|
      subarray.map.with_index do |character, index|
        new_index = (character_map.index(character) - @offset[index]).modulo(39)
        character_map[new_index]
      end
    end
  end

  def encrypt
    rotate_forward.flatten.join
  end

  def decrypt
    rotate_backward.flatten.join
  end

end

