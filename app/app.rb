require 'sinatra/base'

class App < Sinatra::Base

  get '/links' do
  	@links = Link.all
  	erb :index
  end
end
