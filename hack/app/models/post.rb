class Post < ActiveRecord::Base
  #rake sunspot:solr:start
  ##rake sunspot:reindex
  attr_accessible :content, :title, :created_at  
  belongs_to :users
  searchable do
    text :title
  end
end
