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

final_coords = []

legal_moves =               { '1' => [2, 0],
               '2' => [1, 1], '3' => [2, 1], '4' => [3, 1],
'5' => [0, 2], '6' => [1, 2], '7' => [2, 2], '8' => [3, 2], '9' => [4, 4],
               'A' => [1, 3], 'B' => [2, 3], 'C' => [3, 3],
                              'D' => [2, 4]}

str.each do |line|
  line.split('').each do |st|
    if st == 'U'
      y -= 1 if legal_moves.value?([x, y - 1])
    elsif st == 'D'
      y += 1 if legal_moves.value?([x, y + 1])
    elsif st == 'L'
      x -= 1 if legal_moves.value?([x - 1, y])
    elsif st == 'R'
      x += 1 if legal_moves.value?([x + 1, y])
    end
  end
  final_coords.push([x, y])
end

final_coords.each { |coord| puts legal_moves.key(coord) }
