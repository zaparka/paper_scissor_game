require 'rails_helper'

RSpec.describe RockPaperScissorsLogic do
  describe 'decide' do
    context 'rock breaks scissors' do
      it do
        result = RockPaperScissorsLogic.who_wins?('rock', 'scissors')
        expect(result[:winner]).to eql('rock')
        expect(result[:winning_reason]).to eql('Rock breaks Scissors')
      end

      it do
        result = RockPaperScissorsLogic.who_wins?('scissors','rock')
        expect(result[:winner]).to eql('rock')
        expect(result[:winning_reason]).to eql('Rock breaks Scissors')
      end
    end

    context "paper covers rock" do
      it do
        result = RockPaperScissorsLogic.who_wins?('rock', 'paper')
        expect(result[:winner]).to eql('paper')
        expect(result[:winning_reason]).to eql('Paper covers Rock')
      end

      it do
        result = RockPaperScissorsLogic.who_wins?('paper','rock')
        expect(result[:winner]).to eql('paper')
        expect(result[:winning_reason]).to eql('Paper covers Rock')
      end
    end

    context "scissors cut paper" do
      it do
        result = RockPaperScissorsLogic.who_wins?('scissors', 'paper')
        expect(result[:winner]).to eql('scissors')
        expect(result[:winning_reason]).to eql('Scissors cut Paper')
      end

      it do
        result = RockPaperScissorsLogic.who_wins?('paper','scissors')
        expect(result[:winner]).to eql('scissors')
        expect(result[:winning_reason]).to eql('Scissors cut Paper')
      end
    end
  end
end