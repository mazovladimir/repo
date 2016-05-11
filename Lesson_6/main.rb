require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_vagon'
require_relative 'passanger_vagon'
require_relative 'cargo_train'
require_relative 'passanger_train'

class MyMenu
  @t = []
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
        fandlstations
      when 1
        add_station
      when 2
        create_train
      when 3
        new_vagon_attach
      when 4
        new_vagon_detach
      when 5
        move_train
      when 6
        where_am_i
      end
    end
  end

private

def self.fandlstations
  print "Enter the first station: "
  f = gets.chomp
  print "Enter the last station: "
  l = gets.chomp
  @fl = Route.new(f,l)
  p @fl
end

def self.add_station
  print "Please enter the station name: "
  st_name = gets.chomp
  @sn = @fl.add_station(st_name)
  p @sn
end

def self.create_train
  print "Please enter the number train: "
  @n = gets.chomp
  print "Please enter the type passanger/cargo: "
  @t = gets.chomp
  print "Please enter the number of vagons: "
  @v = gets.chomp
  
  @pTrain = PassangerTrain.new(@n,@t,@v) if @t == 'passanger'
  @cTrain = CargoTrain.new(@n,@t,@v) if @t == 'cargo'

  p @pTrain
  p @cTrain
end

def self.new_vagon_attach
  puts "Which train do you want to use ?"
  puts Train.my_trains
  print "My choice is: "
  @w_t = gets.chomp
  @use_train = Train.find(@w_t)
  if @use_train.class == PassangerTrain
    @pVagon = PassangerVagon.new
    @use_train.vagon_attach(@pVagon)
  elsif @use_train.class == CargoTrain
    @cVagon = CargoVagon.new
    @use_train.vagon_attach(@cVagon)
  end
  p @use_train
end

def self.new_vagon_detach
  puts "Which train do you want to use ?"
  puts Train.my_trains
  print "My choice is: "
  @d_v = gets.chomp
  @delete_use_train = Train.find(@d_v)
  @delete_use_train.vagon_detach(@pVagon)
  @delete_use_train.vagon_detach(@cVagon)
  p @delete_use_train
end

def self.move_train
  puts "Which train do you want to use ?"
  puts Train.my_trains
  print "My choice is: "
  @m_t = gets.chomp
  @select_train = Train.find(@m_t)
  puts "Which station do you want to move the train ?"
  p @fl.stationS
  @choose_station = @fl.stationS
  @m_st = gets.chomp
  @select_train.route_inherit(@fl)
end

def self.where_am_i
  puts "Which train do you want to use ?"
  puts Train.my_trains
  print "My choice is: "
  @iam = gets.chomp
  @select_train.change_index(@m_st)
  @list_train = Train.find(@iam)
  @list_train.whatis_my_station
end

end

MyMenu.menu
