class Post < ActiveRecord::Base
  #rake sunspot:solr:start
  ##rake sunspot:reindex
  attr_accessible :content, :title, :created_at  
  belongs_to :user
  has_many :comments
  searchable do
    text :title
  end
  def self.year_month
    self.connection.select_all(
    self.select('count(distinct(id)) as c, 
                  year(created_at) as y, 
                  month(created_at) as m').group('y, m'))
  end 
end
