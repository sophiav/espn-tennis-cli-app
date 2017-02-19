class EspnTennisController
  def initialize
    puts "=" * 50
    puts "ESPN Tennis Rankings"
    puts "=" * 50
    EspnTennisScraper.scrape_all_rankings
  end

  def call
    puts "What tour would like see? (ATP/WTA)"

    input = ""
    while input != "exit"
      input = gets.strip.downcase
      if input == 'atp'
        Rankings.print_atp_rankings
        tour_type = 'atp'

      elsif input == 'wta'
        Rankings.print_wta_rankings
        tour_type = 'wta'

      elsif input.to_i > 0
        Player.find_by_rank_and_tour(input, tour_type).player_bio
      elsif input == "exit"
        puts "Goodbye!"
      else
        Player.find_by_name(input).player_bio
      end

      puts "What player would you like to see? You can enter the rank or player name." 
      puts "(or type 'atp' or 'wta' to list those rankings)"

    end
  end
end