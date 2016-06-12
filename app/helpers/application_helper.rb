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

  def show_error(object, field)
    message = object.errors.messages[field]
    unless message.blank?
      content_tag :p, "#{field.to_s.humanize} #{message.join}", class: 'field-error'
    end
  end
end

