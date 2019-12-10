class GamesController < ApplicationController

    get '/games' do
        if logged_in?
            @games = []
            all_games = Game.all

            all_games.each do |g|
                if g.user_id == current_user.id
                    @games << g
                end
            end

            erb :'games/index'
        else
            redirect '/login'
        end
    end



end