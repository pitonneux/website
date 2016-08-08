# frozen_string_literal: true
require 'rails_helper'

RSpec.describe EventPolicy do
  let(:user)  { build_stubbed :user         }
  let(:admin) { build_stubbed :user, :admin }

  subject { described_class }

  permissions '.scope' do
    let!(:finished_event) { create :event, starts_at: 2.months.ago }
    let!(:future_event)   { create :event                         }

    it 'returns all events for admins' do
      expect(subject::Scope.new(admin, Event).resolve.count).to eq 2
    end

    it 'returns all events for admins' do
      expect(subject::Scope.new(user, Event).resolve.count).to eq 1
    end
  end

  permissions :index? do
    it { is_expected.to permit user  }
    it { is_expected.to permit admin }
  end

  permissions :show? do
    it { is_expected.to permit user  }
    it { is_expected.to permit admin }
  end
end
