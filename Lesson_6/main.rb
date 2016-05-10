require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_vagon'
require_relative 'passanger_vagon'
require_relative 'cargo_train'
require_relative 'passanger_train'

class MyMenu
  @t = []
  @pVagon = PassangerVagon.new
  @cVagon = CargoVagon.new
  def self.menu
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

      when 0
        print "Enter the first station: "
        f = gets.chomp
        print "Enter the last station: "
        l = gets.chomp
        @fl = fandlstations(f,l)
        p @fl
      when 1
        print "Please enter the station name: "
        st_name = gets.chomp
        @sn = @fl.add_station(st_name)
        p @sn

      when 2
        print "Please enter the number train: "
        n = gets.chomp
        print "Please enter the type passanger/cargo: "
        t = gets.chomp
        print "Please enter the number of vagons: "
        v = gets.chomp
        @t << create_train(n,t,v)
        p @t

      when 3
        puts "Which train do you want to use ?"
        puts @t 
        print "Type the number of train: " 
        @v = gets.chomp.to_i
        @inst_train = @t[@v-1]
        @inst_train.vagon_attach(@cVagon)
        

      when 5
        puts "Which train do you want to use ?"
        puts ObjectSpace.each_object(Train) {|x| puts "#{x} - #{x.object_id}"}

      when 6
        Train.self
      end
    end
  end
end

def fandlstations(first,last)
  Route.new(first,last)
end

def create_train(n,t,v)
  Train.new(n,t,v)
end

def move_train
  Station.new
end


MyMenu.menu

#station1 = Station.new("Kazan")
#puts "New Station was created #{station1.name}"
#station2 = Station.new("Moscow")
#puts "New Station was created #{station2.name}"
#station3 = Station.new("Samara")
#puts "New Station was created #{station3.name}"
#pTrain = PassangerTrain.new(801,"passanger",5)
#puts "New passanger train #{pTrain.number} was created..."
#pTrain = PassangerTrain.new(802,"passanger",50)
#puts "New passanger train #{pTrain.number} was created..."
#cTrain = CargoTrain.new(902,"cargo",20)
#puts "New cargo train #{cTrain.number} was created..."
#pVagon = PassangerVagon.new
#cVagon = CargoVagon.new
#pTrain.vagon_attach(pVagon)
#puts "New vagon was attached to the passanger train, the train has #{pTrain.vagons} vagons"
#cTrain.vagon_attach(cVagon)
#puts "New vagon was attached to the cargo train, the train has #{cTrain.vagons}  vagons"
#pTrain.company_name = "ONE"
#puts pTrain.company_name
#pVagon.company_name = "TWO"
#puts pVagon.company_name
#cVagon.company_name = "THREE"
#puts cVagon.company_name
#puts "Stations #{Station.all} is available now... "
#Train.find(801)
#Train.find(902)
#Train.find(903)
#Train.instances
#cTrain.register_instance
