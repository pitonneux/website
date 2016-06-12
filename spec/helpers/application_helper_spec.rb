require 'rails_helper'

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
  end

  describe '#show_error' do
    it 'returns the content tag for an object that has errors' do
      errors = double 'errors', messages: { name: ["can't be blank"] }
      object = double 'object', errors: errors

      expect(show_error(object, :name)).to eq "<p class=\"field-error\">Name can&#39;t be blank</p>"
    end

    it 'returns nothing for an object that has no errors' do
      errors = double 'errors', messages: {}
      object = double 'object', errors: errors

      expect(show_error(object, :name)).to eq nil
    end
  end
end



