class Biz::TokensController < BizController
  def new
    @token = Token.new
  end

  def create
    @token = Token.new(token_params)
    @token.business_id = params[:business_id].to_i

    if @token.save
      redirect_to root_path, notice: "Collection created successfully."
    else
      render :new
    end
  end

  private

  def token_params
    params.require(:collection).permit(:name, :description, :category)
  end
end
