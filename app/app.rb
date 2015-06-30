require 'sinatra/base'
require './app/models/link'
require './app/data_mapper_setup.rb'

class App < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :index
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect to('/links')
  end

  get '/links/new' do
    erb :new
  end
end
