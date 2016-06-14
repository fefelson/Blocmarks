class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    mail_user = params[:user]
    @user = User.find_by name: mail_user

    mail_topic = params[:subject]
    @topic = Topic.find_by title: mail_topic

    @bookmark = params["body-plain"]

    redirect_to url_for("bookmark" => {"url" => @bookmark }, "topic_id" => @topic.id, "controller" => "bookmarks", "action" => "create")
    # You put the message-splitting and business
    # magic here.
     # Find the user by using params[:sender]
     # Find the topic by using params[:subject]
     # Assign the url to a variable after retreiving it from params["body-plain"]

     # Check if user is nil, if so, create and save a new user

     # Check if the topic is nil, if so, create and save a new topic

     # Now that you're sure you have a valid user and topic, build and save a new bookmark


    # Assuming all went well.
    head 200
  end

end
