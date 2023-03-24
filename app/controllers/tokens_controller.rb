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

  def show
    @tokens = Token.all
    @token = Token.find(params[:id])
    @user = current_user
  end

  # private

  # def check_user
  #   redirect_to root_path unless current_user
  # end
end
