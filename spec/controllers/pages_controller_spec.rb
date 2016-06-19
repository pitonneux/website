require 'rails_helper'

# frozen_string_literal: true
require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  it { is_expected.to respond_to :home }

  describe '#home' do
    subject { get :home }

    it_behaves_like 'successful request'
  end
end
