require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'passanger_train.rb'
require_relative 'cargo_train.rb'

def self.addStation
  station = Station.new("s")
  station
end



loop do
  puts "0. Create first and last station"
  puts "1. Add station"
  puts "2. Create train"
  puts "3. Add railway carriage to train"
  puts "4. Detach railway carriage from train"
  puts "5. Move train to the station"
  puts "6. List trains on the station"
  puts "7. Exit"

  print "Choose the action: "
  input = gets.chomp.to_i
  break if input == 7

  case input
  when 1
    print "Enter the station name:  "
    s = gets.chomp
    addStation

  when 6
  end
end
