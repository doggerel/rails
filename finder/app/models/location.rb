class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode, :if=>:address_changed?
  #must user reque
  #external api calls in background process
  #http://asciicasts.com/episodes/271-resque
end
