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
      puts '0. Create first and last station'
      puts '1. Add station'
      puts '2. Create train'
      puts '3. Add railway carriage to train'
      puts '4. Detach railway carriage from train'
      puts '5. Move train to the station'
      puts '6. List trains on the station'
      puts '7. Show trains on all stations'
      puts '8. Next train station'
      puts '9. Before train station'
      puts '10. Exit'

      print 'Choose the action: '
      input = gets.chomp.to_i
      break if input == 10

      case input

      when 0
        new_route
      when 1
        add_station
      when 2
        create_train
      when 3
        vagon_attach
      when 4
        vagon_detach
      when 5
        move_train
      when 6
        whereis_train
      when 7
        show_trains
      when 8
        next_station
      when 9
        before_station
      end
    end
  end

  private

  class << self
  def new_route
    print 'Enter the first station: '
    f = gets.chomp
    print 'Enter the last station: '
    l = gets.chomp
    @fl = Route.new(f, l)
  end

  def add_station
    print 'Please enter the station name: '
    st_name = gets.chomp
    @sn = @fl.add_station(st_name)
  end

  def create_train
    begin
      print 'Please enter the number train: '
      @n = gets.chomp
      print 'Please enter the type passanger/cargo: '
      @t = gets.chomp
      print 'Please enter the number of vagons: '
      @v = gets.chomp
      if @t == 'passanger'
        print 'Please enter the number of places: '
        @p = gets.chomp
      elsif @t == 'cargo'
        print 'Please enter the volume: '
        @vol = gets.chomp
      end

      raise "The number of the train can't be empty" if @n.empty?
      raise 'Use passanger/cargo' if (@t != 'passanger') && (@t != 'cargo')

      @ptrain = PassangerTrain.new(@n, @t, @v, @p) if @t == 'passanger'
      @ctrain = CargoTrain.new(@n, @t, @v, @vol) if @t == 'cargo'

    rescue RuntimeError => e
      puts e
      puts
      retry
    end
    puts 'The train was successfully created'
  end

  def vagon_attach
    puts 'Which train do you want to use ?'
    puts Train.my_trains
    print 'My choice is: '
    @train = gets.chomp
    @my_train = Train.find(@train)
    if @my_train.class == PassangerTrain
      @pvagon = PassangerVagon.new if @pvagon.nil?
      @use_train.vagon_attach(@pvagon)
    elsif @my_train.class == CargoTrain
      @cvagon = CargoVagon.new if @cvagon.nil?
      @my_train.vagon_attach(@cvagon)
    end
  end

  def vagon_detach
    puts 'Which train do you want to use ?'
    puts Train.my_trains
    print 'My choice is: '
    @train = gets.chomp
    @my_train = Train.find(@train)
    @my_train.vagon_detach(@pvagon)
    @my_train.vagon_detach(@cvagon)
  end

  def move_train
    puts 'Which train do you want to use ?'
    puts Train.my_trains
    print 'My choice is: '
    @train = gets.chomp
    @my_train = Train.find(@train)
    puts 'Which station do you want to move the train ?'
    p @fl.stations
    # @choose_station = @fl.stations
    @m_st = gets.chomp
    @my_train.route_inherit(@fl)
  end

  def whereis_train
    puts 'Which train do you want to use ?'
    puts Train.my_trains
    print 'My choice is: '
    @train = gets.chomp
    # @my_train = Train.find(@train)
    @my_train.change_index(@m_st)
    @my_train = Train.find(@train)
    @my_stat = @my_train.whatis_my_station
  end

  def next_station
    puts 'Which train do you want to use ?'
    puts Train.my_trains
    print 'My choice is: '
    @train = gets.chomp
    @my_train = Train.find(@train)
    @my_train.route_inherit(@fl)
    @my_train.next_station
    puts "Your current station is  #{@my_train.current_station}"
  end

  def before_station
    puts 'Which train do you want to use ?'
    puts Train.my_trains
    print 'My choice is: '
    @train = gets.chomp
    @my_train = Train.find(@train)
    @my_train.route_inherit(@fl)
    @my_train.before_station
    puts "Your current station is  #{@my_train.current_station}"
  end

  def show_trains
    @sn.each do |_sn|
      puts "There is a train on the #{@sn} station"
    end
  end
  end
end

MyMenu.menu
