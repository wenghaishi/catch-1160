class Biz::TokensController < BizController
  def index
    @tokens = Business.find(params[:business_id]).tokens
    # The `geocoded` scope filters only flats with coordinates
    @markers = @tokens.geocoded.map do |t|
      {
        lat: t.latitude,
        lng: t.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { token: t }),
        markerbiz_html: render_to_string(partial: "markerbiz")
      }
    end
  end

  def new
    @business = Business.find(params[:business_id])
    @collection = Collection.find(params[:collection_id])
    @tokens = []
    params[:tokens_count].to_i.times do
      @tokens << Token.new
    end
  end

  def create
    @token = Token.new(token_params)
    @business = Business.find(params[:business_id])
    @collection = Collection.find(params[:collection_id])

    uploaded_file = token_params[:photo]
    unless uploaded_file.nil?
      cl_upload = Cloudinary::Uploader.upload(uploaded_file)
      @token.url = cl_upload["secure_url"]
    end

    @token.collection_id = params[:collection_id]

    respond_to do |format|
      if @token.save
        format.html { redirect_to biz_business_path(@token.business), notice: "Token created successfully." }
      else
        format.html { render :new, notice: "Failed." }
      end
      format.json
    end
  end

  private

  def token_params
    params.require(:token).permit(:address, :photo, :description, :conditions)
  end
end
