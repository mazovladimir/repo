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

ravnobed = 'a==b || b==c || a==c'

pifagor = storona1**2+storona2**2-gipotenuza**2


if (pifagor == 0) && (a==b || b==c || a==c)
  puts "Treugolnik yavlyaetsa pryamopugolnim i ravnobedrennim"
elsif pifagor == 0
  puts "Treugolnik yavlyaetsa pryamopugolnim"
end

if a==b || b==c || a==c
  puts "Treugilnik yavlyaetsa ravnobedrennim i ravnostoronnim"
end
