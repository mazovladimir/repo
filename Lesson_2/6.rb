a = {}

loop do

print "Vvedite nazvanie tovara: "
name = gets.chomp

break if name == "stop"
  
print "Vvedite cenu za tovar: "
price = gets.to_i

print "Vvedite kolichestvo tovara: "
count = gets.to_f

a[name] = {price => count}
end

puts a
all = 0
a.each do |key1,value1| 
  value1.each do |key2,value2|
    total = key2 * value2    
    all += total
    puts "#{key1} - stoit #{total}"
  end
end

puts "Polnaya Stoimost v korzine - #{all}"
