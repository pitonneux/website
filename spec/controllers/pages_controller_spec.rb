require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe '#home' do
    it 'renders the home page' do
      expect(get :home).to render_template :home
    end
  end

  describe '#dashboard' do
    it 'renders the dashboard page' do
      expect(get :dashboard).to render_template :dashboard
    end
  end
end
