require 'rails_helper'

# frozen_string_literal: true
RSpec.describe RegistrationsController, type: :routing do
  describe 'routing' do
    it 'routes to cancel' do
      expect(get: '/admin/cancel').to route_to('registrations#cancel')
    end

    it 'routes to create' do
      expect(post: '/admin').to route_to('registrations#create')
    end

    it 'routes to new' do
      expect(get: '/admin/register').to route_to('registrations#new')
    end

    it 'routes to edit' do
      expect(get: '/admin/edit').to route_to('registrations#edit')
    end

    it 'routes to update via PUT' do
      expect(put: '/admin').to route_to('registrations#update')
    end

    it 'routes to update via PATCH' do
      expect(patch: '/admin').to route_to('registrations#update')
    end

    it 'routes to cancel' do
      expect(delete: '/admin').to route_to('registrations#destroy')
    end
  end
end
