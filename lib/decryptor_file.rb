require_relative 'key'
require_relative 'date'
require_relative 'enigma'
require_relative 'offsetter'
require_relative 'encryptor_file'

class Decryptor

  def load(from_file)
    puts "What is the key?"
    input = gets.chomp
    File.readlines(from_file).map do |line|
      enigma = Enigma.new("#{line}", Key.new("#{input}"))
      key = Key.new.generate
      decrypted_message = enigma.decrypt
      date = Date.new.today

      "Your decrypted message is #{decrypted_message}, your key is #{key}, and your date is #{date}"

    end
  end

end




decryptor = Decryptor.new

file = File.open("new_encryptor.txt", "w")
file.write(decryptor.load(ARGV.shift || "decryptor.txt"))

