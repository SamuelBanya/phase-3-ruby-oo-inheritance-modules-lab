require 'pry'
# NOTE: This 'require_relative' section actually goes into the 'config/environment.rb' file instead:
# require_relative '../lib/concerns/memorable'
# require_relative '../lib/concerns/findable'
# require_relative '../lib/concerns/paramable'

class Song
  attr_accessor :name
  attr_reader :artist

  include Memorable::InstanceMethods
  include Paramable::InstanceMethods

  extend Memorable::ClassMethods
  extend Findable::ClassMethods

  @@songs = []

  def initialize
    @@songs << self
  end

    # Here we are extending the 'find_by_name' method so that we can import it from the 'Findable' module
  # above, but also extend it to include more capabilities specific for the 'Artist' class
  def self.find_by_name(name)
    @@songs.detect{|a| a.name == name}
  end

  def self.all
    @@songs
  end

  def artist=(artist)
    @artist = artist
  end

  # def to_param
    # name.downcase.gsub(' ', '-')
  # end
end
