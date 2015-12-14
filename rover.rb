class Rover

  # Initialize Rover
  #
  # Set his initial position and facing
  def initialize(x, y, facing, plateau)
    if x.is_a?(Integer) && y.is_a?(Integer) &&
       DIRECTIONS.include?(facing) && plateau.is_a?(Plateau)
      @x = x
      @y = y
      @facing = facing
      @plateau = plateau
    else
      raise 'Wrong arguments.'
    end
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
      @y += 1 if move_possible?(@x, @y+1)
    when 'S'
      @y -= 1 if move_possible?(@x, @y-1)
    when 'E'
      @x += 1 if move_possible?(@x+1, @y)
    when 'W'
      @x -= 1 if move_possible?(@x-1, @y)
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

  def ride(route)
    route.each_char do |char|
      case char
      when 'L'
        turn('L')
      when 'R'
        turn('R')
      when 'M'
        move
      else
        raise 'Wrong move.'
      end
    end
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

    def move_possible?(x, y)
      @plateau.move_possible?(x, y)
    end

end
