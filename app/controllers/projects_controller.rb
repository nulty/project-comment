class ProjectsController < ApplicationController
  before_action :ensure_logged_in

  def show
    @project = Project.includes(:comments).find(params[:id])
    @comment = @project.comments.build(user: current_user)
  end

  def index
    @projects = Project.all
  end
end
