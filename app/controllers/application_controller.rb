class ApplicationController < ActionController::Base
  private

  def ensure_logged_in
    if session[:user_id].blank?
      redirect_to root_path
    end
  end

  def current_user
    return nil unless signed_in?

    @current_user = User.find(session[:user_id])
  end

  def signed_in?
    session[:user_id].present?
  end
end
