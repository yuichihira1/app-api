class UsersController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:index, :create]
  


end
