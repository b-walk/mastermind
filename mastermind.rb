# Peg objects store the used/unused statuses of pegs as well as their colors
class Peg
  attr_accessor :color, :status

  def initialize(color)
    @color = color
    @status = :unused
  end
end

# Code objects generate a code sequence depending on an owner
class Code

  COLORS = %i[red blue green yellow orange pink]
  
  def initialize(owner)
    @owner = owner
  end

  def random
    puts "The computer has generated a code."
    Array.new(4).map { |_peg| Peg.new(COLORS.sample)}
  end

  def create
    Array.new(4).map.with_index do |peg, position|
      puts "Enter peg no. #{position + 1}:"
      Peg.new(gets.chomp.downcase.to_sym)
    end
  end
end

# Guess objects generate a guess depending on an owner
class Guess
  def initialize(owner)
    @owner = owner
  end
end

code = Code.new(:human).create
print code