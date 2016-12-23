input = File.read("input.txt").split("\n")

input.map! do |l|
  sp = l.split('-')
  [sp.take(sp.size - 1).join.chars.sort.join, sp.last]
end

total = 0

input.each do |i|
  alpha_count = {}

  ('a'..'z').each do |c|
    alpha_count[c] = i[0].count(c)
  end

  alpha_count = alpha_count.sort do |l, r|
    if (l[1] > r[1])
      1
    elsif (l[1] == r[1]) && (l[0] < r[0])
      1
    else
      -1
    end
  end

  name = alpha_count.last(5).join.chars.select.with_index { |_v, index| index.even? }.join.reverse

  secID, checksum = i[1].split('[')
  checksum.slice!(']')

  total += secID.to_i if name == checksum
end

puts total
