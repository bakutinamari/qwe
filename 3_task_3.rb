class Train 
  attr_reader :number, :type, :carriages_count, :speed

  def initialize(number, type, carriages_count)
    @number = number
    @type = type
    @carriages_count = carriages_count
    @speed = 0
  end
  
  def speed_up(value)
    speed += value
  end
  
  def speed_down
    speed = 0
  end
  
  def add_wagon
    carriages_count + 1 if speed = 0
  end
  
  def del_wagon
    carriages_count - 1 if carriages_count > 0
  end
  
  def add_route(route)
    route = route
    current_station_index = 0
    current_station = route.stations(current_station_index)
    current_station.add_trains(self)
  end
  
  def forward
    if current_station_index < route.stations.size
       current_station_index += 1
       route.stations(current_station_index - 1).del_trains(self)
       route.stations(current_station_index).add_trains(self)
    end
  end
  
  def backward
    if current_station_index > route.stations.size
       current_station_index -= 1
       route.stations(current_station_index + 1).del_trains(self)
       route.stations(current_station_index).add_trains(self)
    end
  end
  
  def get_actual_station
      route.stations(current_station_index)
  end
  
  def get_next_station
     route.stations(current_station_index + 1)
  end
  
  def get_prev_station
     route.stations(current_station_index - 1)
  end
end
