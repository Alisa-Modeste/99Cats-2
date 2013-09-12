class CatsController < ApplicationController
  def index
    @cats = Cat.all

    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    @cat_rental_requests = CatRentalRequest.where(cat_id: params[:id]).order(:start_date)

    render :show
  end

  def new
    render :new
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    Cat.find(params[:id]).update_attributes(params[:cat])

    redirect_to cat_url(params[:id]) #check
  end

  def create
    Cat.create!(params[:cat])

    redirect_to cats_url
  end
end
