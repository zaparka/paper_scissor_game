module Api
  module V1
    class RockPaperScissorsController < APIBaseController
      def create
        rpsp = RockPaperScissorProcessor.new(player_info)
        if rpsp.play
          render json: { results: rpsp.results }.as_json
        else
          error_json = { errors: ['Failed to play a game'] }
          render json: error_json, status: :unprocessable_entity
        end
      end

      private
      def player_info
        params.require(:player).permit(:player_name, :player_hand)
      end
    end
  end
end