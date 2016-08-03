require 'rails_helper'

# frozen_string_literal: true
RSpec.describe ApplicationHelper, type: :helper do
  describe 'full_title' do
    context 'page has a title' do
      it 'displays the full title' do
        expect(full_title('Dashboard')).to eq 'Dashboard | Les Pitonneux'
      end
    end

    context 'page does not have a title' do
      it 'displays the right title' do
        expect(full_title(' ')).to eq 'Les Pitonneux'
      end
    end
  end

  describe 'render_markdown' do
    it 'turns markdown into html' do
      text = "## Header\r\nSome text"
      html = <<-HTML.strip_heredoc
              <h2>Header</h2>

              <p>Some text</p>
            HTML
      expect(render_markdown(text)).to eq html
    end

    it 'adds target blank to links' do
      text = '[Sign up!](http://signuplink.com)'
      html = "<p><a href=\"http://signuplink.com\" target=\"_blank\">Sign up!</a></p>\n"

      expect(render_markdown(text)).to eq html
    end
  end

  describe '#show_error' do
    it 'returns the content tag for an object that has errors' do
      object = build :visitor, email: 'invalid@email'
      object.valid?

      expect(show_error(object, :email)).to eq '<p class="field-error">Looks like that&#39;s not a valid email address. Could you double check it?</p>'
    end

    it 'returns nothing for an object that has no errors' do
      object = build :visitor, email: 'valid@email.com'
      object.valid?

      expect(show_error(object, :name)).to eq nil
    end
  end
end
