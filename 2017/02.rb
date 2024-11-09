def part_one(lines)
  checksum = 0
  lines.each do |line|
    array =  line.split.map(&:to_i)
    checksum += array.max - array.min
  end
  checksum
end

def part_two (lines)
  
  checksum = 0

  lines.each do |line|
    array =  line.split.map(&:to_i)
    array.each_with_index do |num1, index1|
      array.each_with_index do |num2, index2|
        next if index1 == index2
        if num1 % num2 == 0
          checksum += num1 / num2
        end
      end
    end
  end
  checksum
end

File.open('02.txt', 'r') do |file|
  lines = file.readlines.map
  puts part_one(lines)
  puts part_two(lines)
end
