a = {}
obshee = 0

loop do

print "Vvedite nazvanie tovara: "
name = gets.chomp

if name == "stop"
  break
end
  
print "Vvedite cenu za tovar: "
price = gets.to_i

print "Vvedite kolichestvo tovara: "
count = gets.to_f

a[name] = {price => count}
end

puts a
a.each do |key1,value1| 
  value1.each do |key2,value2|
    total = key2 * value2    
    obshee += total
    puts "#{key1} - stoit #{total}"
  end
end

puts "Polnaya Stoimost v korzine - #{obshee}"
