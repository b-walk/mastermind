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

code = Code.new(:computer)