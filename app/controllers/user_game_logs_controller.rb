# frozen_string_literal: true

class UserGameLogsController < ApplicationController
  before_action :set_user_game_log, only: %i[show edit update destroy]

  # GET /user_game_logs
  # GET /user_game_logs.json
  def index
    @user_game_logs = UserGameLog.all
  end

  # GET /user_game_logs/1
  # GET /user_game_logs/1.json
  def show; end

  # GET /user_game_logs/new
  def new
    @user_game_log = UserGameLog.new
  end

  # GET /user_game_logs/1/edit
  def edit; end

  # POST /user_game_logs
  # POST /user_game_logs.json
  def create
    @user_game_log = UserGameLog.new(user_game_log_params)

    users = User.where(id: [user_game_log_params.player1_user_id, user_game_log_params.player2_user_id])
    first_user = users.find { |user| user.id ==  user_game_log_params.player1_user_id}
    second_user = users.find { |user| user.id ==  user_game_log_params.player2_user_id}

    require 'glicko2'

    # Objects to store Glicko ratings
    Rating = Struct.new(:rating, :rating_deviation, :volatility)
    rating1 = Rating.new(first_user.rating, first_user.rating_devitation, first_user.rating_volatility)
    rating2 = Rating.new(second_user.rating, second_user.rating_devitation, second_user.rating_volatility)
    # Rating period with all participating ratings
    period = Glicko2::RatingPeriod.from_objs [rating1, rating2]
    # Register a game where rating1 wins against rating2
    case user_game_log_params.result
    when 1 then
      period.game([rating1, rating2], [1,2])
    when 2 then
      period.game([rating1, rating2], [2,1])
    when 3 then
      period.game([rating1, rating2], [1,1])
    end
    # Generate the next rating period with updated players
    # 定数 τ は0.5で実装
    next_period = period.generate_next(0.5)
    # Update all Glicko ratings
    next_period.players.each { |p| p.update_obj }
    # Output updated Glicko ratings
    first_user.update(rating: rating1.rating, rating_devitation: rating1.rating_deviation, rating_volatility: rating1.volatility)
    second_user.update(rating: rating2.rating, rating_devitation: rating2.rating_deviation, rating_volatility: rating2.volatility)

    respond_to do |format|
      if @user_game_log.save
        format.html { redirect_to @user_game_log, notice: 'User game log was successfully created.' }
        format.json { render :show, status: :created, location: @user_game_log }
      else
        format.html { render :new }
        format.json { render json: @user_game_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_game_logs/1
  # PATCH/PUT /user_game_logs/1.json
  def update
    respond_to do |format|
      if @user_game_log.update(user_game_log_params)
        format.html { redirect_to @user_game_log, notice: 'User game log was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_game_log }
      else
        format.html { render :edit }
        format.json { render json: @user_game_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_game_logs/1
  # DELETE /user_game_logs/1.json
  def destroy
    @user_game_log.destroy
    respond_to do |format|
      format.html { redirect_to user_game_logs_url, notice: 'User game log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_game_log
    @user_game_log = UserGameLog.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_game_log_params
    params.require(:user_game_log).permit(:player1_user_id, :player2_user_id, :result, :player1_before_rate, :player1_after_rate, :player2_before_rate, :player2_after_rate, :first_player, :kifu, :rule)
  end
end
