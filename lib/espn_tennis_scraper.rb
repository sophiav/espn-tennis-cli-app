class EspnTennisScraper
  def self.scrape_all_rankings
    self.scrape_atp_rankings
    self.scrape_wta_rankings
  end

  def self.scrape(url, tour)
    doc = Nokogiri::HTML(open(url))
    player_rows = doc.css('.mod-content table tr[class*="player"]')

    players = player_rows.map do |player_row|
      rank = player_row.css('td')[0].text
      name = player_row.css('td')[1].css('a').text
      url = player_row.css('td')[1].css('a').attr('href').text
      country = player_row.css('td')[2].css('img').attr('title').text
      points = player_row.css('td')[4].text

      player_hash = {
        rank: rank,
        name: name,
        url: "http://www.espn.com#{url}",
        country: country,
        points: points,
        tour: tour
      }
      # create a new player from the hash
      player = Player.create_from_hash(player_hash)
    end
  end

  private

  def self.scrape_atp_rankings
    self.scrape("http://www.espn.com/tennis/rankings", "ATP")
  end

  def self.scrape_wta_rankings
    self.scrape("http://www.espn.com/tennis/rankings/_/type/2", "WTA")
  end
end