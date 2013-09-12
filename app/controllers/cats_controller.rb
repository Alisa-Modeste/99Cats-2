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
    # make sure user owns cat. is this done here? or in update?
    @cat = Cat.find(params[:id])
    if @cat.user_id == current_user.id
      render :edit
    else
      # error message?
      flash[:notices] ||= []
      flash[:notices] << "That's not your cat!"
      redirect_to :back
    end
  end

  def update
    # make sure user owns cat. done here or in edit?
    Cat.find(params[:id]).update_attributes(params[:cat])

    redirect_to cat_url(params[:id]) #check
  end

  def create
    # add owner's userid to cat.
    p "current_user.id is #{current_user.id}"
    values = params[:cat].clone
    values[:user_id] = current_user.id
    Cat.create!(values)

    redirect_to cats_url
  end
end
