# define a custom Devise strategy
class DemoAuthStrategy < Devise::Strategies::Base
  def valid?
    # check if the request is for the demo login path
    request.path_info == '/demo/login'
  end

  def authenticate!
    # find the test user account
    test_user = User.find_by(email: 'user@gym.com')

    # bypass authentication for the test user account
    if test_user.present?
      success!(test_user)
    else
      fail!(:invalid)
    end
  end
end

# register the custom Devise strategy
Warden::Strategies.add(:demo_auth_strategy, DemoAuthStrategy)