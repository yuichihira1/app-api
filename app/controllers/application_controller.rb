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

##
# Authentication Failure
# Renders a 401 error
def authenticate_error
  render json: { error: t('devise.failure.unauthenticated') }, status: 401
end