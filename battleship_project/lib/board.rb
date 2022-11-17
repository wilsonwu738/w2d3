class Board
  attr_reader :size
  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(" ")
    end
  end

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
    if self[position] == :S 
      self[position] = :H
      puts "you sunk my battleship"
      return true
    else 
      self[position] = :X 
      return false
    end
  end

  def place_random_ships
    total_ships = @size * 0.25
    
    while self.num_ships < total_ships
      rand_col = rand(0...@grid.length)
      rand_row = rand(0...@grid.length)
      pos = [rand_row, rand_col]
      self[pos] = :S 
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |ele|
        if ele == :S 
          :N 
        else
          ele
        end
      end
    end
  end


  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end





  
end




