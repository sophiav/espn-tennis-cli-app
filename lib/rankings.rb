class Rankings
  # prints all the rankings
  def self.print_rankings
    Player.all.each do |player|
      puts "#{player.rank.ljust(5)}#{player.name.ljust(25)}#{player.country.ljust(25)}#{player.points}"
    end
  end
end