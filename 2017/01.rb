def sum_from_index (input)
  sum = 0
  (0..input.length).each do |index|
    sum += input[index].to_i if input[index] == input[(index + 1) % input.length]
  end
  sum
end

File.open('01.txt', 'r') do |file|
  puts sum_from_index(file.readline.chomp)
end