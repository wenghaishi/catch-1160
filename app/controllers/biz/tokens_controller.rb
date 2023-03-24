class Biz::TokensController < BizController
  def index
    @tokens = Business.find(params[:business_id]).tokens
    # The `geocoded` scope filters only flats with coordinates
    @markers = @tokens.geocoded.map do |t|
      {
        lat: t.latitude,
        lng: t.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { token: t }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def new
    @token = Token.new
  end

  def create
    @token = Token.new(token_params)
    @token.collection_id = params[:collection_id]

    if @token.save
      redirect_to biz_business_path(@token.business), notice: "Token created successfully."
    else
      render :new, notice: "Failed."
    end
  end

  private

  def token_params
    params.require(:token).permit(:address, :photo)
  end
end
