class RockPaperScissorsLogic
  VARIANTS = ['rock', 'paper', 'scissors']

  def self.who_wins?(hand1, hand2)
    if hand1 == 'paper' && hand2 == 'scissors' ||
      hand2 == 'paper' && hand1 == 'scissors'
      return 'scissors'
    elsif hand1 == 'paper' && hand2 == 'rock' ||
      hand1 == 'rock' && hand2 == 'paper'
      return 'paper'
    elsif hand1 == 'rock' && hand2 == 'scissors' ||
      hand2 == 'rock' && hand1 == 'scissors'
      return 'rock'
    else
      'duece'
    end
  end
end