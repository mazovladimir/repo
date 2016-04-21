print "Vvedite koef a: "
a = gets.to_i
print "Vvedite koef b: "
b = gets.to_i
print "Vvedite koef c: "
c = gets.to_i

D = b**2 - 4*a*c

if D < 0 
    puts "D=#{D}, Korney net"
end

if D > 0 
    x1 = (-b + Math.sqrt(D)) / (2*a) 
    x2 = (-b - Math.sqrt(D)) / (2*a)
    puts "D=#{D}, x1 = #{x1}, x2 = #{x2}"
end

if D == 0
   x = -b/(2*a)
   puts "D=#{D}, x = #{x}"
end
