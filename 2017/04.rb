def part_one(lines)
  valid_phrases = 0
  lines.each do |line|
    words = line.split
    valid_phrases += 1 if words.length == words.uniq.length
  end
  valid_phrases
end

def part_two(lines)
  valid_phrases = 0
  lines.each do |line|
    seen = []
    array = line.split
    is_valid = true
    
    array.each do |word|
      sorted_word = word.chars.sort.join
      if seen.include?(sorted_word)
        is_valid = false
        break
      else
        seen << sorted_word
      end
    end

    valid_phrases += 1 if is_valid
  end
  valid_phrases
end

File.open('04.txt', 'r') do |file|
  lines = file.readlines(chomp: true)
  puts part_one(lines)
  puts part_two(lines)
end