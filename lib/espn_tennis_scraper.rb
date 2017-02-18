class EspnTennisScraper
  def self.scrape(url)
    doc = Nokogiri::HTML(open(url))
    player_rows = doc.css('.mod-content table tr[class*="player"]')

    players = player_rows.map do |player_row|
      rank = player_row.css('td')[0].text
      name = player_row.css('td')[1].css('a').text
      url = player_row.css('td')[1].css('a').attr('href').text
      country = player_row.css('td')[2].css('img').attr('title').text
      points = player_row.css('td')[4].text

      {
        rank: rank,
        name: name,
        url: "http://www.espn.com#{url}",
        country: country,
        points: points
      }
    end
    puts players
  end
end