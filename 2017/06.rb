=begin
  Increment cycle counter
  Break if this array is a duplicate
  Note the current banks on our array
  Find bank with most blocks b (tie break by lowest index)
  Distribute 1 to each block after the current b times
=end

def part_one(banks)
  cycle = 0
  seen = []
  loop do
    break if seen.include?(banks) # Break if this array is a duplicate
    seen << banks.dup # Add the current banks to our array on our array

    # Find bank with most blocks (tie break by lowest index)
    max_value = banks.max
    distributor_index = banks.index(max_value)
    distribute_amount = banks[distributor_index]
    banks[distributor_index] = 0

    # Distribute 1 to each block after the current b times
    distribute_amount.times do |i|
      banks[(distributor_index + i + 1) % 16] += 1
    end
    cycle += 1
  end
  cycle
end

File.open('06.txt', 'r') do |file|
  banks = file.readline.split.map(&:to_i)
  puts part_one(banks)
end