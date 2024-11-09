def part_one (input)
  sum = 0
  (0..input.length).each do |index|
    sum += input[index].to_i if input[index] == input[(index + 1) % input.length]
  end
  sum
end

def part_two (input)
  sum = 0
  half_length = input.length / 2
  (0..input.length).each do |index|
    sum += input[index].to_i if input[index] == input[(index + half_length) % input.length]
  end
  sum
end


File.open('01.txt', 'r') do |file|
  input = file.readline.chomp
  puts part_one(input)
  puts part_two(input)
end