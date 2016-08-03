# frozen_string_literal: true
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
    renderer_options = { link_attributes: { target: '_blank' } }

    renderer = Redcarpet::Render::HTML.new(renderer_options)
    @markdown ||= Redcarpet::Markdown.new(renderer, extensions)

    @markdown.render(text).html_safe
  end

  def show_error(object, field)
    messages = object.errors.full_messages_for field
    if messages.any?
      content_tag :p, messages.first.lstrip, class: 'field-error'
    end
  end
end
