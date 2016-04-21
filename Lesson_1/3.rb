print "Vvedite pervuyu storonu: "
a = gets.to_i
print "Vvedite vtoruyu storonu: "
b = gets.to_i
print "Vvedite tretyu storonu: "
c = gets.to_i

if a > b
    max = a
else
    max = b
end

if c > max then
    max = c
end


if (a**2+b**2) == (max**2) && ((a==b) || (b==c) || (a==c))
    puts "Treugolnik yavlyaetsa pryamopugolnim i ravnibedrennim"
elsif (a**2+b**2) == (max**2)
    puts "Treugolnik yavlyaetsa pryamopugolnim"
end

if (a==b) && (b==c) && (a==c)
    puts "Treugolnik ravnobedrenniy i ravnostoronnii"
end
