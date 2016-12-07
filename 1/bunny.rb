steps = File.read("input.txt")
steps = steps.split(", ")

x = 0
y = 0
bearing = 0
visited = []


def new_bearing(bearing, step)
  step[0] == 'R' ? bearing += 90 : bearing -= 90
  bearing += 360 if bearing < 0
  bearing -= 360 if bearing >= 360
  bearing
end

def to_num(step)
  Integer(step[1..-1])
end

for step in steps
  bearing = new_bearing(bearing, step)
  step_n = to_num(step)

  if bearing == 0
    y += step_n
  elsif bearing == 90
    x += step_n
  elsif bearing == 180
    y -= step_n
  elsif bearing == 270
    x -= step_n
  end
end

puts "puzzle 1 - x: #{x} y: #{y}"

x = 0
y = 0
bearing = 0
visited = [[0,0]]

for step in steps
  bearing = new_bearing(bearing, step)
  step_n = to_num(step)

  if bearing == 0
    step_n.times do
      y += 1
      if visited.include?([x,y])
        puts "you have visited #{x}, #{y} already"
      end
      visited.push([x,y])
    end
  elsif bearing == 90
    step_n.times do
      x += 1
      if visited.include?([x,y])
        puts "you have visited #{x}, #{y} already"
      end
      visited.push([x,y])
    end
  elsif bearing == 180
    step_n.times do
      y -= 1
      if visited.include?([x,y])
        puts "you have visited #{x}, #{y} already"
      end
      visited.push([x,y])
    end
  elsif bearing == 270
    step_n.times do
      x -= 1
      if visited.include?([x,y])
        puts "you have visited #{x}, #{y} already"
      end
      visited.push([x,y])
    end
  end
end

puts "puzzle 2 - x: #{x} y: #{y}"
