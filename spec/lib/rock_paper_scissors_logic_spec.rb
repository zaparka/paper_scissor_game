require 'rails_helper'

RSpec.describe RockPaperScissorsLogic do
  describe 'decide' do
    context 'rock breaks scissors' do
      it do
        winner = RockPaperScissorsLogic.who_wins?('rock', 'scissors')
        expect(winner).to eql('rock')
      end

      it do
        winner = RockPaperScissorsLogic.who_wins?('scissors','rock')
        expect(winner).to eql('rock')
      end
    end

    context "paper covers rock" do
      it do
        winner = RockPaperScissorsLogic.who_wins?('rock', 'paper')
        expect(winner).to eql('paper')
      end

      it do
        winner = RockPaperScissorsLogic.who_wins?('paper','rock')
        expect(winner).to eql('paper')
      end
    end

    context "scissors cut paper" do
      it do
        winner = RockPaperScissorsLogic.who_wins?('scissors', 'paper')
        expect(winner).to eql('scissors')
      end

      it do
        winner = RockPaperScissorsLogic.who_wins?('paper','scissors')
        expect(winner).to eql('scissors')
      end
    end
  end
end