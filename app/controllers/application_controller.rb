# frozen_string_literal: true
class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception, prepend: true

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(_user)
    events_path
  end

  private

  def user_not_authorized
    flash[:alert]= t('unauthorized')
    redirect_back(fallback_location: root_path)
  end
end
