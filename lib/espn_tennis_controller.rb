class EspnTennisController
  def initialize
    puts "ESPN Tennis Rankings"
    @rankings = EspnTennisScraper.scrape("http://www.espn.com/tennis/rankings")
  end

  def call
    input = ""
    while input != "exit"
      puts "What would you like to see?"
      input = gets.strip
      case input
      when "list rankings"
        Rankings.print_rankings
      when "exit"
        puts "Goodbye!"  
        break
      else
        puts "I dont know what you mean"
      end
    end
  end
end