class SessionsController < ApplicationController
  skip_before_action :authenticate_user_from_token!

  # Get session
  def show
    params[:email] = request.headers['HTTP_EMAIL']
    params[:password] = request.headers['HTTP_PASSWORD']
    @user = User.find_by(email: params[:email], password: params[:password])

    if @user.nil?
      render json: @user, serializer: SessionSerializer, root: nil
    else
      render json: { error: '404 error' }, status: 404
    end
  end

  # POST login
  def create
    @user = User.find_for_database_authentication(email: params[:email])
    return invalid_email unless @user

    if @user.valid_password?(params[:password])
      sign_in :user, @user
      render json: @user, serializer: SessionSerializer, root: nil
    else
      invalid_password
    end
  end

    private
    def invalid_email
      warden.custom_failure!
      render json: { error: t('invalid_email') }
    end

    def invalid_password
      warden.custom_failure!
      render json: { error: t('invalid_password') }
    end

end
