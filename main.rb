require './rover.rb'
require './plateau'

# Read STDINT
input = []
$stdin.each_line do |line|
  input << line.chomp!
end

# Get size of the plateau
plateau_size = input[0].split(' ').map(&:to_i)
# Create new Plateau
@plateau = Plateau.new(*plateau_size)

# Get initial position for each Rover
# Move the Rover
# Print out its end position
input[1..-1].each_slice(2) do |rover_moves|
  rover_init_position = rover_moves[0].split(' ')
  rover_init_position[0] = rover_init_position[0].to_i
  rover_init_position[1] = rover_init_position[1].to_i
  rover_route = rover_moves[1]

  rover = Rover.new(*rover_init_position, @plateau)
  rover.ride(rover_route)
  puts "#{rover.current_position[:x]} " +
       "#{rover.current_position[:y]} " +
       "#{rover.current_position[:facing]}"
end
