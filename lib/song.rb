require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    check = self.find_by_name(name)
    if check == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    sorted_array = @@all.sort_by { |song| song.name }
    sorted_array
  end

  def self.new_from_filename(filename)
    new_file = filename.split(" - ")
    new_song = self.new_by_name(new_file[1].chomp('.mp3'))
    new_song.artist_name = new_file[0]
    new_song
  end

  def self.create_from_filename(filename)
    new_file = filename.split(" - ")
    new_song = self.create_by_name(new_file[1].chomp('.mp3'))
    new_song.artist_name = new_file[0]
    new_song
  end


  def self.destroy_all
    self.all.clear
  end


end
