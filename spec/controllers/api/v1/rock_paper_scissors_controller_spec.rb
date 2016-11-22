require 'rails_helper'
RSpec.describe Api::V1::RockPaperScissorsController do
  describe 'POST create' do
    let(:rpsp) { instance_double('RockPaperScissorService') }
    let(:results) {{
      player1: 'paper',
      player2: 'rock',
      winner: 'player1'
    }}
    let(:player_info) {{ player_name: 'Luke', player_hand: 'paper' }}

    context 'success' do
      it "call AI for it's hand and return result" do
        expect(RockPaperScissorProcessor).to receive(:new).with(player_info).and_return rpsp
        expect(rpsp).to receive(:play).and_return true
        expect(rpsp).to receive(:results).and_return results
        post :create, player: player_info, format: :json
        expect(response.code).to eql('200')
        expect_json('results',
          player1: 'paper',
          player2: 'rock',
          winner: 'player1')
      end
    end

    context 'fail' do
      it "call AI for it's hand and return result" do
        expect(RockPaperScissorProcessor).to receive(:new).and_return rpsp
        expect(rpsp).to receive(:play).and_return false
        expect(rpsp).not_to receive(:results)
        post :create, player: player_info, format: :json
        expect(response.code).to eql('422')
        expect_json(errors: ['Failed to play a game'])
      end
    end
  end
end
