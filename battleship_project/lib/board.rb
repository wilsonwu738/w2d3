class Board
  attr_reader :size
  def initialize(num)
    @grid = Array.new(num) { Array.new(num, :N)}
    @size = num * num
  end

  def [](position)
    row, col = position
    @grid[row][col]

  end

  def []=(position, val)
    row, col = position
    @grid[row][col] = val
  end

  def num_ships
    @grid.flatten.count { |ele| ele == :S}
  end

  def attack(position)
    




end




