class UsersController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:index, :create]
  before_action :set_user, only: [:show]

  def index
  # サーバーにアクセスした時に表示する。
    message = { top: 'Hello, API'}
    render json: message
  end

  def show
    if @user = true
      render json: @user, each_serializer: UserSerializer
    else
      render json: { error: '404 error' }, status: 404
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      render json: @user, serializer: UserSerializer, root: nil
    else
      render json: { error: t('user_create_error')}, status: :unprocessable_entity
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :access_token)
  end

end

