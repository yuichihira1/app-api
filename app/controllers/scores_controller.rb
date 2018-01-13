class ScoresController < ApplicationController
  before_action :authenticate_user_from_token!, only: [:show, :create]

  def show
    params[:email] = request.headers['EMAIL_NAME']
    @user = User.find_by(email: params[:email])
    @score =  @user.scores.maximum(:score)
    render json: @score, each_serializer: ScoreSerializer

  end

  def create
    @score = Score.create(score_params)
    if score.save
      render json: @score, serializer: ScoreSerializer, root: nil
    else
      render json: { error: t('score_save_error') }, status: :unprocessable_entity
    end
  end

  private

  def score_params
    require(:score).params.permit(:user_id, :score)
  end

  end