class UserController < ApplicationController
  before_action :redirect_if_business_account

  def redirect_if_business_account
    return unless current_user&.account_type == "business"

    if current_user.business.nil?
      redirect_to new_biz_business_path
    else
      redirect_to biz_business_path(current_user.business.id)
    end
  end
end
