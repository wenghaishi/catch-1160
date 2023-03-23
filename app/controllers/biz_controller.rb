class BizController < ApplicationController
  before_action :validate_business

  def validate_business
    if current_user&.account_type == "business" && current_user.business.nil? && (request.path != "/biz/businesses/new" && request.path != "/biz/businesses")
      redirect_to new_biz_business_path
    elsif current_user&.account_type != "business"
      redirect_to root_path
    end
  end
end
