class Artist  
extend Concerns::Findable

  attr_accessor :name, :songs 
  
  @@all = []

  def initialize(name)
  @name = name
  @songs = []
  save    #saving all instances of the artist created
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

  def self.create(artist)
  self.new(artist)
  end
  
  #add_song
      # assigns the current artist to the song's 'artist' property (song belongs to artist)
      # does not assign the artist if the song already has an artist
      # adds the song to the current artist's 'songs' collection
      # does not add the song to the current artist's collection of songs if it already exists therein
  
   def add_song(song)
    if song.artist == nil 
      song.artist = self 
    end 
    
    if !@songs.include?(song)
      @songs << song 
    end 
    
  end

  def genres
    self.songs.map {|song|song.genre}.uniq
  end

end     #class end