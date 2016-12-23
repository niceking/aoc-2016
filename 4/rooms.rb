input = File.read("input.txt").split("\n")

input.map! do |l|
  sp = l.split('-')
  [sp.take(sp.size - 1), sp.last]
end

total = 0
legit_rooms = []

input.each do |i|
  alpha_count = {}

  ('a'..'z').each do |c|
    alpha_count[c] = i[0].join.count(c)
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
  secID = secID.to_i

  if name == checksum
    total += secID
    legit_rooms.push([i[0].join(" "), secID])
  end
end

puts total

##########################

puts "\npart 2\n"

alphabet = ('a'..'z').to_a

legit_rooms.map! do |rm|
  offset = rm[1] % 26 - 26
  phrase = rm[0].chars
  phrase.map! { |c| alphabet[alphabet.find_index(c) + offset] if alphabet.find_index(c) }

  [phrase.join, rm[1]]
end

legit_rooms.each do |r|
  puts r[1] if r[0].include?('northpoleobjects')
end
