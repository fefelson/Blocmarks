class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    mail_user = params[:user]
    if !User.exists?(name: mail_user)
      user = User.new(
        name: mail_user,
        email: mail_user,
        password: 'password'
      )
      user.skip_confirmation!
      user.save!
    end

    @user = User.find_by email: mail_user


    mail_topic = params[:subject]
    if !Topic.exists?(title: mail_topic)
      topic = Topic.new(
        title: mail_topic,
        user: @user
      )
    topic.save!
    end

    @topic = Topic.find_by title: mail_topic





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
