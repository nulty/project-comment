class ApplicationController < ActionController::Base
  private

  def ensure_logged_in
    if session[:user_id].blank?
      redirect_to root_path
    end
  end
end
