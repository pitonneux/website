require 'rails_helper'

# frozen_string_literal: true
RSpec.describe Event, type: :model do
  it { is_expected.to belong_to :location }
  it { is_expected.to validate_presence_of :name        }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :price       }
  it { is_expected.to validate_presence_of :price       }

  describe 'featured scope' do
    let(:featured)     { create :event, featured: true  }
    let(:not_featured) { create :event, featured: false }

    subject { Event.featured }

    it { is_expected.to include featured         }
    it { is_expected.not_to include not_featured }
  end

  describe 'upcoming scope' do
    let(:upcoming)     { create :event, starts_at: 1.month.from_now }
    let(:not_upcoming) { create :event, starts_at: 1.month.ago      }

    subject { Event.upcoming }

    it { is_expected.to include upcoming         }
    it { is_expected.not_to include not_upcoming }
  end
end
