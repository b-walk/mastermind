# Class Code generates a code sequence depending on an owner
class Code
  def initialize(owner)
    @owner = owner
  end

  def generate
    case @owner
    when :human
      puts "Type in your code:"
      gets.chomp.downcase.split(' ')
    when :computer
      puts "The computer has generated a code."
      Array.new(4).map { |_chr| %w[red green blue orange yellow pink].sample }
    else
      puts "error"
    end
  end
end

# Class Board returns a guess's key pegs
class Board
  attr_accessor :key_pegs

  def initialize
    @key_pegs = []
  end
end

# Class Guess generates a guess depending on the guesser
class Guess
  def initialize(guesser)
    @guesser = guesser
  end

  def get
    case @guesser
    when :human
      puts "Enter your guess:"
      gets.chomp.downcase.split(' ')
    when :computer
      # GUESSING ALGORITHM HERE
    else
      puts "error"
    end
  end
end

code = Code.new(:computer)