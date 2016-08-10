# frozen_string_literal: true
class ContactsController < ApplicationController
  def index
    authenticate_user!
    authorize Contact
    @contacts = Contact.all
  end

  def create
    @contact = Contact.create(contact_params)
    respond_to :js

    if @contact.save
      render 'success'
    else
      render 'fail'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email)
  end
end
