# frozen_string_literal: true
class NewsItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    authorize NewsItem
    @news_items = NewsItem.all
  end

  def show
    @news_item = find_news_item
    authorize @news_item
  end

  def new
    authorize NewsItem
    @news_item = NewsItem.new
  end

  def create
    @news_item = NewsItem.new(news_item_params)
    authorize NewsItem

    if @news_item.save
      redirect_to news_items_path, notice: t('.success')
    else
      flash[:alert] = t('.failure')
      render :new
    end
  end

  def edit
    @news_item = find_news_item
    authorize @news_item
  end

  def update
    @news_item = find_news_item
    authorize @news_item

    if @news_item.update(news_item_params)
      redirect_to news_items_path, notice: t('.success')
    else
      flash[:alert] = t('.failure')
      render :new
    end
  end

  def destroy
    @news_item = find_news_item
    authorize @news_item
    @news_item.destroy
    redirect_to news_items_path, notice: t('.success')
  end

  private

  def find_news_item
    NewsItem.find(params[:id])
  end

  def news_item_params
    params.require(:news_item).permit(:title, :description)
  end
end
