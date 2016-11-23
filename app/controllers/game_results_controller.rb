class GameResultsController < ApplicationController
  def index
    @results = GameResult.all.order('played_at DESC')
  end
end
