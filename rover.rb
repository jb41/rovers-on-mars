# TO DO:
#   * Add method move_possible?
#     Check if Rover can do the move (if it's not trying to go outside the plateau)
#     Get size of the plateau
#   * Check if Rover is initialised with correct params
#   * Add #ride(String) method which do the ride over the plateau
class Rover

  # Initialize Rover
  #
  # Set his initial position and facing
  def initialize(x, y, facing)
    @x = x
    @y = y
    @facing = facing
  end

  # Turn the rover
  # side can be 'L' or 'R'
  def turn(side)
    @facing = get_next_direction(side)
  end

  # Move Rover to the side its facing
  def move
    case @facing
    when 'N'
      @y += 1
    when 'S'
      @y -= 1
    when 'E'
      @x += 1
    when 'W'
      @x -= 1
    else
      raise 'Wrong move.'
    end
  end

  # Get current position and facing of a Rover
  def current_position
    {
      x: @x,
      y: @y,
      facing: @facing
    }
  end

  protected

    # Directions
    DIRECTIONS = %w{N E S W}

    # Get the next direction for a Rover
    # side can be 'L' or 'R'
    def get_next_direction(side)
      index = DIRECTIONS.find_index(@facing)
      index = -1 if index == 3

      if side == 'L'
        DIRECTIONS[index - 1]
      elsif side == 'R'
        DIRECTIONS[index + 1]
      else
        raise 'Bad side.'
      end
    end

end
