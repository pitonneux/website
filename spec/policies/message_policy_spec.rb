# frozen_string_literal: true
require 'rails_helper'

RSpec.describe MessagePolicy do
  let(:user)  { build_stubbed :user         }
  let(:admin) { build_stubbed :user, :admin }

  subject { described_class }

  permissions :index? do
    it { is_expected.not_to permit user }
    it { is_expected.to permit admin    }
  end
end
