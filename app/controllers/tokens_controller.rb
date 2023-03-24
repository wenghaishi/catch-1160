class TokensController < UserController
  skip_before_action :authenticate_user!

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
    @token.save
    redirect_to user_path(current_user)
  end
end
