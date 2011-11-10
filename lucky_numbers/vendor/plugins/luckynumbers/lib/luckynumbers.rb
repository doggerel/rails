module Luckynumbers
  module InstanceMethods
    def lucky_number
      id.to_i % 10
    end
    def self.include(base)
      base.extend ClassMethods
    end
  end
  module ClassMethods
    def find_by_lucky_number(number)
      find(:all, :conditions => ["id % 10 = ? ", number])
    end
  end
  module ActsMacro
    def acts_as_lucky(options = {})
      send :include, InstanceMethods
    end
  end
end
