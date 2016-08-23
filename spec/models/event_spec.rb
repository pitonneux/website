require 'rails_helper'

# frozen_string_literal: true
RSpec.describe Event, type: :model do
  it { is_expected.to belong_to :location }
  it { is_expected.to validate_presence_of :name        }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :price       }
  it { is_expected.to validate_presence_of :starts_at   }

  describe 'featured scope' do
    let(:featured)     { create :event, featured: true  }
    let(:not_featured) { create :event, featured: false }

    subject { Event.featured }

    it { is_expected.to     include featured     }
    it { is_expected.not_to include not_featured }
  end

  describe 'upcoming scope' do
    let(:upcoming)     { create :event, starts_at: 1.month.from_now }
    let(:not_upcoming) { create :event, starts_at: 1.month.ago      }

    subject { Event.upcoming }

    it { is_expected.to     include upcoming     }
    it { is_expected.not_to include not_upcoming }
  end

  describe 'slugging' do
    it 'handles slugging events when slugs are taken' do
      event = create :event, name: 'Learn Ruby on Rails'
      expect(event.slug).to eq 'learn-ruby-on-rails'

      next_event = create :event, name: 'Learn Ruby on Rails', starts_at: Time.zone.parse('2017-01-25 18:00:00')
      expect(next_event.slug).to eq 'learn-ruby-on-rails-2017-01-25'

      location = create :location, name: 'A nice location'
      another_event = create :event, name: 'Learn Ruby on Rails',
                                     starts_at: Time.zone.parse('2017-01-25 18:00:00'),
                                     location: location
      expect(another_event.slug).to eq 'learn-ruby-on-rails-2017-01-25-a-nice-location'
    end
  end
end
