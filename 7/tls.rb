input = File.read('input.txt').split("\n")

input.map! do |addr|
  ip = { outside: [], inside: [] }

  split_addr = lambda do |a|
    tmp = a.partition('[')
    ip[:outside].push(tmp[0])
    tmp2 = tmp[2].partition(']')
    ip[:inside].push(tmp2[0])
    split_addr.call(tmp2[2]) unless tmp2[2].empty?
  end

  split_addr.call(addr)

  ip
end

supported = 0

def contains_abba?(arr)
  contains = false
  arr.each do |x|
    (x.size - 3).times do |i|
      contains = true if x.chars[i] == x.chars[i+3] && x.chars[i+1] == x.chars[i+2] && x.chars[i] != x.chars[i+1]
    end
  end

  contains
end

input.each do |ips|
  supported += 1 if contains_abba?(ips[:outside]) && !contains_abba?(ips[:inside])
end

puts supported

puts "\nPart 2\n"

supports_ssl = 0

input.each do |ips|
  found = false

  ips[:outside].each do |i|
    (i.size - 2).times do |n|
      if i.chars[n] == i.chars[n+2] && i.chars[n] != i.chars[n+1]
        bab = "#{i.chars[n+1]}#{i.chars[n]}#{i.chars[n+1]}"
        ips[:inside].each do |inner|
          found = true if inner.include?(bab)
        end
      end
    end
  end
  
  supports_ssl += 1 if found
end


puts "#{supports_ssl} inputs support ssl"
