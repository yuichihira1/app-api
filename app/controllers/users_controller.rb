class UsersController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:index, :create]

　 def index
  # サーバーにアクセスした時に表示する。
    message = { top: 'Hello, API'}
    render json: message
end


end
