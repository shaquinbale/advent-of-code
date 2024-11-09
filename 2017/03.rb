=begin
layer = la
side length = sl

side length = (la * 2) + 1


calculate layer
  layer is the next highest odd perfect square (n^2 where n is every odd number)
calculate centers of the layer
  EAST is the odd perfect square of the previous layer + layer
  find the following 3 centers by incrementing layer*2
calculate distance to the nearest center
result = distance + layer
=end

def part_one(num)
  # Calculate layer
  layer = 0
  n = 1
  loop do
    if num <= n**2
      layer = (n - 1) / 2
      break
    end
  n += 2
  end

  # Calculate centers
  centers = Array.new(4, 0) # 0 = EAST, 1 = NORTH, 2 = WEST, 3 = SOUTH
  centers[0] = (2 * (layer - 1) + 1) ** 2 + layer # Perfect odd square of the previous layer + layer = EAST
  centers[1] = centers[0] + (layer * 2)
  centers[2] = centers[1] + (layer * 2) # The following centers  are found by adding (layer * 2) to EAST
  centers[3] = centers[2] + (layer * 2)

  # Calculate distance to the next center
  closest = centers.min_by { |x| (x - num).abs }
  distance = (closest - num).abs
  
  puts "answer is #{distance + layer}"  
end

puts part_one(347991)

