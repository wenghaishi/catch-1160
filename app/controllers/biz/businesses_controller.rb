class Biz::BusinessesController < BizController
  def new
    @business = Business.new
  end

  def show
    @business = User.find(params[:id]).business
  end

  def create
    @business = Business.new(business_params)
    @business.user_id = current_user.id
    if @business.save
      redirect_to biz_business_path(@business)
    else
      render :new
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :address, :description)
  end
end
