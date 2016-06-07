class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:alert] = t('must_be_invited')
    redirect_to request.referrer || root_path
  end
end
