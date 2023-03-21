class TokensController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @tokens = Token.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @tokens.geocoded.map do |t|
      {
        lat: t.latitude,
        lng: t.longitude
      }
    end
  end
end
