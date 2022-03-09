# puts 'Write text'
# string = gets.chomp
# puts 'Choose code'
# key = gets.chomp.to_i % 26

def cipher(string, key)
  raise ArgumentError, 'key must be below 26' if key > 26
  raise ArgumentError, 'Argument is not a sting' unless string.is_a?(String)

  caesar_string = string.chars.map do |c|
    case c
    when 'a'..'z'
      num = c.ord + key
      # to cycle back to 'a'
      num > 'z'.ord ? (num - 26).chr : num.chr
    when 'A'..'Z'
      num = c.ord + key
      num > 'Z'.ord ? (num - 26).chr : num.chr
    else
      c # so it doesnt transform number and special characters cuz pain
    end
  end
  caesar_string.join
end

# puts cipher(string, key)
