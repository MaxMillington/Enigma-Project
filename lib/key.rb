class Key

  def initialize (number = generate)
    @number = number
  end

  def generate
    @number = (0...5).map { rand(9) }.join
  end

  def number_group
    num = @number.chars.each_cons(2).map do|j|
      j.join
    end

    num.map! do |n|
      n.to_i
    end
  end
end
