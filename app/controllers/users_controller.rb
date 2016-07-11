class UsersController < ApplicationController

  skip_after_action :verify_authorized

  def show

    @user = User.find(params[:id])
    @topics = Topic.all
    
  end
end
