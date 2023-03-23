class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_signup
    if resource.account_type == "business"
      new_business_path
    elsif resource.account_type == "user"
      tokens_path
    end
  end

  def after_sign_in_path_for(resource)
    if resource.account_type == "business"
      new_business_path
    elsif resource.account_type == "user"
      tokens_path
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :photo, :img_url, :banner_url, :banner, :account_type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :photo, :banner, :account_type])
  end
end
