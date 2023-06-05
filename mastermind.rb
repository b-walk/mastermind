# Peg objects store the used/unused statuses of pegs as well as their colors
class Peg
  attr_accessor :color, :status

  def initialize
    @color = :none
    @status = :unused
  end
end

# Sequence objects generate code and guess sequences
class Sequence
  attr_reader :owner

  COLORS = %i[red blue green yellow orange pink]
  
  def initialize(owner)
    @owner = owner
    @pegs = Array.new(4, Peg.new)
  end

  def pegs
    @pegs.each { |peg| print "#{peg.color} " }
  end
end

class Code < Sequence
  attr_accessor :cracked

  def computer
    @pegs.map! { |peg| peg.color = COLORS.sample}
  end

  def human
    puts "Four pegs are required. Valid colors include red, blue, green, yellow, orange, and pink."
    @pegs.map! do |peg|
      puts "Enter a color:"
      peg.color = gets.chomp.downcase.to_sym
    end
  end
end

code = Code.new(:computer)
code.pegs