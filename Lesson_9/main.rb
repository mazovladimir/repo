require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_vagon'
require_relative 'passanger_vagon'
require_relative 'cargo_train'
require_relative 'passanger_train'

class MyMenu
  @t = []
  class << self
  def menu
    loop do
      puts '0. Create first and last station'
      puts '1. Add station'
      puts '2. Create train'
      puts '3. Add railway carriage to train'
      puts '4. Detach railway carriage from train'
      puts '5. List trains on the station'
      puts '6. Show trains on all stations'
      puts '7. Next train station'
      puts '8. Before train station'
      puts '9. Exit'

      print 'Choose the action: '
      input = gets.chomp.to_i
      break if input == 9

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
        whereis_train
      when 6
        show_trains
      when 7
        next_station
      when 8
        before_station
      end
    end
  end

  private

  def new_route
    print 'Enter the first station: '
    f = gets.chomp
    f_st = Station.new('f')
    print 'Enter the last station: '
    l = gets.chomp
    l_st = Station.new('l')
    @fl = Route.new(f_st, l_st)
    p @fl
  end

  def add_station
    print 'Please enter the station name: '
    st_name = gets.chomp
    between_station = Station.new(st_name)
    @fl.add_station(between_station)
    p @fl
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
    @ptrain.route_inherit(@fl) if @ptrain.class == PassangerTrain
    @ctrain.route_inherit(@fl) if @ctrain.class == CargoTrain
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
    p @my_train
  end

  def vagon_detach
    puts 'Which train do you want to use ?'
    puts Train.my_trains
    print 'My choice is: '
    @train = gets.chomp
    @my_train = Train.find(@train)
    @my_train.vagon_detach
    p @my_train
  end

  def whereis_train
      puts 'Which train do you want to use ?'
      puts Train.my_trains
      print 'My choice is: '
      @train = gets.chomp
      @my_train = Train.find(@train)
      p @my_train.whatis_my_station
  end

  def next_station
    puts 'Which train do you want to use ?'
    puts Train.my_trains
    print 'My choice is: '
    @train = gets.chomp
    @my_train = Train.find(@train)
    @my_train.next_station
    p @my_train.whatis_my_station
  end

  def before_station
    puts 'Which train do you want to use ?'
    puts Train.my_trains
    print 'My choice is: '
    @train = gets.chomp
    @my_train = Train.find(@train)
    @my_train.before_station
    p @my_train.whatis_my_station
  end

  def show_trains
    ObjectSpace.each_object(Station) { |x| puts "#{x.name} - " }
  end
  end
end

MyMenu.menu
