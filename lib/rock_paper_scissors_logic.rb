class RockPaperScissorsLogic
  VARIANTS = ['rock', 'paper', 'scissors']

  def self.who_wins?(hand1, hand2)
    if hand1 == 'paper' && hand2 == 'scissors' ||
      hand2 == 'paper' && hand1 == 'scissors'
      return { winner: 'scissors', winning_reason: 'Scissors cut Paper' }
    elsif hand1 == 'paper' && hand2 == 'rock' ||
      hand1 == 'rock' && hand2 == 'paper'
      return { winner: 'paper', winning_reason: 'Paper covers Rock' }
    elsif hand1 == 'rock' && hand2 == 'scissors' ||
      hand2 == 'rock' && hand1 == 'scissors'
      return { winner: 'rock', winning_reason: 'Rock breaks Scissors' }
    else
      return { winner: 'duece', winning_reason: 'Players have same hand' }
    end
  end
end