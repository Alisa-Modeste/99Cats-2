class SessionsController < ApplicationController
  def create

    user_name = params[:user][:user_name]
    password = params[:user][:password]
    user = User.find_by_credentials(user_name, password)

    if user.nil?
      render :new # give a flash message
    else
      user.reset_session_token!
      user.save
      self.current_user = user

      redirect_to cats_url
    end

  end

  def new
    render :new
  end

  def destroy
    p "HERE"
    current_user.reset_session_token!
    self.end_session
    redirect_to cats_url
  end
end
