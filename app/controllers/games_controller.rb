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
        @g = current_user.games.build(title: params[:title], 
                                      publisher: params[:publisher], 
                                      year_released: params[:year_released], 
                                      rating: params[:rating])

        if @g.save
            redirect '/games'
        else
            redirect '/games/new'
        end
    end

    get '/games/:id/edit' do
        if logged_in?
            @game = Game.find_by(id: params[:id])
            if @game.user_id == current_user.id
                erb :'games/edit'
            else
                redirect '/games'
            end
        else
            redirect '/login'
        end
    end

    delete '/games/:id' do
        if logged_in?
            @game = Game.find_by(id: params[:id])
            if @game.user_id == current_user.id
                @game.delete
                redirect '/games'
            else
                redirect '/games'
            end
        else
            redirect '/login'
        end
    end

    patch '/games/:id' do
        if logged_in?
            @game = Game.find_by(id: params[:id])

            if @game.update(title: params[:title], publisher: params[:publisher], year_released: params[:year_released], rating: params[:rating])
                redirect "/games"
            else
                redirect "/games/#{@game.id}/edit"
            end
        else
            redirect '/login'
        end
    end

    get '/games/:id' do
        @game = Game.find_by(id: params[:id])
        if @game
            erb :'games/show'
        else
            redirect '/games'
        end
    end

end
