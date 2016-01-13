class Player

  attr_reader :name, :location
  attr_writer :location

  def initialize(name, location)
    @name = name
    @location = location
  end

end
