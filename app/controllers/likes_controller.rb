class LikesController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  skip_after_action :verify_authorized, except: [:create, :destroy]

  def index
    @likes = Like.all
    @bookmarks = Bookmark.all
  end

  def create

    bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: bookmark)
    authorize like

    if like.save
      flash[:notice] = "Bookmark liked."
    else
      flash[:alert] = "Like failed."
    end

    redirect_to :back
  end

  def destroy
    bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = "Bookmark unliked."
    else
      flash[:alert] = "Unliking failed."
    end
    redirect_to :back
  end

end
