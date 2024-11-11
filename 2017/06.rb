require 'set'

def part_one(banks)
  cycle = 0
  seen = Set.new
  until seen.include?(banks)
    seen.add(banks.dup)

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

def part_two(banks)
  cycle = 0
  seen = {}
  
  until seen.include?(banks)
    seen[banks.dup] = cycle

    max_value = banks.max
    distributor_index = banks.index(max_value)
    distribute_amount = banks[distributor_index]
    banks[distributor_index] = 0

    distribute_amount.times do |i|
      banks[(distributor_index + i + 1) % banks.size] += 1
    end
    
    cycle += 1
  end

  loop_start_cycle = seen[banks]
  cycle - loop_start_cycle
end

File.open('06.txt', 'r') do |file|
  banks = file.readline.split.map(&:to_i)
  puts part_one(banks)
  puts part_two(banks)
end