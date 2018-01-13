class UsersController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:index, :create]

  def index
  # サーバーにアクセスした時に表示する。
    message = { top: 'Hello, API'}
    render json: message
  end

  def show(current_user)
    # get通信時のリクエストヘッダを取得
    @user = @current_user
    render json: @user, each_serializer: UserSerializer
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
    params.require(:user).permit(:email, :password, :name)
  end

end

