class ScoresController < ApplicationController
  before_action :authenticate_user_from_token!, only: [:show, :create]

  def show
    @user = @current_user
    @score =  @user.score.maximum(:score)
    if @score.nil?
      render json: @score, each_serializer: ScoreSerializer
    else
      render json: { error: '404 error' }, status: 404
    end
  end

  def create
    @score = Score.create(score_params)
    if @score.save!
      render json: @score, serializer: ScoreSerializer, root: nil
    else
      render json: { error: t('score_save_error') }, status: :unprocessable_entity
    end
  end

  private

  def score_params
    params.require(:score).permit(:user_id, :score)
  end

  end