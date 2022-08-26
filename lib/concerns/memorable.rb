# NOTE: It is common practice to create a 'lib/concerns' folder that contains the modules
# used across classes in an OO based Ruby project:
module Memorable
  module ClassMethods
    def reset_all
      self.all.clear
    end
    def count
      self.all.count
    end
  end
  module InstanceMethods
    def initialize
      self.class.all << self
    end
  end
end
