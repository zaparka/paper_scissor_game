require 'rails_helper'

RSpec.describe RockPaperScissorProcessor do
  subject(:processor) { RockPaperScissorProcessor.new(player_info) }
  let(:player_info) {{
    player_name: 'Luke',
    player_hand: 'rock'
  }}

  def trigger
    processor.play
  end

  describe "Play" do
    it "call AI for it's hand and compare" do
      allow(processor).to receive(:ai_hand).and_return 'paper'
      allow(processor).to receive(:store_results)
      expect(trigger).to be_truthy
      expect(processor.results[:winner]).to eql('HAll 9000')
    end

    it "store result of a game" do
      allow(processor).to receive(:ai_hand).and_return 'paper'
      expect(trigger).to be_truthy
      expect(GameResult).to receive(:create).with({
        winner: 'Name',
        player1_hand: 'rock',
        player2_hand: 'paper',
        played_at: Time.now.to_s(:short)
      })
    end
  end
end