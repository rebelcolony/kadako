# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def awesome_button(text, options = {})
    button_classes = %w(large awesome blue)
    button_classes << options.delete(:class)
    
    button_options = {
      :class => button_classes.join(" "), 
      :type => "submit"
    }.merge(options)
    content_tag(:button, text, button_options)
  end
  
end
