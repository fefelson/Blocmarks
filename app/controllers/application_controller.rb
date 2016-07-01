class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_authorized, except: :index

  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    flash[:alert] = "You are not authorized to do that."
    redirect_to user_path(current_user)
  end

end
