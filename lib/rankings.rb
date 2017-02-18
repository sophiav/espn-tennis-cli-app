class Rankings
  # prints all the rankings
  def self.print_rankings
    Player.all.each do |player|
      puts "#{player.name}"
    end
  end
end