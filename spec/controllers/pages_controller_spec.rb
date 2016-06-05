require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  it { is_expected.to respond_to :home }

  describe '#home' do
    subject { get :home }

    it { is_expected.to render_template :home }
  end
end
