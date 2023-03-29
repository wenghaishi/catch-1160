class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    if resource.account_type == "business"
      new_business_path
    elsif resource.account_type == "user"
      tokens_path
    end
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  # def after_sign_in_path_for(resource)
  #   destroy_user_session_path
  # end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[username first_name last_name photo img_url banner_url banner
                                               account_type eth_address])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[username first_name last_name photo banner account_type])
  end
end
