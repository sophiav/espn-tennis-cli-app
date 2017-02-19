class Rankings
  def self.print_rankings(tour)
    Player.find_by_tour(tour).each do |player|
      puts "#{player.rank.ljust(5)}#{player.name.ljust(25)}#{player.country.ljust(25)}#{player.points}"
    end
  end

  def self.print_atp_rankings
    self.print_rankings('ATP')
  end

  def self.print_wta_rankings
    self.print_rankings('WTA')
  end
end