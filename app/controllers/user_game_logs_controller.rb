# frozen_string_literal: true

class UserGameLogsController < ApplicationController
  before_action :set_user_game_log, only: %i[show edit update destroy]

  # GET /user_game_logs
  # GET /user_game_logs.json
  # def index
  #   @user_game_logs = UserGameLog.all
  # end

  # GET /user_game_logs/1
  # GET /user_game_logs/1.json
  # def show; end

  # GET /user_game_logs/new
  def new
    @user_game_log ||= UserGameLog.new
  end

  # GET /user_game_logs/1/edit
  # def edit; end

  def preview
    @user_game_log = UserGameLog.new(user_game_log_params)
    @user_game_log.id = user_game_log_params[:id] if user_game_log_params[:id]
    render :new unless @user_game_log.valid?
  end

  def create
    if user_game_log_params[:player1_user_id].nil?
      format.html { redirect_to user_geme_logs_new_path, notice: 'あなたのユーザー名を選択してください' }
    end
    @user_game_log = UserGameLog.new(user_game_log_params)
    respond_to do |format|
      if user_game_log_params[:back]
        format.html { render action: :new }
      elsif ResultService.new(@user_game_log).execute
        format.html { redirect_to users_path, notice: 'user_game_log was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @user_game_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_game_logs/1
  # PATCH/PUT /user_game_logs/1.json
  # def update
  #   respond_to do |format|
  #     if @user_game_log.update(user_game_log_params)
  #       format.html { redirect_to @user_game_log, notice: 'User game log was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @user_game_log }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @user_game_log.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /user_game_logs/1
  # DELETE /user_game_logs/1.json
  # def destroy
  #   @user_game_log.destroy
  #   respond_to do |format|
  #     format.html { redirect_to user_game_logs_url, notice: 'User game log was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

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
