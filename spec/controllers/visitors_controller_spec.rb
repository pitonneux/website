require 'rails_helper'

RSpec.describe VisitorsController, type: :controller do
  describe 'POST #create' do
    let(:visitor_params) { attributes_for :visitor }

    subject { post :create, params: { visitor: visitor_params }, format: :js }

    it_behaves_like 'action that is allowed for guests'
    it_behaves_like 'successful request'
  end
end
