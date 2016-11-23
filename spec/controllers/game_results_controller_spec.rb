require 'rails_helper'
RSpec.describe GameResultsController do
  describe 'GET index' do
    let!(:result1) { GameResult.create(winner: 'HALL 9000', player1_hand: 'rock', player2_hand: 'paper', played_at: 1.day.ago) }
    let!(:result2) { GameResult.create(winner: 'Lucke', player1_hand: 'scissors', player2_hand: 'paper', played_at: 1.minute.ago) }

    it "render result page with order results" do
      get :index
      expect(response).to render_template("index")
      results = assigns(:results)
      expect(results.first.winner).to eql('Lucke')
      expect(results.last.winner).to eql('HALL 9000')
    end
  end
end
