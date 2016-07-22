class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
    @project = Project.new
    authorize Project
  end

  def create

  end
end
