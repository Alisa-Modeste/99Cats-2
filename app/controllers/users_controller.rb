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

  def show
    cats = []
    cats = current_user.cats unless current_user.nil?
    @cat_arr = []
    cats.each do |cat|
      @cat_arr << [cat, cat.cat_rental_requests]
    end
    render :show
  end

end
