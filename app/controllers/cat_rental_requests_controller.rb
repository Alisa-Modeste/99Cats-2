class CatRentalRequestsController < ApplicationController

  def new
    @cats = Cat.all
    render :new
  end

  def create
    cat_rental_request = CatRentalRequest.new(params[:cat_rental_request])

    if cat_rental_request.save
      redirect_to cats_url
    else
      redirect_to :back
    end
  end

  def approve
    CatRentalRequest.find(params[:cat_rental_request_id]).approve!
    redirect_to :back
  end

  def deny
    CatRentalRequest.find(params[:cat_rental_request_id]).deny!
    redirect_to :back
  end

end
