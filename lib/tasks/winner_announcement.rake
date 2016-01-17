namespace :winner_announcement do
  task announce_winner: :environment do
    logger=Logger.new("#{Rails.root}/log/winners.log")
    logger.info("Winners Anouncment started")
    game=Game.get_today_game
    logger.info("ERROR:: There is no ongoing game") unless game
    Winner.transaction do
      if game
        game.update_attributes :status=> Game::PLAYED
        game.winner_gameplays.each do |game_play|
          Winner.create(:gameplay_id=>game_play.id)
        end
      end
      next_competition=Game.get_next_game
      next_competition.update_attributes(:status=>Game::ON_GOING,:played_on=>Time.now) if next_competition
      logger.info("ERROR:: There is no game Left To Play") unless next_competition
    end
    logger.info("Winners Anouncment Fiished")
  end
end