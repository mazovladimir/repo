print "Please enter your name: "
name = gets.chomp 
name.capitalize!
print "Please enter your height: "
height = gets.chomp.to_i
ideal = height-110

if ideal < 0
  puts "Hello #{name}, your weight is ideal"
else
  puts "Hello #{name}, you ideal weight is #{ideal}"
end
