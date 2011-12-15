class Post < ActiveRecord::Base
  #rake sunspot:solr:start
  ##rake sunspot:reindex
  attr_accessible :content, :title, :created_at  
  belongs_to :user, :dependent=>:destroy
  has_many :comments
  scope :find_by_title, lambda{|post| return_title(post)}
  
  
  searchable do
    text :title
  end
  
  def return_title(post)
    self.where(:title=>post)
  end

end
