str = File.read("input.txt")
str = str.split("\n").map! { |x| x.split(" ").map(&:to_i).sort}

valid = 0

str.each do |x|
  valid += 1 if ( x[0] + x[1] > x[2] )
end

puts valid
