require_relative 'd_player'

class Room

  attr_accessor :room_name, :description, :connections

  def initialize(room_name, description, connections, player)
    @room_name = room_name
    @player = player
    @description = description
    @connections = {}
    hash_add(connections)
  end

  def hash_add(connections)
    @connections.merge!(connections)
  end


  def full_description
    puts player.name
    puts "you are in " + room_name.to_s
    puts description
  end


end
