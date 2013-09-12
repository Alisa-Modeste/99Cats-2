class UsersController < ApplicationController
  def new
    render :new
  end

  def create

    user = User.new(params[:user])


    if user.save!
      redirect_to new_session_url # ?
    else
      # display errors somehow?
      redirect_to new_user_url
    end
  end

end
