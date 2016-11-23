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
      allow(processor).to receive(:store_results).and_return true
      expect(trigger).to be_truthy
      expect(processor.results[:winner]).to eql('HALL 9000')
    end

    it "store result of a game" do
      allow(Time).to receive(:now).and_return(Time.parse('23 Nov 01:06'))

      allow(processor).to receive(:ai_hand).and_return 'paper'
      expect(trigger).to be_truthy
      result = GameResult.last
      expect(result.winner).to eql('HALL 9000')
      expect(result.player1_hand).to eql('rock')
      expect(result.player2_hand).to eql('paper')
      expect(result.played_at.to_s(:short)).to eql('23 Nov 01:06')
    end
  end
end