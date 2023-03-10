class ProjectsController < ApplicationController
  before_action :ensure_logged_in

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
  end
end
