class BusinessesController < ApplicationController

  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    @business.user_id = current_user.id
    if @business.save
      redirect_to @business
    else
      render :new
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :address, :description, )
  end
end
