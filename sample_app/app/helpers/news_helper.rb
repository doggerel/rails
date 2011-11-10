module NewsHelper
def truncate_topic(topic,len=15, o="...")
  full_text = link_to(topic.title, topic) + ' - ' + topic.description_without_embed
  truncate(full_text, :length => len, :omission => o)
end
  
end
