class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    return unless current_user
    if current_user.account_type == "business"
      if current_user.business.present?
        redirect_to biz_business_path(current_user.business)
      else
        redirect_to new_biz_business_path
      end
    elsif current_user.account_type == "user"
      redirect_to tokens_path
    end
  end
end
