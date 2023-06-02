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
  attr_accessor :owner

  COLORS = %i[red blue green yellow orange pink]
  
  def initialize(owner)
    @owner = owner #human or computer
    @pegs = Array.new(4, Peg.new)
  end

  def random #computer owner
    @pegs = @pegs.map { |peg| peg.color = COLORS.sample}
  end

  def create #human owner
    @pegs = @pegs.map.with_index do |peg, position|
      puts "Enter peg no. #{position + 1}:"
      peg.color = gets.chomp.downcase.to_sym
    end
  end

  def pegs
    @pegs.each { |peg| print "#{peg.color} " }
  end
end