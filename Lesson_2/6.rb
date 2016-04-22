loop do

print "Vvedite nazvanie tovara: "
name = gets.chomp

break if name == "stop"

print "Vvedite cenu za tovar: "
price = gets.to_i

print "Vvedite kolichestvo tovara: "
count = gets.to_f

a = {}

a[name] = {price => count}
total = count * price

end

puts "#{a}"
puts "#{name} stoit - #{total}"

