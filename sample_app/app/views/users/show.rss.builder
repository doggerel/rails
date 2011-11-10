xml.instruct! :xml, :version =>"1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.content "Microposts posted by user"
     @microposts.each do |m|
      xml.item do
        xml.content m.content
      end
    end
  end
end
