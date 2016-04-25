print "Enter the date: "
date = gets.to_i

print "Enter the month: "
month = gets.to_i

print "Enter the year: "
year = gets.to_i

all_day = 0

months = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]

if (year==2000) || ((year%4==0 || year%400==0) && (year%100!=0))
  months[1] = 29
  puts "God visokosniy"
end

months.each_index do |day|
  all_day += months[day] if (day + 1) < month
end

all_day += date
puts all_day
