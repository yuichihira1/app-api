class ApplicationController < ActionController::API
  include AbstractController::Translation

  respond_to :json

  def authenticate_user_from_token!
    auth_token = request.headers['Authorization']

    if auth_token
      authenticate_with_uth_token auth_token
    else
      authenticate_error
    end
  end
  
end
