require 'digest/sha1'
class Token < ActiveRecord::Base
  def self.unique_id
    Digest::SHA1.hexdigest Time.now.to_s
  end
end
