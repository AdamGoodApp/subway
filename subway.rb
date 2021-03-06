#----------  Train Lines ----------#
L = ['8th ave', '6th ave','Union square','3rd ave','1st ave']
N =['8th st','Union square','West 23rd','West 28th','West 34th','Times square']
S =['Astor place','Union square','East 23rd','East 28th','East 33rd','Grand central']

#----------  Helper Functions ----------#
def gett() gets.chomp.downcase end

def title(title) print ("-" * 20) + " #{title} " + ("-" * 20)  end

def check_input(array, input)
  if !(array.include? input)
    p "That is not a valid station"; gets
    exit
  end
end

def print_stations(line)
  line.each { |s| print "\n#{s}" }
  puts
end

def distance(x_index, y_index)
  x_index > y_index ? x_index - y_index : y_index - x_index
end

def assign_train(line)
 case line
  when 'l' then L
  when 'n' then N
  when '6' then S
  else
    p "Sorry, that train does not exist."; gets
    exit
 end
end

def get_train(line)
  case line
    when L then  'L'
    when N then  'N'
    when S then  '6'
  end
end

def plural(line)
   line > 1 ? "#{line} stops" : "#{line} stop"
end

def direction(stop, line)
  case line
   when L then line.index(stop) > line.index('Union square') ? 'eastbound' : 'westbound'
   when N then line.index(stop) > line.index('Union square') ? 'northbound' : 'southbound'
   when S then line.index(stop) > line.index('Union square') ? 'northbound' : 'southbound'
  end
end

#----------  Application ----------#
puts `clear`
puts title('Subway Mappr')
puts '     ========================================================='
puts '    /__|     OOOOOOOOOOOOO        | [  ] | [  ] |      [_]  [_] \ '
puts '  /             NY MTA           | [  ] | [  ] |                 \ '
puts '  \________________________________|___ |___ |_____________________\ '
puts '    ()==()    === ++++ ===   ()==()       ()==()     +++   ++++++++ '
puts '============================================ '
puts " I'm going to help you find your way around the Big Apple! "

print "\nWhich line are you on?  (L) (N) (6)  "
line1 = assign_train(gett)

print "\nWhich station are you starting from?  "
print_stations line1
puts
start = gett.capitalize
check_input(line1, start)

puts `clear`
print "\nWhich line would you like to get off at? (L) (N) (6)  "
line2 = assign_train(gett)

print "\nWhich station would you like to get off at?  "
print_stations line2
puts
stop = gett.capitalize
check_input(line2, stop)

puts `clear`
title('Your Directions')

index = 0
if line1 == line2
  d = line2.index(stop) - line1.index(start)
  puts "You have to travel #{d} stops on this train to #{stop}."
else
  d = distance( line1.index(start), line1.index('Union square') )
  d2 = distance( line2.index(stop), line2.index('Union square') )
  print "\n (#{index+=1}) Travel #{plural(d)} to Union square." if d >= 1
  print "\n (#{index+=1}) Transfer to the #{get_train(line2)} line traveling #{direction(stop,line2)}."
  print "\n (#{index+=1}) Take it #{plural(d2)} to #{stop}.\n"
end

puts "\nHave a pleasant trip!"
gets


