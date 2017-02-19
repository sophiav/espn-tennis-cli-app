class Player
  attr_accessor :name, :rank, :country, :points, :url

  @@all = []

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
end