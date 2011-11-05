module TasksHelper
  def progress_image(progress)
    css = "progress progress-#{(progress*24).floor}"
    text = "#{(progress * 100).floor}%"
    content_tag("div", text, :class => css)
  end
end
