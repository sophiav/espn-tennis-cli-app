class EspnTennisController
  def initialize
    puts "ESPN Tennis Rankings"
    EspnTennisScraper.scrape_all_rankings
  end

  def call
    Rankings.print_rankings
    
    input = ""
    while input != "exit"
      puts "What player would you like to see? You can enter the rank or player name." 
      puts "(or type 'list rankings' to see the rankings again)"
      input = gets.strip

      if input == 'list rankings'
        Rankings.print_rankings
      elsif input.to_i > 0
        Player.find_by_rank(input).player_bio
      elsif input == "exit"
        puts "Goodbye!"
      else
        Player.find_by_name(input).player_bio
      end
    end
  end
end