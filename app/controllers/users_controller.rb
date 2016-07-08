class UsersController < ApplicationController

  skip_after_action :verify_authorized

  def show

    @user = User.find(params[:id])
    @bookmarks = @user.bookmarks
    @liked_bookmarks = @user.liked_bookmarks

  end
end
