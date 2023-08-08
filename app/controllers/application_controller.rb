# Base class for all controllers in the application.
# Provides common functionality and behavior for controllers.

class ApplicationController < ActionController::Base
  helper_method :current_user, :current_user_id

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user_id
    current_user&.id
  end
end
