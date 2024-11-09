def part_one (array)
  steps = 0
  index = 0
  loop do
    break if index < 0 || index > array.length - 1

    jmp = array[index]
    if jmp != 0
      index, array[index] = index + jmp, array[index] + 1
    else
      array[index] += 1
    end

    steps += 1
  end
  steps
end

File.open('05.txt', 'r') do |file|
  lines = file.readlines(chomp: true).map(&:to_i)
  puts part_one(lines)
end