class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper

  def check_for_login
    if params[:cat].nil?
      crr = CatRentalRequest.find(params[:cat_rental_request_id])
      owner_id = crr.cat.owner.id
    else
      owner_id = params[:cat].user_id
    end

    unless owner_id == current_user.id
      redirect_to :back, notice: "That's not your cat!"
    end
  end

end
