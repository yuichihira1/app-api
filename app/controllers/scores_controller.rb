class ScoresController < ApplicationController
  before_action :authenticate_user_from_token!, only: [:create, :show]

  def show

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