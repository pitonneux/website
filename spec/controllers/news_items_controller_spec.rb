# frozen_string_literal: true
require 'rails_helper'

RSpec.describe NewsItemsController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'action that is allowed for guests'
    it_behaves_like 'action to be authorized with', NewsItem
  end

  describe 'GET #show' do
    let(:news_item) { create :news_item }

    subject { get :show, params: { id: news_item.id } }

    it_behaves_like 'action that is allowed for guests'
    it_behaves_like 'action to be authorized with', NewsItem

    include_context 'user is logged in' do
      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(news_item)
        subject
      end

      include_context 'user is authorized' do
        it_behaves_like 'successful request'
      end
    end
  end

  describe 'GET #new' do
    subject { get :new }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it_behaves_like 'action to be authorized with', NewsItem
      it_behaves_like 'action that redirects unauthorized user'

      include_context 'user is authorized' do
        it_behaves_like 'successful request'
      end
    end
  end

  describe 'POST #create' do
    let(:news_item_params) { attributes_for :news_item }

    subject { post :create, params: { news_item: news_item_params } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it_behaves_like 'action to be authorized with', NewsItem
      it_behaves_like 'action that redirects unauthorized user'

      include_context 'user is authorized' do
        context 'with valid params' do
          it 'creates a new news item' do
            expect do
              post :create, params: { news_item: news_item_params }
            end.to change(NewsItem, :count).by(1)
          end

          it 'redirects sets the right flash' do
            post :create, params: { news_item: news_item_params }
            expect(response).to redirect_to news_items_path
            expect(controller).to set_flash[:notice].to t('news_items.create.success')
          end
        end

        context 'with invalid params' do
          let(:invalid_params) { { title: nil } }

          it 'does not create a new news item' do
            expect do
              post :create, params: { news_item: invalid_params }
            end.not_to change(NewsItem, :count)
          end

          it 'sets the right flash' do
            post :create, params: { news_item: invalid_params }
            expect(controller).to set_flash[:alert].to t('news_items.create.failure')
          end
        end
      end
    end
  end

  describe 'GET #edit' do
    let(:news_item) { create :news_item }

    subject { get :edit, params: { id: news_item.id } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(news_item)
        get :edit, params: { id: news_item.id }
      end

      it_behaves_like 'action that redirects unauthorized user'

      include_context 'user is authorized' do
        it_behaves_like 'successful request'
      end
    end
  end

  describe 'PUT #update' do
    let(:news_item) { create :news_item }
    let(:news_item_params) { { title: 'New NewsItem Name' } }

    subject { put :update, params: { id: news_item.id, news_item: news_item_params } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(news_item)
        put :update, params: { id: news_item.id, news_item: news_item_params }
      end

      it_behaves_like 'action that redirects unauthorized user'

      include_context 'user is authorized' do
        context 'with valid params' do
          it 'updates the news_item' do
            expect do
              put :update, params: { id: news_item.id, news_item: news_item_params }
              news_item.reload
            end.to change(news_item, :title)
          end

          it 'sets the right flash' do
            put :update, params: { id: news_item.id, news_item: news_item_params }
            expect(response).to redirect_to news_items_path
            expect(controller).to set_flash[:notice].to eq t('news_items.update.success')
          end
        end

        context 'with invalid params' do
          let(:invalid_params) { { title: nil } }

          it 'does not update the news_item' do
            expect do
              put :update, params: { id: news_item.id, news_item: invalid_params }
              news_item.reload
            end.not_to change(news_item, :title)
          end

          it 'sets the right flash' do
            put :update, params: { id: news_item.id, news_item: invalid_params }
            expect(flash[:alert]).to eq t('news_items.update.failure')
          end
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:news_item) { create :news_item }

    subject { delete :destroy, params: { id: news_item.id } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(news_item)
        subject
      end

      it_behaves_like 'action that redirects unauthorized user'

      include_context 'user is authorized' do
        it 'deletes the resource' do
          expect { subject }.to change(NewsItem, :count).by(-1)
        end

        it 'redirects and sets the flash' do
          subject
          expect(response).to redirect_to news_items_path
          expect(controller).to set_flash[:notice].to t('news_items.destroy.success')
        end
      end
    end
  end
end
