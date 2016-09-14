class Human
  BOUNDARY = (0..8).to_a
  def initialize(name)
    @name = name
  end

  def prompt(board)
    @board = board
    pos = get_pos
    val = get_value
    [pos, val]
  end

  def get_pos
    pos = nil
    loop do
      p "#{@name}, enter a position in the format row,col"
      pos = gets.chomp.split(",").map(&:to_i)
      break if valid_pos?(pos)
      p "Invalid position. Please pick row,col coordinates from 0-8."
    end
    pos
  end

  def valid_pos?(pos)
    row, col = pos
    BOUNDARY.include?(row) && BOUNDARY.include?(col) &&
      @board.grid[row][col].given == false
  end

  def get_value
    val = nil
    loop do
      p "#{@name}, enter a value between 1 and 9"
      val = gets.chomp.to_i
      break if valid_val?(val)
      p "Invalid value. Please pick a number between 1 and 9."
    end
    val
  end

  def valid_val?(num)
    (1..9).to_a.include?(num)
  end
end
