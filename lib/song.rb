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
  #save    #saving all instances of the song created
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
    genre.songs << self unless genre.songs.include?(self)   #adds the song to the genre's collection of songs (genre has many songs)
    #Genre.add_song(self)     
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
    song = new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{ |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
  # def self.create(name)
  # self.new(name)
  # end

  # def self.find_by_name(song_name)
  #   self.all.find {|song|song.name == song_name}
  # end

  # def self.find_or_create_by_name(song_name)
  #   song = self.find_by_name(song_name)
  #   if song 
  #     song
  #   else 
  #     self.create(name)
  #   end
  # end
end     #class end