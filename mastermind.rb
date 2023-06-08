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
  attr_accessor :owner
  
  COLORS = %i[red blue green yellow orange pink].freeze

  def initialize(owner)
    @owner = owner
    @pegs = Array.new(4, Peg.new)
  end

  def pegs
    @pegs.each { |peg| print "#{peg} " }
  end

  def human
    puts 'Four pegs are required. Valid colors include red, blue, green, yellow, orange, and pink.'
    @pegs.map! do |peg|
      puts 'Enter a color:'
      peg.color = gets.chomp.downcase.to_sym
    end
  end

  def computer
    @pegs.map! { |peg| peg.color = COLORS.sample }
  end
end

# CODE objects are responsible for GENERATING CODES EACH GAME
class Code < Sequence
  attr_accessor :cracked

  def initialize(owner)
    super(owner)
    @cracked = false
  end

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

  end
end

# GAME objects are responsible for GENERATING CODE SEQUENCES/REPEATING ROUNDS
class Game
  attr_accessor :code, :maker, :breaker

  def initialize(code, maker, breaker)
    @code = code
    @maker = maker
    @breaker = breaker
  end

  def play
    12.times do
      guess = Guess.new

    end
  end
end