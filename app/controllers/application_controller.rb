class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[username first_name last_name photo img_url banner_url banner
                                               account_type])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[username first_name last_name photo banner account_type])
  end
end
