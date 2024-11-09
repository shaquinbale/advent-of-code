def part_one(lines)
  valid_phrases = 0
  lines.each do |line|
    words = line.split
    valid_phrases += 1 if words.length == words.uniq.length
  end
  valid_phrases
end

File.open('04.txt', 'r') do |file|
  lines = file.readlines(chomp: true)
  puts part_one(lines)
end