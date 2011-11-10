xml.instruct! :xml, :version =>"1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Microposts"
    xml.subject "Microposts"
    xml.description "Microposts posted by user"
      for m in @microposts 
        xml.item do
        xml.title m.content  
        xml.subject m.content 
        xml.description m.content 
        xml.pubDate m.created_at.to_s(:rfc822)
        xml.link micropost_url(m.id)
        xml.guid micropost_url(m.id)
      end
    end
  end
end
