require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_vagon'
require_relative 'passanger_vagon'
require_relative 'cargo_train'
require_relative 'passanger_train'

#loop do
#  puts "0. Create first and last station"
#  puts "1. Add station"
#  puts "2. Create train"
#  puts "3. Add railway carriage to train"
#  puts "4. Detach railway carriage from train"
#  puts "5. Move train to the station"
#  puts "6. List trains on the station"
#  puts "7. Exit"
#
#  print "Choose the action: "
#  input = gets.chomp.to_i
#  break if input == 7
#
#  case input
#  when 2
#    print "Please enter the train number:  "
#    tNumber = gets.chomp
#    print "Please enter the train type passanger/cargo:  "
#    tType = gets.chomp.to_s
#    print "Please etner the number of vagons:  "
#    tVagon = gets.chomp.to_i
#    train = Train.new(tNumber,tType,tVagon)
#    puts "The #{train.type} train was created..."
#    puts ""
#
#  when 3
#    train.vagon_attach(tVagon)
#    puts "The railway carriage was added to the #{train.type} train..."
#    puts "Now the train has #{train.vagon} vagonov..."
#  end
#end

station = Station.new("Kazan")
puts "New Station was created #{station.name}"

pTrain = PassangerTrain.new(801,"passanger",5)
puts "New passanger train #{pTrain.number} was created..."

cTrain = CargoTrain.new(902,"cargo",20)
puts "New cargo train #{cTrain.number} was created..."

pVagon = PassangerVagon.new

cVagon = CargoVagon.new

pTrain.vagon_attach(pVagon)
puts "New vagon was attached to the passanger train, the train has #{pTrain.vagons} vagons"

cTrain.vagon_attach(cVagon)
puts "New vagon was attached to the cargo train, the train has #{cTrain.vagons}  vagons"

station.in_train(pTrain.number)
station.in_train(cTrain.number)
puts "There is a #{station.my_trains} on the #{station.name} station"
