module TasksHelper

  def progress_image(progress)
    css = "progress progress-#{(progress*24).floor}"
    text = "#{(progress * 100).floor}%"
    content_tag("div", text, :class => css)
  end


  def nested_tasks(tasks)
    tasks.map do |task, sub_tasks|
      render(task) + content_tag(:div, nested_tasks(sub_tasks), :class => "nested_tasks")
    end.join.html_safe
  end

end
