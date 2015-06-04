require_relative 'key'
require_relative 'date'


class Offsetter


def initialize(key = Key.new, date = Date.new)
  @key = key
  @date = date
end

  def date_to_key
    @date.date_offset
  end

  def key_values
    @key.number_group
  end

  def rotator_values
    new_values = []
    keys = key_values
    dates = date_to_key
    new_values << keys[0] + dates[0]
    new_values << keys[1] + dates[1]
    new_values << keys[2] + dates[2]
    new_values << keys[3] + dates[3]
  end

end

