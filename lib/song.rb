class Song 
  attr_accessor :name, :genre
  
  @@all = []

  def initialize(name, artist = nil, genre = nil) #artist=nil makes it an optional argument
  @name = name
    if artist != nil 
      self.artist = artist
    end
    
    if genre != nil 
      self.genre = genre
    end 
  save    #saving all instances of the song created
  end
  
  def artist 
    @artist
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)     #invokes Artist#add_song to add itself to the artist's collection of songs(artist has many songs)
  end

def genre 
    @genre 
  end
  
  def genre=(genre)
    @genre = genre
    Genre.all << self
    genre.add_song(self)     
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

  def self.create(name)
  self.new(name)
  end

end     #class end