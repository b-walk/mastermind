module Roles
  def get_player_role
    puts 'Would you like to be the codebreaker? (y/n)'
    choice = gets.chomp.downcase
    case choice
    when 'y'
      puts 'You are now the breaker!'
      :breaker
    when 'n'
      puts 'You are now the maker!'
      :maker
    else
      puts 'You must enter either \'n\' or \'y\'.'
    end
  end
end