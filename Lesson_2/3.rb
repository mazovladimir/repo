limit = 100
fib_sum = 0
a = [ 1, 1 ]

a.each do |fib_sum|
  fib_sum = a[-1] + a [-2]
  a << fib_sum if fib_sum < 100
end

puts "#{a}"
