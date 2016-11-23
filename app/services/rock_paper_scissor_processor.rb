class RockPaperScissorProcessor
  attr_reader :results, :player_hand, :player_name, :ai_hand

  def initialize(player_info)
    @player_name = player_info[:player_name]
    @player_hand = player_info[:player_hand]
  end

  def play
    generate_results
    store_results
  end

  private

  def generate_results
    @winner_hand = RockPaperScissorsLogic.who_wins?(player_hand, ai_hand)
    @results = { winner: winner_name, player1_hand: player_hand, player2_hand: ai_hand }
  end

  def winner_name
    if @winner_hand == player_hand
      player_name
    elsif @winner_hand == ai_hand
      'HALL 9000'
    else
      'No one'
    end
  end

  def ai_hand
    @ai_hand ||= RockPaperScissorsLogic::VARIANTS.sample
  end

  def store_results
    gr = results.merge(played_at: Time.now.to_s(:short))
    GameResult.create(gr)
  end

end
