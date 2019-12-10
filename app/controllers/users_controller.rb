class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        @u = User.new
        @u.username = params[:username]
        @u.password = params[:password]

        if @u.save
            redirect '/login'
        else
            redirect '/signup'
        end
    end

    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        login(params[:username], params[:password])
        redirect '/games'
    end

    get '/logout' do
        logout
        redirect '/login'
    end

end