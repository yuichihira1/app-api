class ApplicationController < ActionController::API
  include AbstractController::Translation
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate_user_from_token!
  respond_to :json

  protected

  def authenticate_user_from_token!
    token = request.headers['Authorization']

    if token
      authenticate_with_token token
    else
      authenticate_error
    end
  end

  def set_user
    params[:access_token] = request.headers['Authorization']
    @user = User.find_by(access_token: params[:access_token])
    @user != nil ? true : false
  end





  private

  def authenticate_with_token token
    unless token.include?(':')
      authenticate_error
      return
    end

    user_id = token.split(':').first
    user = User.where(id: user_id).first

    if user && Devise.secure_compare(user.access_token, token)
      sign_in user, store: false
    else
      authenticate_error
    end
  end

##
# Authentication Failure
# Renders a 401 error
  def authenticate_error
    render json: { error: t('devise.failure.unauthenticated') }, status: 401
  end
end
