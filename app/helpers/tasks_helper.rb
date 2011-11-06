module TasksHelper

  def progress_image(progress)
    css = "progress progress-#{(progress*24).floor}"
    text = "#{(progress * 100).floor}%"
    content_tag("div", text, :class => css)
  end


  def nested_tasks(tasks)
    tasks.collect do |task, sub_tasks|
      render(task, :subtasks => sub_tasks.count) + content_tag(
        :div,
        nested_tasks(sub_tasks),
        :class => "nested_tasks"
      )
    end.join.html_safe
  end


  def rating_tags(name, container, selected = nil, options = {})
    container.collect do |element|
      text, value = option_text_and_value(element).collect { |item| item.to_s }
      opts = {:class => :star, :title => text}.merge(options)
      radio_button_tag(name, value, (selected.to_s == value), opts)
    end.join.html_safe
  end

end
