# Peg objects store the used/unused statuses of pegs as well as their colors
class Peg
  attr_accessor :color, :status

  def initialize(color)
    @color = color
    @status = :unused
  end
end

# Sequence objects generate code and guess sequences
class Sequence
  attr_accessor :owner, :type

  COLORS = %i[red blue green yellow orange pink]
  
  def initialize(owner, type)
    @owner = owner #human or computer
    @type = type #guess or solution
    @pegs = Array.new(4)
  end

  def random #computer owner
    puts "The computer has generated a code."
    @pegs = @pegs.map { |_peg| Peg.new(COLORS.sample)}
  end

  def create #human owner
    @pegs = @pegs.map.with_index do |peg, position|
      puts "Enter peg no. #{position + 1}:"
      Peg.new(gets.chomp.downcase.to_sym)
    end
  end

  def pegs
    @pegs.each { |peg| print "#{peg.color} " }
  end
end

computer_code = Sequence.new(:computer, :code)
computer_code.random
computer_code.pegs

# Game objects track round counts and assign sequence owners
class Game
  attr_accessor :code, :maker, :breaker

  def initialize
  end
end