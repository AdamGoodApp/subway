
L = ['8th ave', '6th ave','Union square','3rd ave','1st ave']
N =['8th st','6th st','Union square','West 23rd','West 28th','West 34th','Times square']
SIX =['Astor place','Union square','East 23rd','East 28th','East 33rd','Grand central']


puts `clear`
print "**********Subway Mappr**********\n"

def gett
  gets.chomp.downcase
end

def check_input(array, input)
   if !(array.include? input)
     p "That is not a valid station"
   end
end

def print_stations(line)
  line.each do |station|
    print "\n#{station}   "
  end
  puts
end


print "\nWhich line are you on?  (L) (N) (6)  "
first_line = gett

print "\nWhich station are you starting from?  "
case first_line
  when 'l'
    first_line = L
    print_stations L
  when 'n'
    first_line = N
    print_stations N
  when '6'
    first_line = SIX
    print_stations SIX
end
puts
first_station = gett.capitalize
check_input(first_line, first_station)

puts `clear`
print "\nWhich line would you like to get off at? (L) (N) (6)  "
second_line = gett

print "\nWhich station would you like to get off at?  "
case second_line
  when 'l'
    second_line = L
    print_stations L
  when 'n'
    second_line = N
    print_stations N
  when '6'
    second_line = SIX
    print_stations SIX
end
puts
stop = gett.capitalize
check_input(second_line, stop)

first_index = first_line.index(first_station)
stop_index = second_line.index(stop)
union_index1 = first_line.index('Union square')
union_index2 = second_line.index('Union square')

if first_line == second_line
  d = stop_index - first_index
  p "You have to travel #{d} stops to #{stop}."
else
  d = first_index > union_index1 ? first_index - union_index1 : union_index1 - first_index
  d2 = first_index > union_index1 ? stop_index - union_index2 : union_index2 - stop_index
  p "You have to travel #{d} stops to Union Square, transfer to the #{second_line}
      line, and take it #{d2} stops to #{stop}"
end

