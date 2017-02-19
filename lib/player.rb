class Player
  attr_accessor :name, :rank, :country, :points, :url, :tour

  @@all = []

  def player_bio
    doc = Nokogiri::HTML(open(url))
    metadata = doc.css('.player-bio .player-metadata li')

    birth_date = metadata[1].text.gsub('Birth Date', '')
    hometown = metadata[2].text.gsub('Hometown', '')
    height = metadata[3] ? metadata[3].text.gsub('Height', '') : "N/A"
    weight = metadata[4] ? metadata[4].text.gsub('Weight', '') : "N/A"

    puts "=" * 40
    puts "Rank: #{rank}"
    puts "Name: #{name}"
    puts "Birth Date: #{birth_date}"
    puts "Hometown: #{hometown}"
    puts "Country: #{country}"
    puts "Height: #{height}"
    puts "Weight: #{weight}"
    puts "=" * 40
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all.dup.freeze
  end

  def self.new_from_hash(hash)
    Player.new.tap do |player|
      hash.each { |key, value| player.send("#{key}=", value) }
    end
  end

  def self.create_from_hash(hash)
    self.new_from_hash(hash).save
  end

  def self.find_by_name(name)
    @@all.detect { |player| player.name.downcase == name.downcase }
  end

  def self.find_by_rank(rank)
    @@all.detect { |player| player.rank == rank }
  end

  def self.find_by_tour(tour)
    @@all.select { |player| player.tour == tour }
  end
end