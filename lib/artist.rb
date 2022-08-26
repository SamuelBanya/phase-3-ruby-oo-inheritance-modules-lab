require 'pry'
require_relative '../lib/concerns/memorable'
require_relative '../lib/concerns/findable'
require_relative '../lib/concerns/paramable'

class Artist
  attr_accessor :name
  attr_reader :songs

  include Memorable::InstanceMethods
  include Paramable::InstanceMethods

  extend Memorable::ClassMethods
  extend Findable::ClassMethods

  @@artists = []

  def initialize
    # By using the 'super' keyword, we force Ruby to utilize the 'Memorable::InstanceMethods' module's
    # '.initialize' method FIRST:
    super
    @songs = []
  end

  # Here we are extending the 'find_by_name' method so that we can import it from the 'Findable' module
  # above, but also extend it to include more capabilities specific for the 'Artist' class
  def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}
  end

  def self.all
    @@artists
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end
end
