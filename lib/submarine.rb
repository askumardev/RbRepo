class Submarine
  attr_reader :dep, :position

  def initialize(&blk)
    @dep = 0
    @position = 0

    if block_given?
      instance_eval(&blk)
    end
  end

  def down(n)
    @dep += n
  end

  def up(n)
    @dep -= n
  end

  def forward(n)
    @position += n
  end

  def location
    dep * position
  end
end