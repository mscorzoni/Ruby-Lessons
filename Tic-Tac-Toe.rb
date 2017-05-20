class TicTacToe
  attr_reader :grid, :player_1, :player_2
  @@wins =
    [[0, 1 ,2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
     [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize
    @grid = Board.new
    @player_1 = Player.new
    @player_2 = Player.new
    @winner = nil
    @current_turn = 1
  end

  def get_players_names
    print "Enter player 1 name: "
    @player_1.name = gets.chomp
    @player_1.sym = 'x'
    print "Enter player 2 name: "
    @player_2.name = gets.chomp
    @player_2.sym = 'o'
  end

  def show_welcome_message
    puts '------------------------------'
    puts 'Welcome to my TicTacToe Game!!'
    puts '------------------------------'
    puts "Thanks, #{@player_1.name}, it's your turn"
    @grid.print_grid
  end

  def start_playing
    take_turns until game_over
  end

  def take_turns
    @current_turn.even? ? turn(@player_1) : turn(@player_2)
  end

  def show_turn(player)
    puts "Turn: #{@current_turn}"
    print "#{player.name} #{player.sym}"
  end

  def get_valid_cell
    input = nil
    until (0..8).include?(input)
      print 'enter your move (1-9) top to bottom, left to right: '
      input = gets.chomp.to_i - 1
    end
    input
  end

  def check_for_win(player)
    @@wins.each do |w|
      @winner = player if w.all? { |a| @grid.board[a] == player.sym }
    end
  end


  def turn(player)
    show_turn(player)
    input = get_valid_cell
    if @grid.update(input, player.sym)
      @current_turn += 1
    else
      error = "Sorry, that cell is invalid!"
    end
    @grid.print_grid
    puts error
    check_for_win(player)
  end

  def game_over
    @current_turn > 9 || @winner
  end

  def show_game_over_message
    puts '---------'
    puts 'Game Over'
    puts '---------'
  end

  def show_result
    if @current_turn > 9 && !@winner
      puts "It's a tie!"
    else
      puts "Congrats #{@winner.name}! You won!"
    end
  end

  def play
    get_players_names
    show_welcome_message
    start_playing
    show_result
    show_game_over_message
  end

  class Board
    attr_reader :board, :empty_cell

    def initialize
      @empty_cell = "-"
      @board = Array.new(9, @empty_cell)
    end

    def print_grid
      puts "\n"
      @board.each_slice(3){ |row| puts row.join(" | ") }
      puts "\n"
    end

    def update(pos, sym)
      if @board[pos] == @empty_cell
        @board[pos] = sym
        return true
      else
        return false
      end
    end
  end

  Player = Struct.new(:name, :sym)
end

my_game = TicTacToe.new
my_game.play
