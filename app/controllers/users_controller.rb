class UsersController < ApplicationController

    get '/user/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        @u = User.new
        @u.username = params[:username]
        @u.password = params[:password]

        if @u.save
            redirect '/user/login'
        else
            redirect '/user/signup'
        end
    end

    get '/user/login' do
        erb :'users/login'
    end

    post '/login' do
        login(params[:username], params[:password])
        redirect '/games/show'
    end

    get '/user/logout' do
        logout
        redirect 'user/login'
    end

end