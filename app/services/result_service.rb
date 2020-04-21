# frozen_string_literal: true

require 'glicko2'
class ResultService < BaseService
  Rating = Struct.new(:rating, :rating_deviation, :volatility)

  def initialize(user_game_log)
    @user_game_log = user_game_log
    users = User.where(id: [@user_game_log.player1_user_id, @user_game_log.player2_user_id])
    @first_user = users.find { |user| user.id == @user_game_log.player1_user_id }
    @second_user = users.find { |user| user.id == @user_game_log.player2_user_id }

    # Objects to store Glicko ratings
    @rating1 = Rating.new(@first_user.rating, @first_user.rating_deviation, @first_user.rating_volatility)
    @rating2 = Rating.new(@second_user.rating, @second_user.rating_deviation, @second_user.rating_volatility)
    # @player1 = Glicko2::Player.from_obj(@rating1)
    # @player2 = Glicko2::Player.from_obj(@rating2)

    validate
  end

  def validate; end

  def execute
    record_before_rate
    # Rating period with all participating ratings
    period = Glicko2::RatingPeriod.from_objs [@rating1, @rating2]
    # Register a game where rating1 wins against rating2
    binding.pry
    if @user_game_log.win?
      period.game([@rating1, @rating2], [1, 2])
      @first_user.win
      @second_user.lose
    elsif @user_game_log.lose?
      period.game([@rating1, @rating2], [2, 1])
      @first_user.lose
      @second_user.win
    elsif @user_game_log.draw?
      period.game([@rating1, @rating2], [1, 1])
      @first_user.draw
      @second_user.draw
    end
    # Generate the next rating period with updated players
    # 定数 τ は0.5で実装
    next_period = period.generate_next(0.5)
    # Update all Glicko ratings
    next_period.players.each(&:update_obj)
    # Output updated Glicko ratings
    @first_user.update(rating: @rating1.rating, rating_deviation: @rating1.rating_deviation, rating_volatility: @rating1.volatility)
    @second_user.update(rating: @rating2.rating, rating_deviation: @rating2.rating_deviation, rating_volatility: @rating2.volatility)
    record_after_rate
  end

  private

  def record_before_rate
    @user_game_log.player1_before_rate = @first_user.rating
    @user_game_log.player2_before_rate = @second_user.rating
  end

  def record_after_rate
    @user_game_log.player1_after_rate = @first_user.rating
    @user_game_log.player2_after_rate = @second_user.rating
    @user_game_log.save!
  end
end
