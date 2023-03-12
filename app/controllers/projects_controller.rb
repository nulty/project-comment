class ProjectsController < ApplicationController
  before_action :ensure_logged_in

  def show
    @project = Project.includes(:comments).find(params[:id])
  end

  def index
    @projects = Project.all
  end

  def comment
    project = Project.find(params[:id])

    comment = project.comments.new(comment_params.merge({ user_id: current_user.id }))

    respond_to do |format|
      if comment.save
        @activity = comment.activity

        format.turbo_stream do
          result = [
            turbo_stream.append(:activities, partial: 'projects/associated_activity', locals: { a: @activity }),
            turbo_stream.replace(:'comment-form', partial: 'projects/comment_form', locals: { project: })
          ]

          render turbo_stream: result
        end
        format.html { redirect_to project_url(project) }

      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :project_id)
  end
end
