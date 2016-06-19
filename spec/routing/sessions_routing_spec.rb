require 'rails_helper'

# frozen_string_literal: true
RSpec.describe Devise::SessionsController, type: :routing do
  describe 'routing' do
    it 'routes to login' do
      expect(get: '/admin/login').to route_to('devise/sessions#new')
    end

    it 'routes to login' do
      expect(post: '/admin/login').to route_to('devise/sessions#create')
    end

    it 'routes to logout' do
      expect(delete: '/admin/logout').to route_to('devise/sessions#destroy')
    end
  end
end
