module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Les Pitonneux'
    if page_title.blank?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def render_markdown(text)
    extensions = { autolink: true }

    renderer = Redcarpet::Render::HTML.new
    @markdown ||= Redcarpet::Markdown.new(renderer, extensions)

    @markdown.render(text).html_safe
  end
end

