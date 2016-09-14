require_relative 'human'
require_relative 'board'
require_relative 'tile'


class Game

  def initialize(board, player)
    @board = board
    @player = player
  end

  def play
    until @board.solved?
      @board.render
      take_turn
    end
    p "Hooray! You win."
  end

  def take_turn
    pos, value = @player.prompt(@board)
    @board.position(pos, value)
  end
end

if __FILE__ == $PROGRAM_NAME
  a = Board.from_file
  player = Human.new("Chomsky")
  game = Game.new(a, player)
  game.play
end
