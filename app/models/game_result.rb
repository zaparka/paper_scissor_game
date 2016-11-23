class GameResult < ActiveRecord::Base
  validates :player1_hand, :player2_hand, presence: true
end