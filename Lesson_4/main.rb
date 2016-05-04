require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_vagon'
require_relative 'passanger_vagon'

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
  when 2
    print "Please enter the train number:  "
    tNumber = gets.chomp
    print "Please enter the train type passanger/cargo:  "
    tType = gets.chomp.to_s
    print "Please etner the number of vagons:  "
    tVagon = gets.chomp.to_i
    train = Train.new(tNumber,tType,tVagon)
    puts "The #{train.type} train was created..."
    puts ""

  when 3
    train.vagon_attach(tVagon)
    puts "The railway carriage was added to the #{train.type} train..."
    puts "Now the train has #{train.vagon} vagonov..."
  end
end
