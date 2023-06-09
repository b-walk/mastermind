# PEG objects COLOR AND USE STATUSES FOR INDIVIDUAL PEGS OF A SEQUENCE
class Peg
  attr_accessor :color, :status

  def initialize
    @color = :none
    @status = :unused
  end
end

# SEQUENCE objects are TEMPLATES FOR GUESSES/CODES
class Sequence
  attr_accessor :pegs

  COLORS = %i[red blue green yellow orange pink]

  def initialize
    @pegs = Array.new(4) { Peg.new }
  end

  def human
    puts 'Four pegs are required. Valid colors include red, blue, green, yellow, orange, and pink.'
    @pegs.each do |peg|
      puts 'Enter a color:'
      peg.color = gets.chomp.downcase.to_sym
    end
  end

  def computer
    @pegs.each { |peg| peg.color = COLORS.sample }
  end
end

# CODE objects are responsible for GENERATING CODES EACH GAME
class Code < Sequence
  def human
    puts 'Enter the code:'
    super
  end
end

# GUESS objects are responsible for GENERATING GUESSES EACH ROUND
class Guess < Sequence
  def human
    puts 'Guess the code:'
    super
  end
end

# ROUND objects are responsible for COMPARING CODE AND GUESS SEQUENCES/ PASSING KEY PEGS TO GAME
class Round
  attr_reader :key_pegs

  def initialize(code, guess)
    @code = code
    @guess = guess
    @key_pegs = []
  end

  def play
    reset_statuses
    black_pegs
    white_pegs
  end

  private

  def reset_statuses
    @guess.each { |peg| peg.status = :unused }
    @code.each { |peg| peg.status = :unused }
  end

  def black_pegs
    @guess.each_with_index do |peg, position|
      @code.each_with_index do |code_peg, code_position|
        if (peg.color == code_peg.color) && (position == code_position) && (peg.status == :unused) && (code_peg.status == :unused)
          @key_pegs << :black
          peg.status = :used
          code_peg.status = :used
        end
      end
    end
  end

  def white_pegs
    @guess.each do |peg|
      @code.each do |code_peg|
        if (peg.color == code_peg.color) && (peg.status == :unused) && (code_peg.status == :unused)
          @key_pegs << :white
          peg.status = :used
          code_peg.status = :used
        end
      end
    end
  end
end

# GAME objects are responsible for GENERATING CODE SEQUENCES/REPEATING ROUNDS
class Game
  attr_accessor :code, :winner, :breaker, :maker

  def initialize
    @code = Code.new
    case get_player_role
    when :maker
      @maker, @breaker = :human, :computer
      @code.human
    when :breaker
      @maker, @breaker = :computer, :human
      @code.computer
    end
    play
  end

  private

  def play
    12.times do
      round = Round.new(@code.pegs, guess.pegs)
      round.play
      if round.key_pegs == [:black, :black, :black, :black]
        @winner = :breaker
      end
      break if @winner != nil
      print "#{round.key_pegs.to_s}\n"
    end
    @winner ||= :maker
    print "The #{@winner} has won! The code was #{@code}."
  end

  def guess
    guess = Guess.new
    case @breaker
    when :human
      guess.human
    when :computer
      guess.computer
    end
    guess
  end

  def get_player_role
    puts "Would you like to be the codemaker or the codebreaker? (Type 'maker' or 'breaker')"
    gets.chomp.downcase.to_sym
  end
end

game = Game.new