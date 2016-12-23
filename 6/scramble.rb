input = File.read('input.txt').split("\n")

letters = Array.new(8, '')

input.each do |line|
  (0..7).each { |j| letters[j] += line.chars[j] }
end

letters.map! { |l| l.chars.sort.join }

answer = Array.new(8)

letters.each_with_index do |line, i|
  count = 0
  ('a'..'z').each do |c|
    if line.count(c) > count
      answer[i] = c
      count = line.count(c)
    end
  end
end

puts answer.join
