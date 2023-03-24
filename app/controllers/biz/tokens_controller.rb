class Biz::TokensController < BizController
  def new
    @token = Token.new
  end

  def create
    @token = Token.new(token_params)
    @token.collection_id = params[:collection_id]

    if @token.save
      redirect_to root_path, notice: "Token created successfully."
    else
      render :new, notice: "Failed."
    end
  end

  private

  def token_params
    params.require(:token).permit(:address)
  end
end
