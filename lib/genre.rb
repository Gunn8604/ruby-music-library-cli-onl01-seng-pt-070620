class Genre
extend Concerns::Findable
  attr_accessor :name, :songs 
  
  @@all = []

  def initialize(name)
  @name = name
  @songs = []
  save    #saving all instances of the genre created
  end

  def self.all
  @@all
  end

  def self.destroy_all
  @@all = []
  end

  def save
  @@all << self 
  end

  # def self.create(genre)
  # self.new(genre)
  # end
  
  def self.create(name)
    self.new(name)
  end
  
  def songs 
    @songs
  end 

  def artists
    self.songs.collect {|song|song.artist}.uniq
  end
  

  
  

end     #class end