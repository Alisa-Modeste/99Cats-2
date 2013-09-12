class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    p "PARAMS"
    p params
    user = User.new(params[:user])

    p json: user
    if user.save!
      redirect_to cats_url # ?
    else
      # display errors somehow?
      p "Yep errro"
      p json: user
      redirect_to new_user_url
    end
  end
end
