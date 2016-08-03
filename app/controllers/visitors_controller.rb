# frozen_string_literal: true
class VisitorsController < ApplicationController
  def index
    authenticate_user!
    authorize Visitor
    @visitors = Visitor.all
  end

  def create
    @visitor = Visitor.create(visitor_params)
    respond_to :js

    if @visitor.save
      render 'success'
    else
      render 'fail'
    end
  end

  private

  def visitor_params
    params.require(:visitor).permit(:email)
  end
end
