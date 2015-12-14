class Plateau

  def initialize(x, y)
    @x = x
    @y = y
  end

  def x; @x; end
  def y; @y; end

  def move_possible?(x, y)
    x <= @x && x >= 0 && y <= @y && y >= 0
  end

end
