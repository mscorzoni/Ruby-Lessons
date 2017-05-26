class Game

  def initialize
    @colors =["Red", "Green", "Blue", "Black", "Purple", "Yellow", "Orange", "White"]
    @player_input = Hash.new
    @count = [1, 2, 3, 4]
    @computer_right_answers = Hash.new
    @right_place = 0
    puts "---------------------------"
    puts "   Welcome to Mastermind"
    puts "---------------------------"
  end

  def computer
    @count.each do |key|
      @computer_right_answers[key] = @colors.sample()
    end
  end

  def questions
      @count.each do |number|
      puts "\nChoose between colors Red, Green, Blue, Black, Purple, Yellow, Orange or White for the position #{number}"
      @input = gets.chomp.downcase.capitalize
      validate_input
      @player_input[number] = @input
      end
  end


  def validate_input
    if @colors.include?(@input)
    else
      puts "Wrong choice. Choose a valid color"
      @input = gets.chomp.downcase.capitalize
      validate_input
    end
  end

  def display_input
    puts "\n"
    @player_input.keys.each do |key|
      puts "Color #{@player_input[key]} in the position #{key}"
    end
  end

  def clues
    @right_place = 0
    @wrong_place = 0
    temp = 0

    @player_input.keys.each do |key|
      if @player_input[key] == @computer_right_answers[key]
        @right_place += 1
      end
    end

    @computer_right_answers.values.each do |value|
      if @player_input.has_value?(value)
        temp += 1
      end
    end

    @wrong_place = temp - @right_place
  end

    def results
      puts "\n"
      puts "Right Color in the Right Position Ocurrences: #{@right_place}"
      puts "Right Color in the Wrong Position Ocurrences: #{@wrong_place} "
    end

  def play
    @chances = 12
    computer
    while (@chances > 0) && (@right_place < 4)
      puts "\nYou have #{@chances} chances to guess"
      questions
      display_input
      clues
      results
      @chances -= 1
    end
    check_for_win
    play_again
  end

  def check_for_win
    if @right_place == 4
      puts "\nCongratulations! You won!"
    else
      puts "\nGame over! You ran out of tries."
      puts "\nThe correct answer was:\n"
      @computer_right_answers.keys.each do |key|
        puts "Color #{@computer_right_answers[key]} in the position #{key}"
      end
    end
  end

  def play_again
    puts "\nWould you like to play again?(y/n)"
    lala = gets.chomp.downcase
    case lala
    when "y"
      Game.new.play
    when "n"
      puts "\nThanks for playing! Hope to see you again soon!"
    else
      puts "\nPlease, choose between y or n."
      play_again
    end
  end
end


Game.new.play
