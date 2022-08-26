module Findable
  module ClassMethods
    # NOTE: Here we use the 'self.' keyword because we want this to reference the collection of all class instances
    # Also, we use 'o' to represent 'objects' that we are iterating over as well:
    def self.find_by_name(name)
      self.all.detect{|o| o.name == name}
    end
  end
end
