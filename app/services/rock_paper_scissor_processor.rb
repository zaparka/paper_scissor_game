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
    win_result = RockPaperScissorsLogic.who_wins?(player_hand, ai_hand)
    @winner_hand = win_result[:winner]
    @results = {
      winner: winner_name,
      player1_hand: player_hand,
      player2_hand: ai_hand,
      winning_reason: win_result[:winning_reason]
    }
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
    gr.delete(:winning_reason)
    GameResult.create(gr)
  end

end
