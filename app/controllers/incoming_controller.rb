class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    # binding.pry

    mail_user = params[:sender]
    @user = User.find_by email: mail_user
    if !@user
      @user = User.new(
        name: mail_user,
        email: mail_user,
        password: 'password'
      )
      @user.skip_confirmation!
      @user.save!
    end




    mail_topic = params[:subject]
    @topic = Topic.find_by title: mail_topic

    if !@topic
      @topic = Topic.new(
        title: mail_topic,
        user: @user
      )
    @topic.save!
    end






    mail_url = params["body-plain"]

    @bookmark = Bookmark.new
    @bookmark.topic = @topic
    @bookmark.url = mail_url

    @bookmark.save

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
