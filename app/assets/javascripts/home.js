jQuery(function($) {
  $(".game_page section.results").hide();
  $("#game_form")
    .bind("ajax:success", function(event, data, status, xhr) {
      $(".game_page section.results").show();
      $(".game_page h5>span:nth-child(1)").html(data.results.winner);
      $(".game_page h5>span:nth-child(2)").html(data.results.winning_reason);
      player1_info = $('#player_player_name').val() + " had " + data.results.player1_hand;
      player2_info = "HALL 9000 had " + data.results.player2_hand;
      $(".game_page p.player_info").html(player1_info + " and " + player2_info);
    });
});