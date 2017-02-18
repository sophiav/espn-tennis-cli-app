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
    player = self.new
    hash.each { |key, value| player.send("#{key}=", value) }
    player
  end

  def self.create_from_hash(hash)
    self.new_from_hash(hash).save
  end
end