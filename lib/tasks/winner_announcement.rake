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
          Winner.create(:gameplay=>game_play)
        end
      end
      Game.get_next_game.update_attributes(:status=>Game::ON_GOING)
    end
    logger.info("Winners Anouncment Fiished")
  end
end