class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_and_authorize_organization, only: [:show, :edit, :update, :destroy]

  def index
    @organizations = Organization.all
    @organization = Organization.new
    authorize Organization
  end

  def edit
  end

  def create
    @organization = Organization.new(organization_params)
    authorize @organization

    if @organization.save
      redirect_to organizations_path, notice: t('.success')
    else
      redirect_to organizations_path, alert: t('.failure')
    end
  end

  def update
    if @organization.update(organization_params)
      redirect_to organizations_path, notice: t('.success')
    else
      flash.now[:alert] = t('.failure')
      render :edit
    end
  end

  def destroy
    @organization.destroy
    redirect_to organizations_url, notice: t('.success')
  end

  private
    def find_and_authorize_organization
      @organization = Organization.find(params[:id])
      authorize @organization
    end

    def organization_params
      params.require(:organization).permit(:name, :description, :logo)
    end
end

