str = File.read("input.txt")
str = str.split("\n").map! { |x| x.split(" ").map(&:to_i).sort}

valid = 0

str.each do |x|
  valid += 1 if ( x[0] + x[1] > x[2] )
end

puts "num valid triangle is #{valid}"

##########################

puts "part 2"

s2 = File.read("input.txt").split("\n").map! { |x| x.split(" ").map(&:to_i)}
sorted = []

s2.each_slice(3) do |sl|
  3.times do |i|
    sides = []
    3.times do |j|
      sides.push(sl[j][i])
    end
    sorted.push(sides)
  end
end

sorted.map! { |x| x.sort }

valid2 = 0

sorted.each do |x|
  valid2 += 1 if ( x[0] + x[1] > x[2] )
end

puts "num valid triangle is #{valid2}"
