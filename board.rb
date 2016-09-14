class Board
  attr_reader :grid
  def initialize(grid)
    @grid = grid.each do |row|
      row.map! do |num|
        num == 0 ? Tile.new(false) : Tile.new(true, num)
      end
    end
  end

  def self.from_file
    p "Please enter the file name"
    file_name = gets.chomp
    grid = File.readlines(file_name).map(&:chomp)
    grid.map! {|row| row.split("").map(&:to_i)}
    Board.new(grid)
  end

  def position(pos, value)
    row, col = pos
    @grid[row][col].set_value(value)
  end

  def render
    @grid.each do |row|
      row_str = []
      row.each do |tile|
        row_str << tile.display
      end
      p row_str.join(" ")
    end
  end

  def rows_solved?
    @grid.each do |row|
      numbers = (1..9).to_a
      row_nums = []
      row.each do |tile|
        row_nums << tile.value
      end
      return false unless numbers.sort == row_nums.sort
    end
    true
  end

  def cols_solved?
    for col in (0..8)
      numbers = (1..9).to_a
      col_nums = []
      @grid.each do |row|
        col_nums << row[col].value
      end
      return false unless numbers.sort == col_nums.sort
    end
    true
  end

  def solved?
    rows_solved? && cols_solved?
  end
end
