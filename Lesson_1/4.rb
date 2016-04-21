print "Vvedite koef a: "
a = gets.to_f
print "Vvedite koef b: "
b = gets.to_f
print "Vvedite koef c: "
c = gets.to_f

D = b**2 - 4*a*c

if D < 0 
  puts "D=#{D}, Korney net"
elsif D > 0 
  x1 = (-b + Math.sqrt(D)) / (2*a) 
  x2 = (-b - Math.sqrt(D)) / (2*a)
  puts "D=#{D}, x1 = #{x1}, x2 = #{x2}"
else
  x = -b/(2*a)
  puts "D=#{D}, x = #{x}"
end
