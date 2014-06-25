require "erb_generator"

class HTMLGenerator < ERBGenerator

  def initialize(wrapper = nil)
    @wrapper = wrapper
  end

  def wrapper(erb_output)
    if @wrapper == nil
      erb_output
    else
      template = @wrapper
      options = {:locals => {:jimjam => erb_output}}
      erb(template, options)
    end
  end

  def section(text)
    template = "<section><%= section_text %></section>"
    options = {:locals => {:section_text => text}}
    output = erb(template, options)
    wrapper(output)
  end

  def unordered_list(items)
    template = <<-TEMPLATE
      <ul>
        <% these_items.each do |item| %>
          <li><%= item %></li>
        <% end %>
      </ul>
    TEMPLATE
    options = {:locals => {:these_items => items}}
    output = erb template, options
    wrapper(output)
  end

  def button(text, class_hash = {})
    if class_hash != {}
      template = "<button class='<%=classy_hash[:class] %>'><%= button_text %></button>"
    else
      template = "<button><%= button_text %></button>"
    end
    options = {:locals => {:button_text => text, :classy_hash => class_hash}}
    output = erb(template, options)
    wrapper(output)
  end




end