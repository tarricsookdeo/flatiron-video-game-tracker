class GamesController < ApplicationController

    get '/games' do
        if logged_in?
            @games = current_user.games

            erb :'games/index'
        else
            redirect '/login'
        end
    end

    get '/games/new' do
        erb :'games/new'
    end

    post '/games' do
        @g = current_user.games.build(title: params[:title], publisher: params[:publisher], year_released: params[:year_released], rating: params[:rating])

        if @g.save
            redirect '/games'
        else
            redirect '/games/new'
        end
    end

    delete '/games/:id' do
        if logged_in?
            @game = Game.find_by(id: params[:id])
            @game.delete
            redirect '/games'
        else
            redirect '/login'
        end
    end



end