module ApplicationHelper
  def flash_messages
    return if flash.empty?
      content_tag(:ul, :id => 'flash-messages') do
      flash.collect do |type, message|
      content_tag(:li, message, :class => "flash-message #{type}")
      end.join("\n").html_safe
    end
  end

end
