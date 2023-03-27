require 'uri'
require 'net/http'
require 'openssl'

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

      # nft minting logic
      
      url = URI("https://api.nftport.xyz/v0/mints/easy/urls")

      # http = Net::HTTP.new(url.host, url.port)
      # http.use_ssl = true
      
      # request = Net::HTTP::Post.new(url)
      # request["accept"] = 'application/json'
      # request["content-type"] = 'application/json'
      # request["Authorization"] = 'ffbef1dc-c66a-4461-a936-800b290db517'
      # request.body = "{\"name\":\"haha\",\"description\":\"hahaha\",\"file_url\":\"https://res.cloudinary.com/dxovxcmmn/image/upload/v1678903041/yf3f0aiepplvfyy5gyrv.jpg\",\"mint_to_address\":\"0x4A771fDF27319180F49BbF151317Bafa306074A6\",\"chain\":\"polygon\"}"
      
      # response = http.request(request)
      # puts response.read_body

      # end of nft minting logic

      redirect_to biz_business_path(@token.business), notice: "Token created successfully."
    else
      render :new, notice: "Failed."
    end
  end

  private

  def token_params
    params.require(:token).permit(:address, :photo, :description, :conditions)
  end
end
