require 'uri'
require 'net/http'
require 'openssl'

class TokensController < UserController
  skip_before_action :authenticate_user!
  # before_action :check_user

  def index
    @tokens = Token.available
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

  def capture
    @token = Token.find(params[:token_id])
    @token.user = current_user


    @nft_picture = Cloudinary::Utils.cloudinary_url(@token.id, version: @token.id)

    # nft minting logic

    url = URI("https://api.nftport.xyz/v0/mints/easy/urls")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    
    request = Net::HTTP::Post.new(url)
    request["accept"] = 'application/json'
    request["content-type"] = 'application/json'
    request["Authorization"] = 'ffbef1dc-c66a-4461-a936-800b290db517'
    request.body = "{\"name\":\"#{@token.id}\",\"description\":\"#{@token.description}\",\"file_url\":\"#{@nft_picture}\",\"mint_to_address\":\"0x4A771fDF27319180F49BbF151317Bafa306074A6\",\"chain\":\"polygon\"}"
    
    response = http.request(request)
    puts response.read_body

    # end of nft minting logic
    
    @token.save
    redirect_to token_path(@token)
  end

  def show
    # @tokens = Token.all
    @token = Token.find(params[:id])
    @user = current_user
  end

  # private

  # def check_user
  #   redirect_to root_path unless current_user
  # end
end
