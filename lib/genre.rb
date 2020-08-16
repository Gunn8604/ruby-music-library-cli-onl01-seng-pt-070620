class Genre   
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
    genre = self.new(name).save
    self
  end
  
  def songs 
    @songs
  end 
  
  def add_song(song)
    song.genre = self if song.genre == nil 
    self.song << song if self.songs.include?(song) == false 
  end
  
  

end     #class end