class Biz::BusinessesController < BizController
  def new
    @business = Business.new
  end

  def show
    @business = Business.find_by(id: params[:id], user_id: current_user.id)

    redirect_to root_path if @business.nil?
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
