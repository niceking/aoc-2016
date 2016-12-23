require 'digest'

input = 'ffykfhsq'

found = (0..7).map { |i| [i.to_s, false] }.to_h
i = 1

puts found

loop do
  md5 = Digest::MD5.new
  md5 << "#{input}#{i}"
  if md5.hexdigest.start_with?('00000')
    if found[md5.hexdigest.chars[5]] == false
      found[md5.hexdigest.chars[5]] = md5.hexdigest.chars[6]
      puts found
    end
  end
  i += 1
  break unless found.values.include?(false)
end

puts found.values.join
