require 'rails_helper'

RSpec.describe GroupMessagesController, type: :controller do
  describe 'GET #new' do
    subject { get :new }

    it_behaves_like 'action not allowed for guests'

  end

  describe 'POST #create' do

  end
end
    #
    # subject { get :new }
    #
    # it_behaves_like 'action not allowed for guests'
    #
    # include_context 'user is logged in' do
    #   it_behaves_like 'action to be authorized with', Event
    #   it_behaves_like 'action that redirects unauthorized user'
    #
    #   include_context 'user is authorized' do
    #     it_behaves_like 'successful request'
    #   end
    # end
    #
