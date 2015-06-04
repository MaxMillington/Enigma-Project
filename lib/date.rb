require 'date'
require 'pry'

class Date
attr_reader(:date)


  def initialize(date = today)
    @date = date
  end

  def today
    Date.today.strftime("%d%m%y").split("-").join.to_i
  end

  def square
    today ** 2
  end

  def date_offset
    four_chars = square.to_s.chars.last(4)
    four_chars.map do |n|
      n.to_i
    end
  end

end

