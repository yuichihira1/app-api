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

  def current_user
    # 初回リクエストでユーザーを1件探す。
    params[:email] = request.headers['EMAIL_NAME']
    @current_user = @current_user || User.find_by(email: params[:email])
    if @current_user.nil?
      User.find_by(email: params[:email])
    else
      @current_user
    end
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
