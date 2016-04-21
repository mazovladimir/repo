print "Vvedite pervuyu storonu: "
a = gets.to_f
print "Vvedite vtoruyu storonu: "
b = gets.to_f
print "Vvedite tretyu storonu: "
c = gets.to_f

if a > b
  gipotenuza = a
  storona1=b
  storona2=c
else
  gipotenuza = b
  storona1=a
  storona2=c
end

if c > gipotenuza
  gipotenuza=c
  storona1=a
  storona2=b
end

ravnobed = '#{a}==#{b} || #{b}==#{c} || #{a}==#{c}'

formula = '#{storona1}**2+#{storona2}**2 == #{gipotenuza}**2'


if formula && ravnobed
  puts "Treugolnik yavlyaetsa pryamopugolnim i ravnibedrennim"
elsif formula
  puts "Treugolnik yavlyaetsa pryamopugolnim"
end
