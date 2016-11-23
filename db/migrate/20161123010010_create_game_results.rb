class CreateGameResults < ActiveRecord::Migration
  def change
    create_table :game_results do |t|
      t.string :winner, null: false
      t.string :player1_hand
      t.string :player2_hand
      t.datetime :played_at, null: false
    end
  end
end
