class UsersController < ApplicationController

    get '/user/signup' do
        erb :'users/signup'
    end
    
end