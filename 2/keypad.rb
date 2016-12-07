str = File.read("input.txt")
str = str.split("\n")

x = 1
y = 1

str.each do |line|
  line.split('').each do |st|
    if st == 'U'
      y -= 1 unless y == 0
    elsif st == 'D'
      y += 1 unless y == 2
    elsif st == 'L'
      x -= 1 unless x == 0
    elsif st == 'R'
      x += 1 unless x == 2
    end
  end
  puts "#{x}, #{y}"
end

puts "alternate layout"

x = 0
y = 2

legal_moves =  [[2, 0],
        [1, 1], [2, 1], [3, 1],
[0, 2], [1, 2], [2, 2], [3, 2], [4, 4],
        [1, 3], [2, 3], [3, 3],
                [2, 4]]

str.each do |line|
  line.split('').each do |st|
    if st == 'U'
      y -= 1 if legal_moves.include?([x, y - 1])
    elsif st == 'D'
      y += 1 if legal_moves.include?([x, y + 1])
    elsif st == 'L'
      x -= 1 if legal_moves.include?([x - 1, y])
    elsif st == 'R'
      x += 1 if legal_moves.include?([x + 1, y])
    end
  end
  puts "#{x}, #{y}"
end
