require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "flatiron_video_game_tracker"
  end

  get "/" do
    erb :welcome
  end

end
