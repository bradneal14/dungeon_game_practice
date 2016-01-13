require_relative 'd_player.rb'
require_relative 'd_room'

class Dungeon

  attr_reader :player


  def initialize(name, location)
    @player = Player.new(name, location)
    @rooms = []
  end

  def add_room(room_name, description, connections)
    @rooms << Room.new(room_name, description, connections)
  end

  def start(room_name)
    player.location = room_name
    #puts "the players loaction is #{player.location.class}"
    show_current_location
  end

  def show_current_location
    find_room_in_dungeon(@player.location)
  end


  def find_room_in_dungeon(loc)
    count = 0
    @rooms.each do |place|
      # puts "the current place that it is checking is #{place}"
      # puts "its room name is #{place.room_name}"
      # puts "an inspection of that room yields #{place.room_name.inspect}"
      # puts "the type of the room name is #{place.room_name.class}"
      if place.room_name == loc
        count += 1
        place.full_description
        return place.room_name
      end
    end
    if count == 0
      p "sorry no room with that name"
    end
  end

  def find_room_in_direction(direction)
    count = 0
    @rooms.each do |place|
      if place.connections.has_key?(direction)
        count += 1
        find_room_in_dungeon(place.connections[direction])
     end
    end
    if count == 0
      puts "invalid direction please try again"
    end
  end

  def go(direction)
    puts "you go " + direction.to_s
    @player.location = find_room_in_direction(direction)
    #show_current_location
  end

end
