print "Enter the date: "
date = gets

print "Enter the month: "
month = gets

print "Enter the year: "
year = gets

months = {"January" => 31, "Febraury" => 28, "March" => 31, "April" => 30, "May" => 31, "June" => 30, "July" => 31, "August" =>31, "September" => 30, "October" => 31, "November" => 30, "December" => 31}
months.each {|key,value| puts "#{key}" if value == 30 }
