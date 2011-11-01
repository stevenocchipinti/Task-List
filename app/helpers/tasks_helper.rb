module TasksHelper
  def progress_image(progress)
    css = "progress progress-#{(progress*24).floor}"
    text = "#{(progress * 100).floor}%"
    content_tag("span", "", :class => css, :alt => text, :title => text)
  end
end
