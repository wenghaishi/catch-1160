class UserController < ApplicationController
  before_action :redirect_if_business_account

  def redirect_if_business_account
    redirect_to biz_me_path if current_user&.account_type == "business"
  end
end
