require_relative 'key'
require_relative 'date'
require_relative 'enigma'
require_relative 'offsetter'

# #Write encryptor message in txt file
# #Open text file and extract the message to be encrypted
# #Put message into enigma class, received encrypted message.
# #Send encrypted message into a new txt file


class Encryptor

  def load(from_file)
    File.readlines(from_file).map do |line|
      enigma = Enigma.new("#{line}")
      key = Key.new.generate
      encrypted_message = enigma.encrypt
      date = Date.new.today

      "Your encrypted message is #{encrypted_message}, your key is #{key}, and your date is #{date}"

    end
  end

end

encryptor = Encryptor.new
# print encryptor.load(ARGV.shift || "encryptor.txt")

file = File.open("decryptor.txt", "w")
file.write(encryptor.load(ARGV.shift || "encryptor.txt"))



