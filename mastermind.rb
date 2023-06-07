# Peg objects store the used/unused statuses of pegs as well as their colors
class Peg
  attr_accessor :color, :status

  def initialize
    @color = :none
    @status = :unused
  end
end

# Sequence objects provide a template for Guess and Code objects
class Sequence
  attr_reader :owner

  COLORS = %i[red blue green yellow orange pink]
  
  def initialize(owner)
    @owner = owner
    @pegs = Array.new(4, Peg.new)
  end

  def pegs
    @pegs.each { |peg| print "#{peg} " }
  end

  def human
    puts "Four pegs are required. Valid colors include red, blue, green, yellow, orange, and pink."
    @pegs.map! do |peg|
      puts "Enter a color:"
      peg.color = gets.chomp.downcase.to_sym
    end
  end

  def computer
    @pegs.map! { |peg| peg.color = COLORS.sample}
  end
end

class Code < Sequence
  attr_accessor :cracked

  def initialize(owner)
    super(owner)
    @cracked = false
  end

  def human
    puts "Enter the code:"
    super
  end
end

class Guess < Sequence
  def human
    puts "Guess the code:"
    super
  end
end
