module ApplicationHelper
  def flash_class level
    case level
    when :notice then "alert-info"
    when :error then "alert-error"
    when :alert then "alert-warning"
    when :success then "alert-success"
    end
  end

  def full_title page_title = ""
    base_title = t "titles.header"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def render_pagination collection
    paginate collection, theme: "twitter-bootstrap-3", pagination_class: "pagination-sm"
  end
end
