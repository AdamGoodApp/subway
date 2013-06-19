
L = ['8th ave', '6th ave','Union square','3rd ave','1st ave']
N =['8th st','Union square','West 23rd','West 28th','West 34th','Times square']
S =['Astor place','Union square','East 23rd','East 28th','East 33rd','Grand central']


#puts `clear`
print "**********Subway Mappr**********\n"

def gett() gets.chomp.downcase end

def check_input(array, input)
  p "That is not a valid station" if !(array.include? input)
end

def print_stations(line)
  line.each { |s| print "\n#{s}" }
  puts
end

def distance(x_index, y_index)
  x_index > y_index ? x_index - y_index : x_index - y_index
end

def assign_train(line)
 case line
  when 'l' then L
  when 'n' then N
  when '6' then S
 end
end

def get_train(line)
  case line
    when L then  'L'
    when N then  'N'
    when S then  '6'
  end
end

print "\nWhich line are you on?  (L) (N) (6)  "
line1 = assign_train(gett)

print "\nWhich station are you starting from?  "
print_stations line1
puts
start = gett.capitalize
check_input(line1, start)

#puts `clear`
print "\nWhich line would you like to get off at? (L) (N) (6)  "
line2 = assign_train(gett)

print "\nWhich station would you like to get off at?  "
print_stations line2
puts
stop = gett.capitalize
check_input(line2, stop)

if line1 == line2
  d = line2.index(stop) - line1.index(start)
  p "You have to travel #{d} stops on this train to #{stop}."
else
  d = distance( line1.index(start), line1.index('Union square') )
  d2 = distance( line2.index(stop), line2.index('Union square') )
  p "\nYou have to travel #{d} stops to Union Square, transfer to the #{get_train(line2)} line, and take it #{d2} stops to #{stop}"
end

