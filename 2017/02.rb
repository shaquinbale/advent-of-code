def part_one(lines)
  checksum = 0

  lines.each do |line|
    array =  line.split.map(&:to_i)
    checksum += array.max - array.min
  end

  checksum
end

File.open('02.txt', 'r') do |file|
  lines = file.readlines.map
  puts part_one(lines)
end
